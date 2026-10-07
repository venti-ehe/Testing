<%@ Page Title="BUILD//LAB · Final Assembly Challenge" Language="C#" MasterPageFile="~/BuildLab.Master" AutoEventWireup="true" CodeBehind="FinalChallenge.aspx.cs" Inherits="Testing.FinalChallenge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <main class="challenge-shell" id="challengeApp">
    <div class="challenge-head">
     <div>
      <span class="kicker">
       <i>
       </i>
       Final practical assessment
      </span>
      <h1>
       BUILD//LAB
       <span class="accent">
        Assembly Challenge.
       </span>
      </h1>
     </div>
     <p>
      Drag each component into the correct motherboard or chassis location. Correct placements build combo points. Mistakes cost score. Use hints only when you really need them.
     </p>
    </div>
    <div class="hud">
     <div class="hud-box">
      <small>
       Installed
      </small>
      <b>
       <span class="green" id="installedCount">
        0
       </span>
       /10
      </b>
     </div>
     <div class="hud-box">
      <small>
       Score
      </small>
      <b class="cyan" id="scoreValue">
       0
      </b>
     </div>
     <div class="hud-box">
      <small>
       Combo
      </small>
      <b id="comboValue">
       x1
      </b>
     </div>
     <div class="hud-box">
      <small>
       Time
      </small>
      <b class="amber" id="timerValue">
       00:00
      </b>
     </div>
     <div class="hud-box">
      <small>
       Accuracy
      </small>
      <b id="accuracyValue">
       100%
      </b>
     </div>
    </div>
    <div class="game-layout">
     <section class="inventory">
      <div class="inventory-head">
       <h2>
        Component inventory
       </h2>
       <div class="mode-toggle">
        <button class="active" data-mode="normal" type="button">
         Normal
        </button>
        <button data-mode="pro" type="button">
         Pro
        </button>
       </div>
      </div>
      <div class="piece-list" id="pieceList">
       <div class="game-piece" data-piece="cpu">
        <span class="piece-icon">
         CPU
        </span>
        <span class="piece-copy">
         <strong>
          Intel i9-14900K
         </strong>
         <small>
          Processor package
         </small>
        </span>
        <span class="piece-tag">
         Compute
        </span>
       </div>
       <div class="game-piece" data-piece="pump">
        <span class="piece-icon">
         AIO
        </span>
        <span class="piece-copy">
         <strong>
          AIO Pump Block
         </strong>
         <small>
          CPU cold plate
         </small>
        </span>
        <span class="piece-tag">
         Cooling
        </span>
       </div>
       <div class="game-piece" data-piece="ram">
        <span class="piece-icon">
         RAM
        </span>
        <span class="piece-copy">
         <strong>
          DDR5 Memory
         </strong>
         <small>
          Primary memory slots
         </small>
        </span>
        <span class="piece-tag">
         Memory
        </span>
       </div>
       <div class="game-piece" data-piece="m2">
        <span class="piece-icon">
         M.2
        </span>
        <span class="piece-copy">
         <strong>
          NVMe SSD
         </strong>
         <small>
          M.2 storage module
         </small>
        </span>
        <span class="piece-tag">
         Storage
        </span>
       </div>
       <div class="game-piece" data-piece="gpu">
        <span class="piece-icon">
         GPU
        </span>
        <span class="piece-copy">
         <strong>
          Graphics Card
         </strong>
         <small>
          PCIe x16 device
         </small>
        </span>
        <span class="piece-tag">
         Graphics
        </span>
       </div>
       <div class="game-piece" data-piece="atx">
        <span class="piece-icon">
         24
        </span>
        <span class="piece-copy">
         <strong>
          24-pin ATX
         </strong>
         <small>
          Mainboard power
         </small>
        </span>
        <span class="piece-tag">
         Power
        </span>
       </div>
       <div class="game-piece" data-piece="eps">
        <span class="piece-icon">
         8P
        </span>
        <span class="piece-copy">
         <strong>
          CPU EPS Power
         </strong>
         <small>
          Processor power input
         </small>
        </span>
        <span class="piece-tag">
         Power
        </span>
       </div>
       <div class="game-piece" data-piece="gpupower">
        <span class="piece-icon">
         PCI
        </span>
        <span class="piece-copy">
         <strong>
          GPU Power
         </strong>
         <small>
          Graphics power cable
         </small>
        </span>
        <span class="piece-tag">
         Power
        </span>
       </div>
       <div class="game-piece" data-piece="front">
        <span class="piece-icon">
         FP
        </span>
        <span class="piece-copy">
         <strong>
          Front Panel
         </strong>
         <small>
          Power/reset/LED header
         </small>
        </span>
        <span class="piece-tag">
         I/O
        </span>
       </div>
       <div class="game-piece" data-piece="fan">
        <span class="piece-icon">
         FAN
        </span>
        <span class="piece-copy">
         <strong>
          Case Fan Header
         </strong>
         <small>
          Chassis fan connection
         </small>
        </span>
        <span class="piece-tag">
         Cooling
        </span>
       </div>
      </div>
      <div class="game-actions">
       <button class="hint-btn" id="hintBtn" type="button">
        Reveal one target (-75)
       </button>
       <button class="reset-btn" id="resetBtn" type="button">
        Reset challenge
       </button>
      </div>
     </section>
     <section aria-label="PC assembly board" class="build-board" id="buildBoard">
      <span class="board-label">
       MOTHERBOARD + CHASSIS // DROP ZONES
      </span>
      <div class="motherboard-map">
       <i class="pcb-line" style="left:20%;top:20%;width:58%;rotate:18deg">
       </i>
       <i class="pcb-line" style="left:17%;top:48%;width:66%;rotate:-8deg">
       </i>
       <i class="pcb-line" style="left:32%;top:78%;width:45%;rotate:-28deg">
       </i>
       <div class="drop-slot slot-cpu" data-accept="cpu">
        CPU socket
       </div>
       <div class="drop-slot slot-pump" data-accept="pump">
        Cooler / pump
       </div>
       <div class="drop-slot slot-ram" data-accept="ram">
        DDR5 slots
       </div>
       <div class="drop-slot slot-m2" data-accept="m2">
        M.2 socket
       </div>
       <div class="drop-slot slot-gpu" data-accept="gpu">
        PCIe x16 slot
       </div>
       <div class="drop-slot slot-atx" data-accept="atx">
        24-pin ATX
       </div>
       <div class="drop-slot slot-eps" data-accept="eps">
        CPU EPS
       </div>
       <div class="drop-slot slot-gpupower" data-accept="gpupower">
        GPU power
       </div>
       <div class="drop-slot slot-front" data-accept="front">
        Front panel header
       </div>
       <div class="drop-slot slot-fan" data-accept="fan">
        Fan header
       </div>
      </div>
     </section>
    </div>
   </main>
   <div class="game-toast" id="gameToast">
   </div>
   <div class="finish-modal" id="finishModal">
    <div class="finish-card">
     <div class="rank-badge" id="rankBadge">
      S
     </div>
     <div class="eyebrow">
      Challenge complete
     </div>
     <h2 id="finishTitle">
      System assembled.
     </h2>
     <p id="finishCopy">
      You matched every component with its correct connection point.
     </p>
     <div class="finish-stats">
      <div class="finish-stat">
       <small>
        Score
       </small>
       <b id="finishScore">
        0
       </b>
      </div>
      <div class="finish-stat">
       <small>
        Time
       </small>
       <b id="finishTime">
        00:00
       </b>
      </div>
      <div class="finish-stat">
       <small>
        Accuracy
       </small>
       <b id="finishAccuracy">
        100%
       </b>
      </div>
     </div>
     <div class="hero-actions" style="justify-content:center">
      <button class="btn primary" id="playAgainBtn" type="button">
       Play again
      </button>
      <a class="btn" href="PartsGuide.aspx">
       Restart course
      </a>
     </div>
    </div>
   </div>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= ResolveUrl("~/js/FinalChallenge.js") %>"></script>
</asp:Content>
