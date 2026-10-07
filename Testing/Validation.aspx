<%@ Page Title="BUILD//LAB · Step 9 Validation" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="Testing.Validation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 9 · Validation
      </span>
      <h1>
       Do not just boot it.
       <span class="accent">
        Prove it is stable.
       </span>
      </h1>
      <p class="hero-copy">
       A finished PC should survive real load without thermal throttling, crashes, power faults or runaway fan noise. Validation turns a successful assembly into a trusted system.
      </p>
      <div class="stat-row">
       <span class="stat">
        Temperature logging
       </span>
       <span class="stat">
        CPU + GPU load
       </span>
       <span class="stat">
        Stability + noise check
       </span>
      </div>
      <div class="hero-actions">
       <a class="btn primary" href="#content">
        Run validation plan ↓
       </a>
       <a class="btn" href="FinalChallenge.aspx">
        Final challenge
       </a>
      </div>
     </div>
     <div class="lab-visual validation-stage reveal">
      <span class="label">
       TELEMETRY // SYSTEM VALIDATION
      </span>
      <div class="telemetry">
       <div class="telemetry-head">
        <b>
         THERMAL + POWER TRACE
        </b>
        <span class="live-dot">
         LIVE
        </span>
       </div>
       <div class="graph">
        <svg preserveaspectratio="none" viewbox="0 0 800 330">
         <polyline class="line1" points="0,270 55,250 110,255 165,210 220,225 275,170 330,185 385,145 440,155 495,130 550,150 605,118 660,125 715,110 800,120">
         </polyline>
         <polyline class="line2" points="0,290 55,286 110,275 165,268 220,250 275,238 330,225 385,220 440,205 495,198 550,193 605,185 660,178 715,172 800,168">
         </polyline>
        </svg>
       </div>
       <div class="telemetry-cards">
        <div class="telemetry-card">
         <small>
          CPU peak
         </small>
         <b>
          82°C
         </b>
        </div>
        <div class="telemetry-card">
         <small>
          GPU peak
         </small>
         <b>
          71°C
         </b>
        </div>
        <div class="telemetry-card">
         <small>
          Throttle
         </small>
         <b class="good">
          NO
         </b>
        </div>
        <div class="telemetry-card">
         <small>
          Errors
         </small>
         <b class="good">
          0
         </b>
        </div>
       </div>
      </div>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        System proof
       </div>
       <h2>
        Measure heat, stability and behavior under load.
       </h2>
      </div>
      <p class="section-lede">
       Validation is a controlled test sequence: establish idle behavior, apply load, watch temperatures and clocks, then confirm the machine returns to idle normally. You are looking for repeatable, boring stability.
      </p>
     </div>
     <div class="cards">
      <article class="card reveal">
       <span class="num">
        01 · Baseline
       </span>
       <h3>
        Record idle behavior.
       </h3>
       <p>
        Let the system settle and note CPU temperature, GPU temperature, pump speed and fan noise before stressing anything.
       </p>
      </article>
      <article class="card reveal">
       <span class="num">
        02 · CPU load
       </span>
       <h3>
        Watch the i9 under sustained work.
       </h3>
       <p>
        Use a reputable CPU workload or benchmark and monitor temperature, clock behavior and whether the cooler can sustain the load without abnormal throttling.
       </p>
      </article>
      <article class="card reveal">
       <span class="num">
        03 · GPU load
       </span>
       <h3>
        Check graphics thermals and power.
       </h3>
       <p>
        Run a graphics-heavy workload while watching GPU temperature, fan behavior and power stability. Any artifacting or crashes require investigation.
       </p>
      </article>
      <article class="card wide success reveal">
       <span class="num">
        Pass condition
       </span>
       <h3>
        A stable system is predictable.
       </h3>
       <p>
        The system completes repeatable workloads, temperatures stay controlled, clocks behave consistently, and no component disappears or throws errors.
       </p>
       <div class="checks">
        <div class="check">
         No unexpected shutdowns
        </div>
        <div class="check">
         No thermal runaway
        </div>
        <div class="check">
         No visible graphics artifacts
        </div>
        <div class="check">
         Fans return to quiet idle behavior
        </div>
       </div>
      </article>
      <article class="card warning reveal">
       <span class="num">
        If it fails
       </span>
       <h3>
        Change one variable at a time.
       </h3>
       <p>
        Return memory to defaults, inspect power connectors, re-check cooler mounting, and isolate the failure instead of changing many settings at once.
       </p>
      </article>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Validation.js") %>"></script>
</asp:Content>
