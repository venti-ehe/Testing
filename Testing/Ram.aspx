<%@ Page Title="BUILD//LAB · Step 3 RAM" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Ram.aspx.cs" Inherits="Testing.Ram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 3 · System memory
      </span>
      <h1>
       Install the RAM.
       <span class="accent">
        Use the right slots.
       </span>
      </h1>
      <p class="hero-copy">
       DDR5 installation is about orientation, seating pressure and slot choice. With two sticks, the intended A2/B2 layout keeps the memory configuration aligned with the board design.
      </p>
      <div class="stat-row">
       <span class="stat">
        DDR5
       </span>
       <span class="stat">
        A2 + B2 placement
       </span>
       <span class="stat">
        Retention clips
       </span>
       <span class="stat">
        Enable rated profile later
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
     <div class="lab-visual ram-stage reveal">
      <span class="label">
       MEMORY TOPOLOGY // A2 + B2
      </span>
      <img alt="B760M motherboard" class="product mobo" src="B760 M plus wifi motherboard.png"/>
      <div class="slotlabel">
       <b>
        A1
       </b>
       <b>
        A2
       </b>
       <b>
        B1
       </b>
       <b>
        B2
       </b>
      </div>
      <div class="ram-stick-v a2">
      </div>
      <div class="ram-stick-v b2">
      </div>
      <span class="bp-tag" style="left:7%;bottom:8%">
       Two-stick layout: A2 + B2
      </span>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        Memory installation
       </div>
       <h2>
        The click matters. The slot choice matters more.
       </h2>
      </div>
      <p class="section-lede">
       Memory only works correctly when the module is oriented by its notch, fully seated, and installed in the slots the motherboard expects for a two-stick configuration.
      </p>
     </div>
     <div class="timeline">
      <aside class="timeline-rail">
       <strong>
        RAM sequence
       </strong>
       <a href="#ram1">
        <span>
         01
        </span>
        Seat the DIMM
       </a>
       <a href="#ram2">
        <span>
         02
        </span>
        Choose A2/B2
       </a>
       <a href="#ram3">
        <span>
         03
        </span>
        Capacity mixing
       </a>
       <a href="#ram4">
        <span>
         04
        </span>
        Rated speed
       </a>
      </aside>
      <div class="timeline-body">
       <article class="lesson reveal" id="ram1">
        <span class="stepno">
         01 · Physical install
        </span>
        <h3>
         Orient by the notch, then press until the retention mechanism locks.
        </h3>
        <p>
         Open the memory retention clips. The notch in the gold contacts is offset, so the module fits only in the correct orientation. Press evenly until it is fully seated.
        </p>
        <div class="callout">
         <strong>
          Visual check:
         </strong>
         the module should sit level and the retention clip should return to its locked position.
        </div>
       </article>
       <article class="lesson reveal" id="ram2">
        <span class="stepno">
         02 · Slot placement
        </span>
        <h3>
         For two sticks, use A2 and B2.
        </h3>
        <p>
         On the four-slot B760M layout in this build, that means the second and fourth slots counting outward from the CPU. The existing lesson explains this in terms of the board's daisy-chain memory topology.
        </p>
       </article>
       <article class="lesson reveal" id="ram3">
        <span class="stepno">
         03 · Mixing capacities
        </span>
        <h3>
         Odd module counts can create mixed operating behaviour.
        </h3>
        <p>
         The original build guide describes a three-stick example where part of the installed memory operates in dual-channel mode while the remaining capacity operates independently. The system may work, but performance can become inconsistent when workload spills into the slower region.
        </p>
       </article>
       <article class="lesson reveal" id="ram4">
        <span class="stepno">
         04 · Memory profile
        </span>
        <h3>
         Physical installation is only the first half.
        </h3>
        <p>
         The board may initially run DDR5 at a conservative base speed. A faster kit does not automatically mean the rated speed is active on the first boot.
        </p>
        <div class="checks">
         <div class="check">
          DIMMs fully seated
         </div>
         <div class="check">
          A2/B2 used for two sticks
         </div>
         <div class="check">
          Memory detected on first boot
         </div>
         <div class="check">
          Rated profile configured later
         </div>
        </div>
       </article>
      </div>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Ram.js") %>"></script>
</asp:Content>
