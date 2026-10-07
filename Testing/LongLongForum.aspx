<%@ Page Title="BUILD//LAB · Long Long Forum" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="LongLongForum.aspx.cs" Inherits="Testing.LongLongForum" MaintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrap">

        <div class="page-head">
            <span class="kicker"><i></i>Community</span>
            <h1>Long Long Forum
                <span class="accent">Where builders help builders.</span></h1>
            <p>You finished the course. Now ask questions, show off your build and help the next person who is staring at a pile of parts.</p>
        </div>

        <%-- ===================== Thread not found ===================== --%>
        <asp:Panel ID="pnlMissing" runat="server" Visible="false">
            <div class="empty">
                That discussion could not be found. It may have been deleted.<br />
                <a class="btn primary small" style="margin-top:14px" href="LongLongForum.aspx">&larr; Back to all discussions</a>
            </div>
        </asp:Panel>

        <%-- ===================== LIST VIEW ===================== --%>
        <asp:Panel ID="pnlList" runat="server">
            <div class="forum-layout">

                <aside class="forum-side">
                    <div class="panel">
                        <h2>Categories</h2>
                        <p class="sub">Filter the discussions.</p>
                        <div class="cat-list">
                            <asp:Repeater ID="rptCategories" runat="server">
                                <ItemTemplate>
                                    <a class='<%# Eval("CssClass") %>' href='<%# Eval("Url") %>'><span><%#: Eval("Name") %></span><small><%#: Eval("Count") %></small></a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="panel">
                        <h2>Community</h2>
                        <div class="stat-row" style="margin-top:12px">
                            <div class="stat"><b><asp:Literal ID="litThreads" runat="server" Text="0"></asp:Literal></b> discussions</div>
                            <div class="stat"><b><asp:Literal ID="litReplies" runat="server" Text="0"></asp:Literal></b> replies</div>
                        </div>
                    </div>
                </aside>

                <div class="stack">

                    <%-- Create a discussion --%>
                    <div class="panel">
                        <h2>Start a discussion</h2>
                        <p class="sub">Ask a question or share something with the community.</p>

                        <div class="form-row">
                            <div class="field">
                                <asp:Label runat="server" AssociatedControlID="txtAuthor">Display name</asp:Label>
                                <asp:TextBox ID="txtAuthor" runat="server" MaxLength="40" placeholder="e.g. Alex"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ControlToValidate="txtAuthor"
                                    ValidationGroup="NewThread" CssClass="field-error" Display="Dynamic"
                                    ErrorMessage="Please enter a display name."></asp:RequiredFieldValidator>
                            </div>
                            <div class="field">
                                <asp:Label runat="server" AssociatedControlID="ddlCategory">Category</asp:Label>
                                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="field">
                            <asp:Label runat="server" AssociatedControlID="txtTitle">Title</asp:Label>
                            <asp:TextBox ID="txtTitle" runat="server" MaxLength="120" placeholder="A short, specific title"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                                ValidationGroup="NewThread" CssClass="field-error" Display="Dynamic"
                                ErrorMessage="Please enter a title."></asp:RequiredFieldValidator>
                        </div>
                        <div class="field">
                            <asp:Label runat="server" AssociatedControlID="txtBody">Message</asp:Label>
                            <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Rows="5"
                                placeholder="Which step are you on? What have you tried?"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBody" runat="server" ControlToValidate="txtBody"
                                ValidationGroup="NewThread" CssClass="field-error" Display="Dynamic"
                                ErrorMessage="Please write a message."></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnPost" runat="server" Text="Post discussion" CssClass="btn primary"
                            ValidationGroup="NewThread" OnClick="btnPost_Click" />
                    </div>

                    <%-- Read discussions --%>
                    <asp:Repeater ID="rptThreads" runat="server">
                        <ItemTemplate>
                            <a class="thread" href='<%# ThreadUrl(Eval("Id")) %>'>
                                <div>
                                    <span class="tag"><%#: Eval("Category") %></span>
                                    <h3><%#: Eval("Title") %></h3>
                                    <p class="excerpt"><%#: Eval("Excerpt") %></p>
                                    <div class="meta" style="margin-top:8px">by <b><%#: Eval("Author") %></b> &middot; last activity <%# When(Eval("LastActivity")) %></div>
                                </div>
                                <div class="count"><b><%#: Eval("ReplyCount") %></b><small>replies</small></div>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
                        <div class="empty">No discussions here yet. Be the first to start one!</div>
                    </asp:Panel>

                </div>
            </div>
        </asp:Panel>

        <%-- ===================== THREAD VIEW ===================== --%>
        <asp:Panel ID="pnlThread" runat="server" Visible="false">
            <a class="crumb" href="LongLongForum.aspx">&larr; All discussions</a>

            <div class="stack">

                <%-- The original post --%>
                <div class="post op">
                    <div class="post-top">
                        <div>
                            <span class="avatar"><asp:Literal ID="litThreadInitial" runat="server" Mode="Encode"></asp:Literal></span><b><asp:Literal ID="litThreadAuthor" runat="server" Mode="Encode"></asp:Literal></b>
                            <span class="meta">&middot; <asp:Literal ID="litThreadWhen" runat="server"></asp:Literal><asp:Literal ID="litThreadEdited" runat="server"></asp:Literal></span>
                        </div>
                        <div class="post-actions">
                            <asp:LinkButton ID="lnkEditThread" runat="server" CssClass="mini" CausesValidation="false"
                                OnClick="lnkEditThread_Click" Visible="false">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDeleteThread" runat="server" CssClass="mini danger" CausesValidation="false"
                                OnClick="lnkDeleteThread_Click" OnClientClick="return confirm('Delete this discussion and all of its replies?');" Visible="false">Delete</asp:LinkButton>
                        </div>
                    </div>
                    <span class="tag" style="margin-top:14px"><asp:Literal ID="litThreadCategory" runat="server" Mode="Encode"></asp:Literal></span>
                    <h2><asp:Literal ID="litThreadTitle" runat="server" Mode="Encode"></asp:Literal></h2>
                    <p class="post-body"><asp:Literal ID="litThreadBody" runat="server" Mode="Encode"></asp:Literal></p>
                </div>

                <%-- Edit box (shown when the author clicks Edit) --%>
                <asp:Panel ID="pnlEdit" runat="server" Visible="false">
                    <div class="panel" style="border-color:rgba(255,189,89,.35)">
                        <asp:HiddenField ID="hfEditId" runat="server" />
                        <h2><asp:Literal ID="litEditHeading" runat="server" Text="Edit your post"></asp:Literal></h2>
                        <p class="sub">Only you can change this post from this browser.</p>

                        <asp:Panel ID="pnlEditTitle" runat="server">
                            <div class="field">
                                <asp:Label runat="server" AssociatedControlID="txtEditTitle">Title</asp:Label>
                                <asp:TextBox ID="txtEditTitle" runat="server" MaxLength="120"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditTitle" runat="server" ControlToValidate="txtEditTitle"
                                    ValidationGroup="Edit" CssClass="field-error" Display="Dynamic"
                                    ErrorMessage="Please enter a title."></asp:RequiredFieldValidator>
                            </div>
                        </asp:Panel>
                        <div class="field">
                            <asp:Label runat="server" AssociatedControlID="txtEditBody">Message</asp:Label>
                            <asp:TextBox ID="txtEditBody" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditBody" runat="server" ControlToValidate="txtEditBody"
                                ValidationGroup="Edit" CssClass="field-error" Display="Dynamic"
                                ErrorMessage="Please write a message."></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnSaveEdit" runat="server" Text="Save changes" CssClass="btn primary"
                            ValidationGroup="Edit" OnClick="btnSaveEdit_Click" />
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn"
                            CausesValidation="false" OnClick="btnCancelEdit_Click" />
                    </div>
                </asp:Panel>

                <div class="meta" style="margin:6px 4px 0"><b><asp:Literal ID="litReplyCount" runat="server" Text="0"></asp:Literal></b> replies</div>

                <%-- Replies --%>
                <asp:Repeater ID="rptReplies" runat="server" OnItemCommand="rptReplies_ItemCommand">
                    <ItemTemplate>
                        <div class="post reply">
                            <div class="post-top">
                                <div>
                                    <span class="avatar"><%#: Eval("Initial") %></span><b><%#: Eval("Author") %></b>
                                    <span class="meta">&middot; <%# When(Eval("Created")) %><%# EditedNote(Eval("Edited")) %></span>
                                </div>
                                <div class="post-actions">
                                    <asp:LinkButton runat="server" CssClass="mini" CausesValidation="false" CommandName="edit"
                                        CommandArgument='<%# Eval("Id") %>' Visible='<%# CanModify(Eval("OwnerToken")) %>'>Edit</asp:LinkButton>
                                    <asp:LinkButton runat="server" CssClass="mini danger" CausesValidation="false" CommandName="delete"
                                        CommandArgument='<%# Eval("Id") %>' Visible='<%# CanModify(Eval("OwnerToken")) %>'
                                        OnClientClick="return confirm('Delete this reply?');">Delete</asp:LinkButton>
                                </div>
                            </div>
                            <p class="post-body"><%#: Eval("Body") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <%-- Write a reply --%>
                <div class="panel">
                    <h2>Write a reply</h2>
                    <p class="sub">Keep it kind and specific.</p>
                    <div class="field">
                        <asp:Label runat="server" AssociatedControlID="txtReplyAuthor">Display name</asp:Label>
                        <asp:TextBox ID="txtReplyAuthor" runat="server" MaxLength="40" placeholder="e.g. Alex"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvReplyAuthor" runat="server" ControlToValidate="txtReplyAuthor"
                            ValidationGroup="Reply" CssClass="field-error" Display="Dynamic"
                            ErrorMessage="Please enter a display name."></asp:RequiredFieldValidator>
                    </div>
                    <div class="field">
                        <asp:Label runat="server" AssociatedControlID="txtReplyBody">Your reply</asp:Label>
                        <asp:TextBox ID="txtReplyBody" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvReplyBody" runat="server" ControlToValidate="txtReplyBody"
                            ValidationGroup="Reply" CssClass="field-error" Display="Dynamic"
                            ErrorMessage="Please write a reply."></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btnReply" runat="server" Text="Post reply" CssClass="btn primary"
                        ValidationGroup="Reply" OnClick="btnReply_Click" />
                </div>

            </div>
        </asp:Panel>

    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/LongLongForum.js") %>"></script>
</asp:Content>
