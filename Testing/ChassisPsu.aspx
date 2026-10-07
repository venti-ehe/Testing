<%@ Page Title="BUILD//LAB · Step 4 Chassis + PSU" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="ChassisPsu.aspx.cs" Inherits="Testing.ChassisPsu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 4 · Chassis integration
      </span>
      <h1>
       Move the core in.
       <span class="accent">
        Protect the board.
       </span>
      </h1>
      <p class="hero-copy">
       This stage turns separate components into a physical system: verify standoffs, lower the motherboard into the chassis, secure it evenly, then install the power supply with its airflow path in mind.
      </p>
      <div class="stat-row">
       <span class="stat">
        Correct standoff positions
       </span>
       <span class="stat">
        Even screw pressure
       </span>
       <span class="stat">
        PSU basement
       </span>
       <span class="stat">
        Quality power protection
       </span>
      </div>
      <div class="hero-actions">
       <a class="btn primary" href="#content">
        Enter the lesson ↓
       </a>
       <a class="btn" href="PartsGuide.aspx">
        Build map
       </a>
      </div>
     </div>
     <div class="lab-visual case-stage reveal">
      <span class="label">
       CHASSIS INTEGRATION // CORE ASSEMBLY
      </span>
      <img alt="PC chassis" class="product case" src="case.png"/>
      <img alt="B760M motherboard" class="product mobo" src="B760 M plus wifi motherboard.png"/>
      <img alt="Power supply" class="product psu" src="PSU.jpg"/>
      <i class="standoff s1">
      </i>
      <i class="standoff s2">
      </i>
      <i class="standoff s3">
      </i>
      <i class="standoff s4">
      </i>
      <span class="bp-tag" style="left:7%;top:15%">
       Brass standoffs
      </span>
      <span class="bp-tag" style="right:7%;bottom:12%">
       PSU basement
      </span>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        Mechanical integration
       </div>
       <h2>
        The case is structure, grounding risk, and airflow—all at once.
       </h2>
      </div>
      <p class="section-lede">
       The motherboard must be supported above the chassis metal by correctly placed standoffs. Once the board is secured, the PSU becomes the power foundation for every cable that follows.
      </p>
     </div>
     <div class="timeline">
      <aside class="timeline-rail">
       <strong>
        Chassis sequence
       </strong>
       <a href="#case1">
        <span>
         01
        </span>
        Standoffs
       </a>
       <a href="#case2">
        <span>
         02
        </span>
        Mount board
       </a>
       <a href="#case3">
        <span>
         03
        </span>
        Install PSU
       </a>
       <a href="#case4">
        <span>
         04
        </span>
        Power quality
       </a>
      </aside>
      <div class="timeline-body">
       <article class="lesson reveal" id="case1">
        <span class="stepno">
         01 · Standoffs
        </span>
        <h3>
         Never let the motherboard sit directly on chassis metal.
        </h3>
        <p>
         The rear of the board has exposed solder points. The brass standoffs create the required physical separation and give the mounting screws safe anchor points.
        </p>
        <div class="callout danger">
         <strong>
          Before mounting:
         </strong>
         verify there is a standoff only where the motherboard has a screw hole.
        </div>
       </article>
       <article class="lesson reveal" id="case2">
        <span class="stepno">
         02 · Motherboard mounting
        </span>
        <h3>
         Lower the board carefully, then tighten evenly.
        </h3>
        <p>
         Align the rear I/O area and mounting holes. Start all screws loosely first, then tighten them gradually in a diagonal or star-like pattern instead of fully tightening one corner at a time.
        </p>
       </article>
       <article class="lesson reveal" id="case3">
        <span class="stepno">
         03 · PSU installation
        </span>
        <h3>
         Use the lower compartment and respect the PSU fan path.
        </h3>
        <p>
         Slide the PSU into the chassis basement from the appropriate side or rear opening. Check where its intake fan draws air from before fixing it into place.
        </p>
       </article>
       <article class="lesson reveal" id="case4">
        <span class="stepno">
         04 · Power quality
        </span>
        <h3>
         The PSU protects the investment behind every connector.
        </h3>
        <p>
         The original guide emphasizes using a quality, properly rated power supply rather than treating the PSU as an afterthought. It is the interface between wall power and the entire system.
        </p>
        <div class="checks">
         <div class="check">
          Standoffs match board holes
         </div>
         <div class="check">
          Board sits flat without flex
         </div>
         <div class="check">
          PSU fan path is unobstructed
         </div>
         <div class="check">
          Cable routes remain accessible
         </div>
        </div>
       </article>
      </div>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/ChassisPsu.js") %>"></script>
</asp:Content>
