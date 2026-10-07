BUILD//LAB — INLINE ASPX EDITION

This edition was made specifically for the requirement that most of the
design/code lives INSIDE each .aspx file.

WHAT CHANGED
- BuildLab.css is now embedded in a <style> block inside every ASPX page.
- BuildLab.js is embedded at the bottom of every ASPX page.
- Test 10 also contains the complete drag-and-drop game engine inline.
- HTML was expanded/beautified so each page is easy to read in Visual Studio.
- No BuildLab.css, BuildLab.js, or BuildGame.js is required.
- Font rules explicitly disable italic/synthetic slant rendering.

INSTALL
1. Back up your Visual Studio project.
2. Replace Test 1.aspx through Test 10.aspx with these files.
3. Replace/copy the matching .aspx.cs and .designer.cs files when needed.
4. Keep your existing images in the project.
5. Build > Rebuild Solution.
6. Start from Test 1.aspx.

PAGE FLOW
Test 1 -> Test 2 -> Test 3_a -> Test 3 -> Test 4 -> Test 5 ->
Test 6 -> Test 7 -> Test 8 -> Test 9 -> Test 10

NOTE
The repeated CSS/JS makes these ASPX files intentionally large. That is
less maintainable in a production website, but it matches a coursework/
demonstration requirement where the design should visibly live in ASPX.
