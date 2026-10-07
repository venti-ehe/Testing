<%@ Page Title="BUILD//LAB · Step 2 Cooling" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Cooling.aspx.cs" Inherits="Testing.Cooling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 2 · Thermal management
      </span>
      <h1>
       Tame the heat.
       <span class="accent">
        Design the airflow.
       </span>
      </h1>
      <p class="hero-copy">
       A high-performance CPU needs a complete thermal system: thermal interface, cooler mounting, radiator airflow, pump/fan wiring and post-build validation.
      </p>
      <div class="stat-row">
       <span class="stat">
        360 mm AIO plan
       </span>
       <span class="stat">
        Top exhaust radiator
       </span>
       <span class="stat">
        Front / bottom intake
       </span>
       <span class="stat">
        LGA1700 mounting
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
     <div class="lab-visual cool-stage reveal">
      <span class="label">
       THERMAL LOOP // 360 MM AIO
      </span>
      <div class="air a1">
       ↑
      </div>
      <div class="air a2">
       ↑
      </div>
      <div class="air a3">
       ↑
      </div>
      <div class="radiator">
       <div class="fan">
       </div>
       <div class="fan">
       </div>
       <div class="fan">
       </div>
      </div>
      <img alt="B760M motherboard" class="product mobo" src="B760 M plus wifi motherboard.png"/>
      <img alt="Intel Core i9-14900K" class="product cpu" src="I9-14900k.png"/>
      <div class="pump">
      </div>
      <div class="tube t1">
      </div>
      <div class="tube t2">
      </div>
      <span class="bp-tag" style="left:6%;bottom:8%">
       Front / bottom intake
      </span>
      <span class="bp-tag" style="right:6%;top:38%">
       Top exhaust
      </span>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        Cooling architecture
       </div>
       <h2>
        Cooling is a system, not a single component.
       </h2>
      </div>
      <p class="section-lede">
       The objective is to move heat from the CPU into the cooler, move that heat into the radiator, and then move the radiator's hot air out of the chassis while maintaining fresh intake air for the rest of the system.
      </p>
     </div>
     <div class="timeline">
      <aside class="timeline-rail">
       <strong>
        Thermal sequence
       </strong>
       <a href="#cool1">
        <span>
         01
        </span>
        Capacity
       </a>
       <a href="#cool2">
        <span>
         02
        </span>
        Paste + pressure
       </a>
       <a href="#cool3">
        <span>
         03
        </span>
        Airflow
       </a>
       <a href="#cool4">
        <span>
         04
        </span>
        Wiring
       </a>
       <a href="#cool5">
        <span>
         05
        </span>
        Validate
       </a>
      </aside>
      <div class="timeline-body">
       <article class="lesson reveal" id="cool1">
        <span class="stepno">
         01 · Cooling capacity
        </span>
        <h3>
         Plan around a 360 mm-class AIO when the chassis supports it.
        </h3>
        <p>
         The existing design uses three 120 mm radiator fans and the correct LGA1700 mounting hardware. The radiator is positioned at the top of the case as exhaust.
        </p>
        <div class="checks">
         <div class="check">
          360 mm radiator
         </div>
         <div class="check">
          Three 120 mm fans
         </div>
         <div class="check">
          Correct LGA1700 bracket
         </div>
         <div class="check">
          Case clearance verified
         </div>
        </div>
       </article>
       <article class="lesson reveal" id="cool2">
        <span class="stepno">
         02 · Thermal interface
        </span>
        <h3>
         Clean surfaces. Small paste application. Even mounting pressure.
        </h3>
        <p>
         Remove the protective film from the cold plate, clean the CPU heat spreader, apply a small pea-sized amount of paste in the center, then lower the pump block straight down.
        </p>
        <div class="callout">
         <strong>
          Tightening pattern:
         </strong>
         bring the mounting screws down gradually in a diagonal cross pattern so pressure stays even.
        </div>
       </article>
       <article class="lesson reveal" id="cool3">
        <span class="stepno">
         03 · Airflow path
        </span>
        <h3>
         Cool air in. Radiator heat out.
        </h3>
        <p>
         Use front and/or bottom fans as intake, with the top radiator and rear fan exhausting warm air. This creates a predictable path across the motherboard, memory and graphics area.
        </p>
       </article>
       <article class="lesson reveal" id="cool4">
        <span class="stepno">
         04 · Pump + fans
        </span>
        <h3>
         Wire for monitoring as well as movement.
        </h3>
        <p>
         Connect the pump to AIO_PUMP when available. Connect radiator fans to CPU_FAN through the included splitter or controller so the motherboard can see fan speed.
        </p>
        <p>
         Use a steady high pump speed and a gradual radiator-fan curve so the system stays calmer at light load but increases airflow as temperature rises.
        </p>
       </article>
       <article class="lesson reveal" id="cool5">
        <span class="stepno">
         05 · Validation
        </span>
        <h3>
         Verify the thermal system before blaming the cooler.
        </h3>
        <p>
         After the build is complete, monitor CPU temperature, pump RPM and radiator fan RPM during a short CPU-heavy workload. If temperature behaviour looks wrong, re-check mounting pressure, paste coverage, pump operation, radiator airflow and firmware power settings.
        </p>
        <div class="checks">
         <div class="check">
          Pump RPM detected
         </div>
         <div class="check">
          Radiator fans detected
         </div>
         <div class="check">
          Airflow direction confirmed
         </div>
         <div class="check">
          Temperature response looks controlled
         </div>
        </div>
       </article>
      </div>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Cooling.js") %>"></script>
</asp:Content>
