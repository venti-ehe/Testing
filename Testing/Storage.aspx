<%@ Page Title="BUILD//LAB · Step 6 Storage" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="Storage.aspx.cs" Inherits="Testing.Storage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="hero">
    <div class="hero-inner">
     <div class="reveal">
      <span class="kicker">
       <i>
       </i>
       Build Step 6 · Storage
      </span>
      <h1>
       Install the drive.
       <span class="accent">
        Remove the bottleneck.
       </span>
      </h1>
      <p class="hero-copy">
       A modern NVMe SSD connects directly through M.2. The installation is tiny, but getting the slot, angle, standoff and heatsink right prevents annoying rework later.
      </p>
      <div class="stat-row">
       <span class="stat">
        M.2 NVMe
       </span>
       <span class="stat">
        PCIe storage path
       </span>
       <span class="stat">
        Heatsink + standoff
       </span>
      </div>
      <div class="hero-actions">
       <a class="btn primary" href="#content">
        Open storage lab ↓
       </a>
       <a class="btn" href="PartsGuide.aspx">
        Build map
       </a>
      </div>
     </div>
     <div class="lab-visual storage-stage reveal">
      <span class="label">
       STORAGE // M.2 NVMe
      </span>
      <img alt="Motherboard" class="product mobo" src="B760 M plus wifi motherboard.png"/>
      <div class="m2-board">
       <i class="m2-chip c1">
       </i>
       <i class="m2-chip c2">
       </i>
       <i class="m2-chip c3">
       </i>
      </div>
      <div class="m2-screw">
      </div>
      <div class="storage-beam">
      </div>
      <span class="bp-tag" style="left:8%;top:17%">
       PCIe data path
      </span>
      <span class="bp-tag" style="right:8%;bottom:14%">
       Secure at standoff
      </span>
     </div>
    </div>
   </section>
   <section class="section" id="content">
    <div class="section-inner">
     <div class="section-head reveal">
      <div>
       <div class="eyebrow">
        Fast storage
       </div>
       <h2>
        Small module. Huge impact on responsiveness.
       </h2>
      </div>
      <p class="section-lede">
       The M.2 drive becomes the fast home for Windows, games and active project files. The important details are choosing the correct slot, inserting at an angle, securing the module flat, and restoring any motherboard heatsink correctly.
      </p>
     </div>
     <div class="timeline">
      <aside class="timeline-rail">
       <strong>
        Storage sequence
       </strong>
       <a href="#s1">
        <span>
         01
        </span>
        Choose slot
       </a>
       <a href="#s2">
        <span>
         02
        </span>
        Insert
       </a>
       <a href="#s3">
        <span>
         03
        </span>
        Secure
       </a>
       <a href="#s4">
        <span>
         04
        </span>
        Verify
       </a>
      </aside>
      <div class="timeline-body">
       <article class="lesson reveal" id="s1">
        <span class="stepno">
         01 · Slot selection
        </span>
        <h3>
         Use the correct M.2 socket for the drive.
        </h3>
        <p>
         Locate the motherboard M.2 slot and check that the mounting point matches the length of the SSD. If a heatsink covers the slot, remove it first and keep its screw safe.
        </p>
       </article>
       <article class="lesson reveal" id="s2">
        <span class="stepno">
         02 · Insert
        </span>
        <h3>
         Slide the edge connector in at a shallow angle.
        </h3>
        <p>
         Align the notch, insert the SSD fully, then lower the free end toward the standoff. Never force an M.2 module into a socket with the notch misaligned.
        </p>
        <div class="callout">
         <strong>
          Visual cue:
         </strong>
         the gold edge connector should be almost completely inside the socket before the drive is pressed flat.
        </div>
       </article>
       <article class="lesson reveal" id="s3">
        <span class="stepno">
         03 · Secure
        </span>
        <h3>
         Hold it flat without overtightening.
        </h3>
        <p>
         Use the board's latch or small screw to secure the SSD. Reinstall the M.2 heatsink and remove any protective film from a thermal pad before it contacts the drive.
        </p>
       </article>
       <article class="lesson reveal" id="s4">
        <span class="stepno">
         04 · Verification
        </span>
        <h3>
         Confirm detection later in BIOS.
        </h3>
        <p>
         The physical install is complete when the module is level and secure. On first boot, you will verify that the BIOS detects the NVMe drive before installing an operating system.
        </p>
        <div class="checks">
         <div class="check">
          Correct M.2 slot selected
         </div>
         <div class="check">
          Drive fully seated
         </div>
         <div class="check">
          Standoff/latch secured
         </div>
         <div class="check">
          Heatsink restored correctly
         </div>
        </div>
       </article>
      </div>
     </div>
    </div>
   </section>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/Storage.js") %>"></script>
</asp:Content>
