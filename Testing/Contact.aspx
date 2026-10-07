<%@ Page Title="BUILD//LAB · Contact" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Testing.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrap">
        <div class="page-head">
            <span class="kicker"><i></i>Contact</span>
            <h1>Get in
                <span class="accent">touch.</span></h1>
            <p>Have a question or a suggestion? The quickest ways to reach us are the survey and the community forum.</p>
            <div class="hero-actions">
                <a class="btn primary" href="Survey.aspx">Take the survey</a>
                <a class="btn" href="LongLongForum.aspx">Visit the Long Long Forum</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Contact.js") %>"></script>
</asp:Content>
