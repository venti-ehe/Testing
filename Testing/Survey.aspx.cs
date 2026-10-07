using System;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Testing
{
    public partial class Survey : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStats();
            }
        }

        private void BindStats()
        {
            int count;
            double average;
            SurveyStore.GetSummary(out count, out average);
            litCount.Text = count.ToString(CultureInfo.InvariantCulture);
            litAverage.Text = count == 0 ? "-" : average.ToString("0.0", CultureInfo.InvariantCulture);
        }

        // At least one "improve" checkbox OR a written comment is required.
        protected void cvImprove_ServerValidate(object source, ServerValidateEventArgs args)
        {
            bool anyTicked = cblImprove.Items.Cast<ListItem>().Any(i => i.Selected);
            args.IsValid = anyTicked || !string.IsNullOrWhiteSpace(txtComments.Text);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate("Survey");
            if (!Page.IsValid) return;

            var response = new SurveyResponse
            {
                Name = txtName.Text,
                Experience = ddlExperience.SelectedValue,
                Overall = ToRating(rblOverall.SelectedValue),
                Clarity = ToRating(rblClarity.SelectedValue),
                Challenge = ToRating(rblChallenge.SelectedValue),
                HelpfulStep = ddlHelpful.SelectedValue,
                Comments = txtComments.Text,
                Recommend = rblRecommend.SelectedValue
            };

            foreach (ListItem item in cblImprove.Items)
            {
                if (item.Selected) response.Improve.Add(item.Value);
            }

            SurveyStore.Add(response);

            pnlForm.Visible = false;
            pnlThanks.Visible = true;
        }

        private static int ToRating(string value)
        {
            int v;
            return int.TryParse(value, out v) && v >= 1 && v <= 5 ? v : 0;
        }
    }
}
