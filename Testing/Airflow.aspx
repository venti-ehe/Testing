<%@ Page Title="BUILD//LAB · Step 7 Airflow" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Airflow.aspx.cs" Inherits="Testing.Airflow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 7 · Airflow
      </span>
      <h1>
       Control the air.
       <span class="accent">
        Control the temperature.
       </span>
      </h1>
      <p class="hero-copy">
       Cooling performance is a system. Intake fans deliver cool air, the radiator and exhaust path remove heat, and sensible pressure keeps hot pockets and dust under control.
      </p>
      <div class="stat-row">
       <span class="stat">
        Front intake
       </span>
       <span class="stat">
        Top / rear exhaust
       </span>
       <span class="stat">
        Slight positive pressure
       </span>
      </div>
      <div class="hero-actions">
       <a class="btn primary" href="#content">
        Map the airflow ↓
       </a>
       <a class="btn" href="Cooling.aspx">
        Review CPU cooling
       </a>
      </div>
     </div>
     <div class="lab-visual airflow-stage reveal">
      <span class="label">
       CASE THERMALS // FLOW MAP
      </span>
      <img alt="PC case" class="product case" src="case.png"/>
      <i class="case-fan f1">
      </i>
      <i class="case-fan f2">
      </i>
      <i class="case-fan f3">
      </i>
      <i class="case-fan f4">
      </i>
      <i class="case-fan f5">
      </i>
      <span class="flow-arrow flow-in a">
      </span>
      <span class="flow-arrow flow-in b">
      </span>
      <span class="flow-arrow flow-in c">
      </span>
      <span class="flow-arrow flow-out a">
      </span>
      <span class="flow-arrow flow-out b">
      </span>
      <span class="flow-arrow flow-out c">
      </span>
      <div class="pressure-chip">
       INTAKE > EXHAUST // SLIGHT POSITIVE PRESSURE
      </div>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        Thermal architecture
       </div>
       <h2>
        Give hot air a predictable exit route.
       </h2>
      </div>
      <p class="section-lede">
       Good airflow is less about adding as many fans as possible and more about creating a clean path through the case. For a high-power i9 build, consistent intake, radiator exhaust and cable clearance matter.
      </p>
     </div>
     <div class="cards">
      <article class="card reveal">
       <span class="num">
        Intake
       </span>
       <h3>
        Feed the system with cool air.
       </h3>
       <p>
        Front or bottom intake fans should push filtered room air toward the GPU, motherboard and CPU cooler.
       </p>
      </article>
      <article class="card reveal">
       <span class="num">
        Exhaust
       </span>
       <h3>
        Let heat leave naturally.
       </h3>
       <p>
        Top and rear exhaust locations work with rising hot air and are ideal positions for radiator exhaust.
       </p>
      </article>
      <article class="card reveal">
       <span class="num">
        Pressure
       </span>
       <h3>
        A little more intake is useful.
       </h3>
       <p>
        Slight positive pressure helps reduce unfiltered dust entering through random gaps while keeping fresh air available to the GPU.
       </p>
      </article>
      <article class="card wide reveal">
       <span class="num">
        Fan curve
       </span>
       <h3>
        Noise should scale with temperature, not panic.
       </h3>
       <p>
        Set fans to stay quiet at idle, ramp smoothly through normal gaming temperatures, and become aggressive only when CPU or coolant temperature actually requires it.
       </p>
       <div class="checks">
        <div class="check">
         Front/bottom fans face inward
        </div>
        <div class="check">
         Top/rear fans face outward
        </div>
        <div class="check">
         Radiator airflow is unobstructed
        </div>
        <div class="check">
         Cables do not block the GPU intake
        </div>
       </div>
      </article>
      <article class="card warning reveal">
       <span class="num">
        Avoid
       </span>
       <h3>
        Do not create opposing fan walls.
       </h3>
       <p>
        If nearby fans fight each other, airflow becomes turbulent and heat can recirculate instead of leaving the chassis.
       </p>
      </article>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Airflow.js") %>"></script>
</asp:Content>
