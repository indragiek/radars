**Problem Report Title:** NSSecureCoding with container classes throws exceptions

**Product:** Mac OS X

**Version/Build Number:** 10.8.2

**Classification:** Serious Bug

**Reproducible:** Always

**Summary:**

Using NSSecureCoding to encode and decode a container object (NSArray, NSSet, NSDictionary) from within the NSCoding implementation of an NSSecureCoding-conforming class results in exceptions being thrown when attempting to send an instance of that class between a host application and an XPC service. The container classes contain custom NSSecureCoding-conforming model objects.

**Steps to Reproduce:**

1. Create a simple model object with a couple properties and make it conform to NSSecureCoding (called "ModelObject" in the example project)
2. Create a another model object with properties for NSArray, NSSet, NSDictionary. Set these properties to instances of those container classes containing a few instances of the "ModelObject" class created earlier and make it conform to NSSecureCoding (called "TestObject" in the example project)
3. Create an XPC service
4. Attempt to send a TestObject via an NSXPCConnection to the XPC service

**Expected Results:**

TestObject is sent to the XPC service.

**Actual Results:**

An exception is thrown when the XPC service attempts to decode the TestObject and is logged in console.

**Regression:**

**Notes:**

See included example project.

Note the comments in AppDelegate.m and Defines.h. There are defines to make the XPC interfaces use container whitelisting (although it shouldn't be necessary) and another define to use NSKeyedArchiver to archive container classes into NSData before attempting to encode and decode using NSCoder. This is the only functional workaround I found to this issue. 