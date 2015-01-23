**Product:** iOS SDK  
**Classification:** UI/Usability  
**Reproducibility:** Always  
**Title:** Self sizing table view cells jump when scrolling up  

**Description:**  
When using the new self-sizing table view cells in iOS 8 with cells that have dynamic heights, scrolling upwards after making mutations to the table view results in an odd "jumping" behaviour where the cell heights change in the middle of a scroll.

The attached video demonstrates this behavior, at around 0:16.

**Steps to Reproduce:**  

1. Open the attached example project
2. Run the application and scroll to the bottom
3. Press the + button 3 or more times to insert additional content and reload the table view
4. Scroll down to the bottom -- note that everything works fine when scrolling downwards
5. Scroll up slowly, note that it will start jittering as you scroll upwards, specifically towards the very top of the table view (shown in the video)

**Expected Results:**  
Cells jump as their heights are changed when scrolling up.

**Actual Results:**  
Cell heights stay consistent (as their computed heights are already known) and scrolling up is smooth.

**Configuration:**  
iPhone 6 64GB & iOS Simulator (iPhone 6 / iOS 8.1 (12B411))

**Version & Build:**  
Device: iOS 8.1.2 (12B440), Simulator: iOS 8.1 (12B411)