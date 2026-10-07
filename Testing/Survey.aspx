<%@ Page Title="BUILD//LAB · Survey" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="Testing.Survey" MaintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrap">

        <div class="page-head">
            <span class="kicker"><i></i>Survey &middot; Your feedback</span>
            <h1>Help us make it
                <span class="accent">better.</span></h1>
            <p>You have finished the build. Tell us what worked, what was confusing and what we should improve next. It takes about two minutes.</p>
        </div>

        <%-- ===================== The survey form ===================== --%>
        <asp:Panel ID="pnlForm" runat="server">
            <div class="survey-grid">

                <div class="panel">
                    <asp:ValidationSummary ID="vsSurvey" runat="server" ValidationGroup="Survey"
                        CssClass="alert bad" DisplayMode="BulletList" HeaderText="Please fix the following:" />

                    <div class="form-row">
                        <div class="field">
                            <asp:Label runat="server" AssociatedControlID="txtName">Name <span class="opt">optional</span></asp:Label>
                            <asp:TextBox ID="txtName" runat="server" MaxLength="60" placeholder="e.g. Alex"></asp:TextBox>
                        </div>
                        <div class="field">
                            <asp:Label runat="server" AssociatedControlID="ddlExperience">Your PC-building experience</asp:Label>
                            <asp:DropDownList ID="ddlExperience" runat="server">
                                <asp:ListItem Value="First-time builder">First-time builder</asp:ListItem>
                                <asp:ListItem Value="Built a PC before">Built a PC before</asp:ListItem>
                                <asp:ListItem Value="Hobbyist / enthusiast">Hobbyist / enthusiast</asp:ListItem>
                                <asp:ListItem Value="Student (IT / computing)">Student (IT / computing)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="field">
                        <div class="lbl">Overall, how was BUILD//LAB?</div>
                        <asp:RadioButtonList ID="rblOverall" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="opts rate">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:RadioButtonList>
                        <div class="rate-hint"><span>Poor</span><span>Excellent</span></div>
                        <asp:RequiredFieldValidator ID="rfvOverall" runat="server" ControlToValidate="rblOverall"
                            ValidationGroup="Survey" CssClass="field-error" Display="Dynamic"
                            ErrorMessage="Please give an overall rating." Text="Please choose a rating."></asp:RequiredFieldValidator>
                    </div>

                    <div class="field">
                        <div class="lbl">How clear were the step-by-step instructions? <span class="opt">optional</span></div>
                        <asp:RadioButtonList ID="rblClarity" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="opts rate">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:RadioButtonList>
                        <div class="rate-hint"><span>Confusing</span><span>Very clear</span></div>
                    </div>

                    <div class="field">
                        <div class="lbl">How enjoyable was the final assembly challenge? <span class="opt">optional</span></div>
                        <asp:RadioButtonList ID="rblChallenge" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="opts rate">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:RadioButtonList>
                        <div class="rate-hint"><span>Not fun</span><span>Loved it</span></div>
                    </div>

                    <div class="field">
                        <asp:Label runat="server" AssociatedControlID="ddlHelpful">Which part helped you the most?</asp:Label>
                        <asp:DropDownList ID="ddlHelpful" runat="server">
                            <asp:ListItem Value="Not sure">I'm not sure</asp:ListItem>
                            <asp:ListItem Value="Parts guide">Parts guide</asp:ListItem>
                            <asp:ListItem Value="Step 1 - CPU">Step 1 · CPU</asp:ListItem>
                            <asp:ListItem Value="Step 2 - Cooling">Step 2 · Cooling</asp:ListItem>
                            <asp:ListItem Value="Step 3 - RAM">Step 3 · RAM</asp:ListItem>
                            <asp:ListItem Value="Step 4 - Chassis + PSU">Step 4 · Chassis + PSU</asp:ListItem>
                            <asp:ListItem Value="Step 5 - GPU + Wiring">Step 5 · GPU + Wiring</asp:ListItem>
                            <asp:ListItem Value="Step 6 - Storage">Step 6 · Storage</asp:ListItem>
                            <asp:ListItem Value="Step 7 - Airflow">Step 7 · Airflow</asp:ListItem>
                            <asp:ListItem Value="Step 8 - BIOS">Step 8 · BIOS</asp:ListItem>
                            <asp:ListItem Value="Step 9 - Validation">Step 9 · Validation</asp:ListItem>
                            <asp:ListItem Value="Final assembly challenge">Final assembly challenge</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="field">
                        <div class="lbl">What should we improve? <span class="opt">pick any</span></div>
                        <asp:CheckBoxList ID="cblImprove" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="opts">
                            <asp:ListItem Value="Clearer instructions">Clearer instructions</asp:ListItem>
                            <asp:ListItem Value="More photos and diagrams">More photos and diagrams</asp:ListItem>
                            <asp:ListItem Value="A quiz after each step">A quiz after each step</asp:ListItem>
                            <asp:ListItem Value="Final challenge difficulty">Final challenge difficulty</asp:ListItem>
                            <asp:ListItem Value="Faster page loading">Faster page loading</asp:ListItem>
                            <asp:ListItem Value="Better layout on phones">Better layout on phones</asp:ListItem>
                            <asp:ListItem Value="More parts and build types">More parts and build types</asp:ListItem>
                            <asp:ListItem Value="More forum features">More forum features</asp:ListItem>
                        </asp:CheckBoxList>
                        <asp:CustomValidator ID="cvImprove" runat="server" ValidationGroup="Survey" CssClass="field-error"
                            Display="Dynamic" EnableClientScript="false" OnServerValidate="cvImprove_ServerValidate"
                            ErrorMessage="Pick at least one thing to improve, or tell us in the comments."
                            Text="Pick at least one, or tell us in the comments below."></asp:CustomValidator>
                    </div>

                    <div class="field">
                        <asp:Label runat="server" AssociatedControlID="txtComments">Anything else we should know? <span class="opt">optional &middot; max 1000 characters</span></asp:Label>
                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="5"
                            placeholder="What was confusing, missing or could be better?"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revComments" runat="server" ControlToValidate="txtComments"
                            ValidationGroup="Survey" CssClass="field-error" Display="Dynamic"
                            ValidationExpression="^[\s\S]{0,1000}$"
                            ErrorMessage="Comments must be 1000 characters or fewer." Text="Please keep it under 1000 characters."></asp:RegularExpressionValidator>
                    </div>

                    <div class="field">
                        <div class="lbl">Would you recommend BUILD//LAB to a friend?</div>
                        <asp:RadioButtonList ID="rblRecommend" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="opts">
                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                            <asp:ListItem Value="Maybe">Maybe</asp:ListItem>
                            <asp:ListItem Value="No">No</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvRecommend" runat="server" ControlToValidate="rblRecommend"
                            ValidationGroup="Survey" CssClass="field-error" Display="Dynamic"
                            ErrorMessage="Please say whether you would recommend BUILD//LAB." Text="Please choose one."></asp:RequiredFieldValidator>
                    </div>

                    <asp:Button ID="btnSubmit" runat="server" Text="Submit feedback" CssClass="btn primary"
                        ValidationGroup="Survey" OnClick="btnSubmit_Click" />
                </div>

                <aside class="survey-side stack">
                    <div class="panel">
                        <h2>Why it matters</h2>
                        <p class="sub">Every response is read and used to decide what gets fixed or added next.</p>
                        <div class="stat-row" style="margin-top:0">
                            <div class="stat"><b><asp:Literal ID="litCount" runat="server" Text="0"></asp:Literal></b> responses so far</div>
                        </div>
                        <div style="margin-top:18px">
                            <div class="big-num"><asp:Literal ID="litAverage" runat="server" Text="-"></asp:Literal></div>
                            <div class="meta" style="margin-top:6px">average overall rating (out of 5)</div>
                        </div>
                    </div>
                </aside>

            </div>
        </asp:Panel>

        <%-- ===================== Thank-you message ===================== --%>
        <asp:Panel ID="pnlThanks" runat="server" Visible="false">
            <div class="panel thanks">
                <div class="tick">&#10003;</div>
                <h2>Thank you for your feedback!</h2>
                <p>Your response has been saved. Next stop: the Long Long Forum, where you can share your build and swap tips with other builders.</p>
                <div class="hero-actions">
                    <a class="btn primary" href="LongLongForum.aspx">Join the Long Long Forum &rarr;</a>
                    <a class="btn" href="PartsGuide.aspx">Restart BUILD//LAB</a>
                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Survey.js") %>"></script>
</asp:Content>
