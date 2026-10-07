using System;
using System.IO;
using System.Web.UI;

namespace Testing
{
    /// <summary>One entry in the BUILD//LAB page sequence.</summary>
    public class NavPage
    {
        public string File { get; set; }            // page file name, e.g. "CpuInstall.aspx"
        public string NavLabel { get; set; }        // text on the top progress bar
        public string FooterLabel { get; set; }     // text on the Previous / Next cards
        public string ForwardCaption { get; set; }  // small caption above the Next card when leaving THIS page

        public NavPage(string file, string navLabel, string footerLabel, string forwardCaption = "Continue build")
        {
            File = file; NavLabel = navLabel; FooterLabel = footerLabel; ForwardCaption = forwardCaption;
        }
    }

    public partial class BuildLabMaster : MasterPage
    {
        // The whole site flow lives in this one list. Re-order / add / remove pages here
        // and the top bar plus the Previous/Next cards on every page update automatically.
        protected static readonly NavPage[] NavPages = new NavPage[]
        {
            new NavPage("PartsGuide.aspx",           "Parts",              "Parts guide"),
            new NavPage("CpuInstall.aspx",           "1 \u00B7 CPU",         "Step 1 \u00B7 CPU"),
            new NavPage("Cooling.aspx",         "2 \u00B7 Cooling",     "Step 2 \u00B7 Cooling"),
            new NavPage("Ram.aspx",           "3 \u00B7 RAM",         "Step 3 \u00B7 RAM"),
            new NavPage("ChassisPsu.aspx",           "4 \u00B7 Chassis + PSU", "Step 4 \u00B7 Chassis + PSU"),
            new NavPage("GpuWiring.aspx",           "5 \u00B7 GPU + Wiring", "Step 5 \u00B7 GPU + Wiring"),
            new NavPage("Storage.aspx",           "6 \u00B7 Storage",     "Step 6 \u00B7 Storage"),
            new NavPage("Airflow.aspx",           "7 \u00B7 Airflow",     "Step 7 \u00B7 Airflow"),
            new NavPage("Bios.aspx",           "8 \u00B7 BIOS",        "Step 8 \u00B7 BIOS"),
            new NavPage("Validation.aspx",           "9 \u00B7 Validate",    "Step 9 \u00B7 Validation"),
            new NavPage("FinalChallenge.aspx",          "10 \u00B7 Final Challenge", "Final \u00B7 Assembly challenge", "Build complete"),
            new NavPage("Survey.aspx",           "Survey",             "Survey \u00B7 Your feedback", "Last stop"),
            new NavPage("LongLongForum.aspx",    "Long Long Forum",    "Community \u00B7 Long Long Forum", "Course complete")
        };

        protected int CurrentIndex { get; private set; }
        protected NavPage Previous { get; private set; }
        protected NavPage Next { get; private set; }
        protected string NextCaption { get; private set; }
        protected string NextLabel { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string current = Path.GetFileName(Request.AppRelativeCurrentExecutionFilePath ?? "");

            CurrentIndex = -1;
            for (int i = 0; i < NavPages.Length; i++)
            {
                if (string.Equals(NavPages[i].File, current, StringComparison.OrdinalIgnoreCase))
                {
                    CurrentIndex = i;
                    break;
                }
            }

            if (CurrentIndex < 0) return;   // Home / About / Contact: no step navigation

            bool last = CurrentIndex == NavPages.Length - 1;
            Previous = CurrentIndex > 0 ? NavPages[CurrentIndex - 1] : null;
            Next = last ? NavPages[0] : NavPages[CurrentIndex + 1];
            NextCaption = NavPages[CurrentIndex].ForwardCaption;
            NextLabel = last ? "Restart BUILD//LAB \u21BB" : Next.FooterLabel + " \u2192";
        }

        protected bool IsCurrent(NavPage p)
        {
            return CurrentIndex >= 0 && ReferenceEquals(p, NavPages[CurrentIndex]);
        }

        protected string Href(NavPage p)
        {
            return Server.UrlPathEncode(ResolveUrl("~/" + p.File));
        }
    }
}
