**Problem Report Title:** NSMenu -setMinimumWidth: does nothing

**Product:** Mac OS X 

**Version:** 10.8.2

**Classification:** Other Bug

**Reproducible:** Always

**Summary:**

NSMenu's -setMinimumWidth: method does nothing.

**Steps to Reproduce:**

1. Call -setMinimumWidth: on an NSMenu
2. Show the menu

**Expected Results:**

The menu size is greater than or equal to the specified width.

**Actual Results:**

Nothing happens. It uses the default menu width (width of the longest item). The only workaround is to pad the menu item titles with spaces to enlarge the menu.

**Regression:**

**Notes:**
