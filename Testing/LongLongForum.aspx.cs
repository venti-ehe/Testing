using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Testing
{
    public partial class LongLongForum : Page
    {
        private const string TokenCookie = "ll_owner";   // random id that proves "this is my post"
        private const string NameCookie = "ll_name";     // remembers the display name for next time
        private string _token;

        // ---------------------------------------------------------------
        //  Page lifecycle
        // ---------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategory.DataSource = ForumStore.Categories;
                ddlCategory.DataBind();

                string name = SavedName();
                txtAuthor.Text = name;
                txtReplyAuthor.Text = name;
            }
        }

        // Everything is re-bound in PreRender so it always shows the latest data
        // after a create / edit / delete has been handled.
        protected void Page_PreRender(object sender, EventArgs e)
        {
            string threadId = Request.QueryString["t"];

            if (string.IsNullOrEmpty(threadId))
            {
                ShowList();
                return;
            }

            ForumPost thread = ForumStore.Get(threadId);
            if (thread == null || thread.IsReply)
            {
                pnlList.Visible = false;
                pnlThread.Visible = false;
                pnlMissing.Visible = true;
                return;
            }

            ShowThread(thread);
        }

        // ---------------------------------------------------------------
        //  Views
        // ---------------------------------------------------------------
        private void ShowList()
        {
            pnlList.Visible = true;
            pnlThread.Visible = false;
            pnlMissing.Visible = false;

            string category = Request.QueryString["cat"] ?? "";
            if (!ForumStore.Categories.Contains(category)) category = "";

            // category sidebar
            var counts = ForumStore.CategoryCounts();
            var cats = new List<object>();
            cats.Add(new
            {
                Name = "All discussions",
                Count = counts.Values.Sum(),
                Url = ResolveUrl("~/LongLongForum.aspx"),
                CssClass = category == "" ? "on" : ""
            });
            foreach (string c in ForumStore.Categories)
            {
                cats.Add(new
                {
                    Name = c,
                    Count = counts[c],
                    Url = ResolveUrl("~/LongLongForum.aspx?cat=" + Server.UrlEncode(c)),
                    CssClass = c == category ? "on" : ""
                });
            }
            rptCategories.DataSource = cats;
            rptCategories.DataBind();

            // totals
            int threadTotal, replyTotal;
            ForumStore.GetTotals(out threadTotal, out replyTotal);
            litThreads.Text = threadTotal.ToString(CultureInfo.InvariantCulture);
            litReplies.Text = replyTotal.ToString(CultureInfo.InvariantCulture);

            // thread list
            var threads = ForumStore.GetThreads(category);
            rptThreads.DataSource = threads;
            rptThreads.DataBind();
            pnlEmpty.Visible = threads.Count == 0;
        }

        private void ShowThread(ForumPost thread)
        {
            pnlList.Visible = false;
            pnlMissing.Visible = false;
            pnlThread.Visible = true;

            litThreadInitial.Text = thread.Initial;
            litThreadAuthor.Text = thread.Author;
            litThreadWhen.Text = When(thread.Created);
            litThreadEdited.Text = EditedNote(thread.Edited);
            litThreadCategory.Text = thread.Category;
            litThreadTitle.Text = thread.Title;
            litThreadBody.Text = thread.Body;

            bool mine = CanModify(thread.OwnerToken);
            lnkEditThread.Visible = mine;
            lnkDeleteThread.Visible = mine;

            var replies = ForumStore.GetReplies(thread.Id);
            litReplyCount.Text = replies.Count.ToString(CultureInfo.InvariantCulture);
            rptReplies.DataSource = replies;
            rptReplies.DataBind();

            pnlEdit.Visible = !string.IsNullOrEmpty(hfEditId.Value);
        }

        // ---------------------------------------------------------------
        //  CREATE
        // ---------------------------------------------------------------
        protected void btnPost_Click(object sender, EventArgs e)
        {
            Page.Validate("NewThread");
            if (!Page.IsValid) return;

            RememberName(txtAuthor.Text);
            string id = ForumStore.AddThread(txtAuthor.Text, ddlCategory.SelectedValue, txtTitle.Text, txtBody.Text, EnsureToken());

            Response.Redirect("~/LongLongForum.aspx?t=" + Server.UrlEncode(id), false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            Page.Validate("Reply");
            if (!Page.IsValid) return;

            RememberName(txtReplyAuthor.Text);
            ForumStore.AddReply(Request.QueryString["t"], txtReplyAuthor.Text, txtReplyBody.Text, EnsureToken());
            txtReplyBody.Text = "";
        }

        // ---------------------------------------------------------------
        //  UPDATE
        // ---------------------------------------------------------------
        protected void lnkEditThread_Click(object sender, EventArgs e)
        {
            BeginEdit(Request.QueryString["t"]);
        }

        protected void rptReplies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string id = Convert.ToString(e.CommandArgument);

            if (e.CommandName == "edit")
            {
                BeginEdit(id);
            }
            else if (e.CommandName == "delete")
            {
                ForumStore.Delete(id, GetToken());
                if (hfEditId.Value == id) hfEditId.Value = "";
            }
        }

        private void BeginEdit(string postId)
        {
            ForumPost post = ForumStore.Get(postId);
            if (post == null || !CanModify(post.OwnerToken)) return;

            hfEditId.Value = post.Id;
            txtEditTitle.Text = post.Title;
            txtEditBody.Text = post.Body;
            pnlEditTitle.Visible = !post.IsReply;     // replies have no title
            litEditHeading.Text = post.IsReply ? "Edit your reply" : "Edit your discussion";
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            Page.Validate("Edit");
            if (!Page.IsValid) return;

            ForumStore.Update(hfEditId.Value, txtEditTitle.Text, txtEditBody.Text, GetToken());
            hfEditId.Value = "";
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            hfEditId.Value = "";
        }

        // ---------------------------------------------------------------
        //  DELETE
        // ---------------------------------------------------------------
        protected void lnkDeleteThread_Click(object sender, EventArgs e)
        {
            ForumStore.Delete(Request.QueryString["t"], GetToken());
            Response.Redirect("~/LongLongForum.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        // ---------------------------------------------------------------
        //  Helpers used by the markup
        // ---------------------------------------------------------------
        protected string ThreadUrl(object id)
        {
            return ResolveUrl("~/LongLongForum.aspx?t=" + Server.UrlEncode(Convert.ToString(id)));
        }

        protected string When(object value)
        {
            if (!(value is DateTime)) return "";
            return ((DateTime)value).ToLocalTime().ToString("d MMM yyyy, HH:mm", CultureInfo.InvariantCulture);
        }

        protected string EditedNote(object value)
        {
            return value is DateTime ? " &middot; edited " + When(value) : "";
        }

        protected bool CanModify(object ownerToken)
        {
            return ForumStore.IsOwner(Convert.ToString(ownerToken), GetToken());
        }

        // ---------------------------------------------------------------
        //  Cookies: no login system, so each browser gets a random token.
        //  Only the browser that wrote a post can edit or delete it.
        // ---------------------------------------------------------------
        private string GetToken()
        {
            if (!string.IsNullOrEmpty(_token)) return _token;
            HttpCookie c = Request.Cookies[TokenCookie];
            return c == null ? "" : c.Value;
        }

        private string EnsureToken()
        {
            string token = GetToken();
            if (string.IsNullOrEmpty(token))
            {
                token = Guid.NewGuid().ToString("N");
                var cookie = new HttpCookie(TokenCookie, token);
                cookie.HttpOnly = true;
                cookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(cookie);
            }
            _token = token;
            return token;
        }

        private string SavedName()
        {
            HttpCookie c = Request.Cookies[NameCookie];
            return c == null ? "" : HttpUtility.UrlDecode(c.Value) ?? "";
        }

        private void RememberName(string name)
        {
            name = (name ?? "").Trim();
            if (name.Length == 0) return;
            var cookie = new HttpCookie(NameCookie, HttpUtility.UrlEncode(name));
            cookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(cookie);
        }
    }
}
