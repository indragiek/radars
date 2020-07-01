Problem Title: Core Data: _PFExternalReferenceData raises NSInvalidArgumentException

02-Jan-2012 08:21 PM Indragie Karunaratne:
'log.txt' was successfully uploaded

02-Jan-2012 08:21 PM Indragie Karunaratne:
**Summary:**

Accessing _PFExternalReferenceData from a background queue randomly results in an NSInvalidArgumentException being raised. 

**Steps to Reproduce:**

Access and use a binary data property of a managed object that has external storage enabled in a background GCD queue.

**Expected Results:**

No problems.

**Actual Results:**

NSInvalidArgumentException is raised and the app crashes.

**Regression:**

Can not replicate consistently. I'm not even positive of whether it's the dispatch queue that is causing the problem, it is difficult to test because this problem can hardly be replicated.

**Notes:**

Exception log is attached.

30-Mar-2012 11:33 AM Indragie Karunaratne:
Nothing at all is being modified, the attribute is simply being accessed and it causes this issue. 

28-Aug-2012 11:32 PM Indragie Karunaratne:
All I know is that it happens when an external data attribute is accessed on a background GCD queue. Nothing is happening except that I'm accessing the attribute (not changing or replacing it).

13-Jan-2013 12:14 PM Indragie Karunaratne:
This issue has been verified as resolved and can be closed.
