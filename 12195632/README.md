Problem Title: MPMusicPlayerController +applicationMusicPlayer should support backgrounding

28-Aug-2012 11:35 PM Indragie Karunaratne:

**Summary:**

The only way to get MPMusicPlayerController to support background audio is to use +iPodMusicPlayer. This is often undesirable because doing this kills my application when the user closes it, instead of letting it run in the background. AVPlayer now supports playing MPMediaItem's via asset URLs, but it still doesn't support downloading and playing iTunes Match content (which MPMusicPlayerController does), so it's not a complete replacement.

**Steps to Reproduce:**

**Expected Results:**

**Actual Results:**

**Regression:**

**Notes:**