<%@ Page Title="BUILD//LAB · Step 5 GPU + Wiring" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="GpuWiring.aspx.cs" Inherits="Testing.GpuWiring" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 5 · Graphics + power
      </span>
      <h1>
       Install the GPU.
       <span class="accent">
        Wire it like a system.
       </span>
      </h1>
      <p class="hero-copy">
       The last assembly stage combines graphics installation, power delivery, case I/O and a deliberate pre-power inspection before the first boot.
      </p>
      <div class="stat-row">
       <span class="stat">
        Primary PCIe x16 slot
       </span>
       <span class="stat">
        Dedicated GPU power
       </span>
       <span class="stat">
        24-pin ATX + CPU EPS
       </span>
       <span class="stat">
        First-boot inspection
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
     <div class="lab-visual gpu-stage reveal">
      <span class="label">
       FINAL ASSEMBLY // GPU + POWER
      </span>
      <img alt="PC chassis" class="product case" src="case.png"/>
      <img alt="B760M motherboard" class="product mobo" src="B760 M plus wifi motherboard.png"/>
      <img alt="Graphics card" class="product gpu" src="RX 9060xt.png"/>
      <div class="power">
      </div>
      <span class="bp-tag" style="left:7%;bottom:10%">
       Primary PCIe x16
      </span>
      <span class="bp-tag" style="right:7%;top:19%">
       Secure bracket
      </span>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        Final assembly
       </div>
       <h2>
        Every connector is now part of the boot path.
       </h2>
      </div>
      <p class="section-lede">
       The goal is not simply to plug in cables. It is to seat the GPU correctly, route power without unnecessary strain, complete the motherboard connections and perform one controlled inspection before mains power is applied.
      </p>
     </div>
     <div class="timeline">
      <aside class="timeline-rail">
       <strong>
        Final sequence
       </strong>
       <a href="#gpu1">
        <span>
         01
        </span>
        Seat GPU
       </a>
       <a href="#gpu2">
        <span>
         02
        </span>
        GPU power
       </a>
       <a href="#gpu3">
        <span>
         03
        </span>
        Main wiring
       </a>
       <a href="#gpu4">
        <span>
         04
        </span>
        Inspect
       </a>
       <a href="#gpu5">
        <span>
         05
        </span>
        First boot
       </a>
      </aside>
      <div class="timeline-body">
       <article class="lesson reveal" id="gpu1">
        <span class="stepno">
         01 · Graphics card
        </span>
        <h3>
         Use the primary full-length PCIe slot.
        </h3>
        <p>
         Remove the required rear expansion-slot covers, align the GPU's gold edge connector with the top PCIe x16 slot, and press the card straight down until the retention clip locks. Secure the bracket to the chassis.
        </p>
       </article>
       <article class="lesson reveal" id="gpu2">
        <span class="stepno">
         02 · GPU power
        </span>
        <h3>
         Route the correct PSU cable and seat it completely.
        </h3>
        <p>
         Bring the GPU power lead through the nearest cable-management opening. Insert the connector squarely with no visible gap and avoid forcing an immediate sharp bend at the connector.
        </p>
        <div class="callout">
         <strong>
          Use:
         </strong>
         the GPU/PCIe power cable supplied for the specific PSU in the build.
        </div>
       </article>
       <article class="lesson reveal" id="gpu3">
        <span class="stepno">
         03 · Main wiring
        </span>
        <h3>
         Complete the motherboard and front-panel connections.
        </h3>
        <ul>
         <li>
          <strong>
           24-pin ATX:
          </strong>
          large motherboard power connector.
         </li>
         <li>
          <strong>
           CPU EPS:
          </strong>
          CPU power near the upper-left motherboard area.
         </li>
         <li>
          <strong>
           Front-panel headers:
          </strong>
          power switch, reset, LEDs and case I/O.
         </li>
         <li>
          <strong>
           USB / audio headers:
          </strong>
          connect the chassis front ports and audio lead.
         </li>
        </ul>
       </article>
       <article class="lesson reveal" id="gpu4">
        <span class="stepno">
         04 · Pre-power inspection
        </span>
        <h3>
         Spend one minute preventing a one-hour troubleshooting session.
        </h3>
        <div class="checks">
         <div class="check">
          GPU fully seated and screwed in
         </div>
         <div class="check">
          ATX, CPU EPS and GPU power latched
         </div>
         <div class="check">
          Pump and fans connected
         </div>
         <div class="check">
          No loose screw inside chassis
         </div>
         <div class="check">
          No cable touches a fan blade
         </div>
         <div class="check">
          Monitor connected to graphics output
         </div>
        </div>
       </article>
       <article class="lesson reveal" id="gpu5">
        <span class="stepno">
         05 · First-boot readiness
        </span>
        <h3>
         Boot into firmware and verify the build before moving on.
        </h3>
        <p>
         Confirm CPU temperature behaviour, memory detection, storage detection, and fan/pump operation. The point of the first boot is to prove the hardware foundation before loading the rest of the software stack.
        </p>
        <div class="callout">
         <strong>
          Build complete:
         </strong>
         if the hardware checks are good, return to the system map or continue your own setup workflow.
        </div>
       </article>
      </div>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/GpuWiring.js") %>"></script>
</asp:Content>
