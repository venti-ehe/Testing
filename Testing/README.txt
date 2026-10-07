BUILD//LAB ULTIMATE UPGRADE

WHAT CHANGED
- Fixed the strange/slanted A appearance by forcing Segoe UI/Arial and disabling synthetic italic styling.
- Existing Tests 1-5 preserved and their progress navigation expanded.
- Added Test 6: NVMe / M.2 Storage
- Added Test 7: Case Airflow + Fan Planning
- Added Test 8: First Boot + BIOS/UEFI Verification
- Added Test 9: Thermal / Stability Validation
- Added Test 10: Advanced drag-and-drop final assembly game
- Added BuildGame.js for the final challenge.

FINAL FLOW
Test 1 -> Test 2 -> Test 3_a -> Test 3 -> Test 4 -> Test 5 -> Test 6 -> Test 7 -> Test 8 -> Test 9 -> Test 10

INSTALL
1. Back up your Visual Studio project.
2. Copy/replace all Test *.aspx, *.aspx.cs and *.designer.cs files from this folder.
3. Copy BuildLab.css, BuildLab.js and BuildGame.js into the same project folder.
4. Keep these existing images in the same folder:
   I9-14900k.png
   B760 M plus wifi motherboard.png
   Lancer blade ram.png
   RX 9060xt.png
   PSU.jpg
   case.png
5. In Visual Studio, use Show All Files if the new Test 6-10 files do not appear, then right-click -> Include In Project.
6. Build -> Rebuild Solution. Start from Test 1.aspx.

GAME FEATURES
- Mouse + touch/pointer dragging
- 10 installable components/connections
- Correct/wrong slot feedback
- Score, combo, timer and accuracy
- Hint penalty system
- Normal and Pro modes
- Completion rank S/A/B/C
- Confetti + sound feedback
- Reset / replay
