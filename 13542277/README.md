30-Mar-2013 02:15 PM Indragie Karunaratne:
Summary:

When using sibling overlapping NSViews where one of the sibling views is a layer hosting view and the other sibling is a layer backed view, the z-position of the views' layers at runtime (and hence the views themselves) is inconsistent.

Steps to Reproduce:

1. Create a layer hosting view and a layer backed view
2. In the XIB, put the layer hosting view in the background and place the layer backed view on top of it
3. Run the app

Expected Results:

The z-order of the two views is maintained consistently.

Actual Results:

About 1 in every 10-20 launches, the z-position will be wrong -- the layer hosting view will appear over the layer backed view. 

Regression:

Notes:

Sample code is attached. Run the application 10-20 times to see where the problem kicks in (it happens, I promise!). Also attached are screenshots on what it SHOULD look like (correct.png, where the blue rectangle is visible over the red background) and what happens when the z-position gets messed up (incorrect.png, where only the red background is visible). 

I found the following workaround: [self.window.contentView setSubviews:[[self.window.contentView subviews] copy]];. Triggering the setter for subviews seems to reset the proper z-positions. 

30-Mar-2013 02:15 PM Indragie Karunaratne:
'LayerHostingBug.zip' was successfully uploaded

30-Mar-2013 02:16 PM Indragie Karunaratne:
'correct.png' was successfully uploaded

30-Mar-2013 02:17 PM Indragie Karunaratne:
An error occurred during file upload.Please try uploading the file(s) again.If the problem persists, please email your file(s) and Bug ID # to <devbugs@apple.com> and we will append the bug report with the file(s) provided.

30-Mar-2013 02:18 PM Indragie Karunaratne:
'not-correct-1.png' was successfully uploaded