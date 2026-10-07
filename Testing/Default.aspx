<%@ Page Title="BUILD//LAB · Home" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Testing._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrap">
        <div class="page-head">
            <span class="kicker"><i></i>Interactive PC assembly</span>
            <h1>Build it right.
                <span class="accent">Understand it first.</span></h1>
            <p>BUILD//LAB walks you through assembling a PC one step at a time, from the parts guide to a drag-and-drop final challenge. When you finish, share your thoughts in the survey and join the Long Long Forum community.</p>
            <div class="hero-actions">
                <a class="btn primary" href="PartsGuide.aspx">Start with the parts guide &rarr;</a>
                <a class="btn" href="Survey.aspx">Give feedback</a>
                <a class="btn" href="LongLongForum.aspx">Long Long Forum</a>
            </div>
        </div>

        <div class="cards">
            <article class="card">
                <div class="num">01 &middot; Learn</div>
                <h3>Know the parts</h3>
                <p>Understand what each component does before a single screw turns.</p>
            </article>
            <article class="card">
                <div class="num">02 &middot; Build</div>
                <h3>Nine guided steps</h3>
                <p>CPU, cooling, RAM, chassis, GPU, storage, airflow, BIOS and validation.</p>
            </article>
            <article class="card success">
                <div class="num">03 &middot; Share</div>
                <h3>Join the community</h3>
                <p>Give feedback, then ask questions and show your build in the Long Long Forum.</p>
            </article>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Default.js") %>"></script>
</asp:Content>
