<%@ Page Title="BUILD//LAB · Step 1 CPU" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="CpuInstall.aspx.cs" Inherits="Testing.CpuInstall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 1 · Processor
      </span>
      <h1>
       Seat the CPU.
       <span class="accent">
        Zero force. Zero guesswork.
       </span>
      </h1>
      <p class="hero-copy">
       The CPU installation is simple when alignment is correct. The goal is to place the i9-14900K into the LGA socket without dragging, twisting, or forcing it.
      </p>
      <div class="stat-row">
       <span class="stat">
        Golden triangle alignment
       </span>
       <span class="stat">
        Protect LGA socket pins
       </span>
       <span class="stat">
        Thermals come next
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
     <div class="lab-visual cpu-stage reveal">
      <span class="label">
       CPU SOCKET // ALIGNMENT
      </span>
      <img alt="B760M motherboard" class="product mobo" src="B760 M plus wifi motherboard.png"/>
      <div class="socket-glow">
      </div>
      <img alt="Intel Core i9-14900K" class="product cpu" src="I9-14900k.png"/>
      <span class="tri" title="Alignment triangle">
      </span>
      <span class="bp-tag" style="left:7%;top:18%">
       LGA socket
      </span>
      <span class="bp-tag" style="right:7%;bottom:16%">
       Triangle = orientation
      </span>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        Precision first
       </div>
       <h2>
        The socket is fragile. Your process should not be.
       </h2>
      </div>
      <p class="section-lede">
       Treat CPU installation as an alignment task, not a force task. If the chip is oriented correctly, it sits naturally in the socket and the retention mechanism does the securing.
      </p>
     </div>
     <div class="timeline">
      <aside class="timeline-rail">
       <strong>
        CPU sequence
       </strong>
       <a href="#cpu1">
        <span>
         01
        </span>
        Align
       </a>
       <a href="#cpu2">
        <span>
         02
        </span>
        Protect pins
       </a>
       <a href="#cpu3">
        <span>
         03
        </span>
        Understand load
       </a>
       <a href="#cpu4">
        <span>
         04
        </span>
        Handoff to cooling
       </a>
      </aside>
      <div class="timeline-body">
       <article class="lesson reveal" id="cpu1">
        <span class="stepno">
         01 · Alignment
        </span>
        <h3>
         The golden triangle is your reference point.
        </h3>
        <p>
         Match the tiny triangle on the CPU with the matching marker on the motherboard socket. Lower the processor straight into position. Correct orientation should not require pressure.
        </p>
        <div class="callout">
         <strong>
          Rule:
         </strong>
         if you feel the need to push the CPU into place, stop and re-check orientation.
        </div>
       </article>
       <article class="lesson reveal" id="cpu2">
        <span class="stepno">
         02 · LGA socket
        </span>
        <h3>
         The fragile contacts are on the motherboard.
        </h3>
        <p>
         Modern Intel LGA sockets use many delicate contacts in the socket itself. Dropping or sliding the CPU at an angle can damage them.
        </p>
        <div class="callout danger">
         <strong>
          Stop condition:
         </strong>
         unusual resistance while closing the retention arm means you should verify alignment before continuing.
        </div>
       </article>
       <article class="lesson reveal" id="cpu3">
        <span class="stepno">
         03 · Why the CPU matters
        </span>
        <h3>
         It runs the system's core logic.
        </h3>
        <p>
         The processor tracks game logic, objects, physics and a constant stream of input data. Fast peripherals can also increase the amount of input information the CPU must process every second.
        </p>
       </article>
       <article class="lesson reveal" id="cpu4">
        <span class="stepno">
         04 · Thermal handoff
        </span>
        <h3>
         Installed does not mean ready to run.
        </h3>
        <p>
         The i9-14900K still needs a complete cooling solution. Before first power-up, the cold plate, thermal interface, pump and radiator airflow all need to be in place.
        </p>
        <div class="checks">
         <div class="check">
          CPU is flat and correctly oriented
         </div>
         <div class="check">
          Retention mechanism closes normally
         </div>
         <div class="check">
          No contact with socket pins
         </div>
         <div class="check">
          Ready for cooler mounting
         </div>
        </div>
       </article>
      </div>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/CpuInstall.js") %>"></script>
</asp:Content>
