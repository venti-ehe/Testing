<%@ Page Title="BUILD//LAB · Step 8 BIOS" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Bios.aspx.cs" Inherits="Testing.Bios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 8 · First Boot
      </span>
      <h1>
       Power on.
       <span class="accent">
        Read what the system tells you.
       </span>
      </h1>
      <p class="hero-copy">
       The first successful POST is the moment hardware becomes a working computer. Before installing software, verify memory, storage, temperatures and fan/pump operation in firmware.
      </p>
      <div class="stat-row">
       <span class="stat">
        POST
       </span>
       <span class="stat">
        XMP / memory profile
       </span>
       <span class="stat">
        Pump + fan monitoring
       </span>
      </div>
      <div class="hero-actions">
       <a class="btn primary" href="#content">
        Enter BIOS checklist ↓
       </a>
       <a class="btn" href="Validation.aspx">
        Jump to validation
       </a>
      </div>
     </div>
     <div class="lab-visual bios-stage reveal">
      <span class="label">
       UEFI // FIRST BOOT DIAGNOSTICS
      </span>
      <div class="bios-screen">
       <div class="bios-head">
        <span>
         BUILD//LAB UEFI
        </span>
        <b>
         SYSTEM READY
        </b>
       </div>
       <div class="bios-grid">
        <div class="bios-pane">
         <h4>
          HARDWARE DETECTION
         </h4>
         <div class="bios-row">
          <span>
           CPU
          </span>
          <b>
           Intel Core i9-14900K
          </b>
         </div>
         <div class="bios-row">
          <span>
           Memory
          </span>
          <b class="bios-ok">
           DDR5 detected
          </b>
         </div>
         <div class="bios-row">
          <span>
           NVMe
          </span>
          <b class="bios-ok">
           Drive detected
          </b>
         </div>
         <div class="bios-row">
          <span>
           AIO Pump
          </span>
          <b class="bios-ok">
           Running
          </b>
         </div>
         <div class="bios-row">
          <span>
           Boot mode
          </span>
          <b>
           UEFI
          </b>
         </div>
        </div>
        <div class="bios-pane">
         <h4>
          CPU THERMAL SNAPSHOT
         </h4>
         <div class="temp-dial">
          <span>
           34°C
           <small>
            IDLE / BIOS
           </small>
          </span>
         </div>
         <div class="bios-row">
          <span>
           CPU Fan
          </span>
          <b>
           980 RPM
          </b>
         </div>
         <div class="bios-row">
          <span>
           Pump
          </span>
          <b>
           2500 RPM
          </b>
         </div>
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
        First POST
       </div>
       <h2>
        Verify hardware before chasing performance.
       </h2>
      </div>
      <p class="section-lede">
       Do not immediately tune everything. First prove that the system can detect its hardware and keep the CPU cool at idle. Only then enable memory profiles and continue to operating-system installation.
      </p>
     </div>
     <div class="timeline">
      <aside class="timeline-rail">
       <strong>
        First boot
       </strong>
       <a href="#b1">
        <span>
         01
        </span>
        POST
       </a>
       <a href="#b2">
        <span>
         02
        </span>
        Detect
       </a>
       <a href="#b3">
        <span>
         03
        </span>
        Thermals
       </a>
       <a href="#b4">
        <span>
         04
        </span>
        Memory
       </a>
      </aside>
      <div class="timeline-body">
       <article class="lesson reveal" id="b1">
        <span class="stepno">
         01 · POST
        </span>
        <h3>
         Watch for a clean Power-On Self-Test.
        </h3>
        <p>
         If the system reaches firmware setup, the CPU, board, memory and basic graphics path have passed the earliest startup checks.
        </p>
       </article>
       <article class="lesson reveal" id="b2">
        <span class="stepno">
         02 · Detection
        </span>
        <h3>
         Confirm the hardware list matches the build.
        </h3>
        <p>
         Check that the correct CPU model, expected memory capacity and NVMe drive are visible. Missing hardware is easier to troubleshoot before an operating system is involved.
        </p>
       </article>
       <article class="lesson reveal" id="b3">
        <span class="stepno">
         03 · Thermals
        </span>
        <h3>
         Temperature is your safety signal.
        </h3>
        <p>
         Look at CPU temperature and make sure the AIO pump reports activity. A rapidly climbing idle temperature is a reason to shut down and inspect cooler mounting, pump power and thermal contact.
        </p>
        <div class="callout danger">
         <strong>
          Do not continue:
         </strong>
         if CPU temperature rises abnormally fast at idle, power the system off and inspect the cooling loop.
        </div>
       </article>
       <article class="lesson reveal" id="b4">
        <span class="stepno">
         04 · Memory profile
        </span>
        <h3>
         Enable the rated memory profile only after baseline stability.
        </h3>
        <p>
         Once default settings boot correctly, enable the appropriate XMP profile if your memory kit and motherboard configuration support it, then save and reboot.
        </p>
       </article>
      </div>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Bios.js") %>"></script>
</asp:Content>
