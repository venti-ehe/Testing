<%@ Page Title="BUILD//LAB · Parts Guide" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="PartsGuide.aspx.cs" Inherits="Testing.PartsGuide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Foundation · Know the machine
      </span>
      <h1>
       Build it right.
       <span class="accent">
        Understand it first.
       </span>
      </h1>
      <p class="hero-copy">
       Before a single screw turns, learn what each component contributes to the system. This overview keeps the build grounded in function, not just part names.
      </p>
      <div class="stat-row">
       <span class="stat">
        6 core components
       </span>
       <span class="stat">
        Intel i9-14900K platform
       </span>
       <span class="stat">
        Guided build flow
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
     <div class="lab-visual reveal">
      <span class="label">
       SYSTEM MAP // COMPONENT STACK
      </span>
      <div class="orbit o1">
      </div>
      <div class="orbit o2">
      </div>
      <img alt="Motherboard" class="product" src="B760 M plus wifi motherboard.png" style="width:70%;height:70%;left:15%;top:15%;opacity:.56"/>
      <img alt="Intel Core i9-14900K" class="product" src="I9-14900k.png" style="width:24%;height:24%;left:38%;top:38%;z-index:4"/>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        System anatomy
       </div>
       <h2>
        Meet the six pieces that make the build work.
       </h2>
      </div>
      <p class="section-lede">
       Every component has a specific job. The CPU computes, the motherboard connects, RAM keeps active data close, the GPU renders, the PSU distributes power, and the chassis controls the physical environment around everything.
      </p>
     </div>
     <div class="parts-grid">
      <div class="part-card reveal">
       <img alt="Intel Core i9-14900K" src="I9-14900k.png"/>
       <span class="role">
        Compute
       </span>
       <h3>
        The CPU
       </h3>
       <p>
        The system's main processing engine. It calculates instructions and coordinates demanding workloads in real time.
       </p>
      </div>
      <div class="part-card reveal">
       <img alt="B760M motherboard" src="B760 M plus wifi motherboard.png"/>
       <span class="role">
        Interconnect
       </span>
       <h3>
        The Motherboard
       </h3>
       <p>
        The central circuit platform that lets the CPU, memory, graphics, storage and I/O communicate.
       </p>
      </div>
      <div class="part-card reveal">
       <img alt="DDR5 memory" src="Lancer blade ram.png"/>
       <span class="role">
        Working memory
       </span>
       <h3>
        System RAM
       </h3>
       <p>
        Fast temporary workspace for active applications and data the processor needs immediately.
       </p>
      </div>
      <div class="part-card reveal">
       <img alt="Graphics card" src="RX 9060xt.png"/>
       <span class="role">
        Graphics
       </span>
       <h3>
        The GPU
       </h3>
       <p>
        A dedicated rendering engine that produces the frames your monitor displays and carries graphics-heavy workloads.
       </p>
      </div>
      <div class="part-card reveal">
       <img alt="Power supply" src="PSU.jpg"/>
       <span class="role">
        Power delivery
       </span>
       <h3>
        The PSU
       </h3>
       <p>
        Converts wall power into stable rails for the motherboard, processor, graphics card, storage and cooling hardware.
       </p>
      </div>
      <div class="part-card reveal">
       <img alt="PC chassis" src="case.png"/>
       <span class="role">
        Airflow + structure
       </span>
       <h3>
        The Chassis
       </h3>
       <p>
        Protects the hardware, determines component fit, and establishes the intake-to-exhaust airflow path.
       </p>
      </div>
     </div>
    </div>
   </section>
   <section class="section">
    <div class="section-inner">
     <div class="cards">
      <article class="card wide reveal">
       <span class="num">
        Build logic
       </span>
       <h3>
        The order is deliberate.
       </h3>
       <p>
        Seat the CPU first, solve cooling before heat becomes a problem, install memory while access is open, move the core assembly into the chassis, then finish with graphics and power wiring.
       </p>
      </article>
      <article class="card success reveal">
       <span class="num">
        Ready
       </span>
       <h3>
        Start with the CPU.
       </h3>
       <p>
        The next page focuses on alignment, socket safety, and what the processor is responsible for.
       </p>
      </article>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/PartsGuide.js") %>"></script>
</asp:Content>
