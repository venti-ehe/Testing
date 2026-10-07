<%@ Page Title="BUILD//LAB · About" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Testing.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrap">
        <div class="page-head">
            <span class="kicker"><i></i>About</span>
            <h1>About
                <span class="accent">BUILD//LAB.</span></h1>
            <p>BUILD//LAB is an interactive learning site for first-time PC builders. It covers the parts, nine guided build steps and a final drag-and-drop assembly challenge, followed by a feedback survey and the Long Long Forum community.</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/About.js") %>"></script>
</asp:Content>
