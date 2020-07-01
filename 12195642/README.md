Problem Title: MPMediaItem asset URL returns nil for iTunes Match cloud content

28-Aug-2012 11:39 PM Indragie Karunaratne:

**Summary:**

As the title says, the MPMediaItemPropertyAssetURL of MPMediaItem returns nil when the media item is an iTunes Match track that is on the cloud and hasn't been downloaded locally. While MPMusicPlayerController can play it, this is a problem for when I use AVPlayer because it relies on the asset URL to play the content. It would be great if you could retrieve valid asset URLs for iTunes match cloud content and use AVPlayer to play them just like MPMusicController does.

**Steps to Reproduce:**

**Expected Results:**

**Actual Results:**

**Regression:**

**Notes:**
