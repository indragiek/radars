Problem Title: iTunes media library API for OS X

05-Nov-2011 05:27 PM Indragie Karunaratne:

**Summary:**

OS X is in severe lack of a proper API for accessing the contents of the iTunes Library. There are two current methods to access the library:

1) iTunes Library XML file
2) ScriptingBridge

The iTunes Library XML file is inadequate because it does not provide access to track artwork, and ScriptingBridge is slow and requires iTunes to be open to read database information. Both of these methods are also lacking in the area of importing files into iTunes from a 3rd party application. In short, OS X needs something like the MediaPlayer framework on iOS, a well designed framework for accessing the media library.

**Steps to Reproduce:**

Try to develop an application that reads information from the iTunes library and keeps in sync with the iTunes database changes.

**Expected Results:**

Simple, easy to do (like on iOS).

**Actual Results:**

It's hard and painful.

**Regression:**

None.

**Notes:**

\-

**Update - (2013.07.12):**

*Hint:* This will only work for iTunes 11 and later

Apple introduced a new framework called `iTunesLibrary.framework` with iTunes 11.
You can now easily get fast access to the iTunes Library in sandboxed applications.
You can also use this framework along with Scripting Bridge, simply use the identifier `persistentID`.

<a href="https://developer.apple.com/library/mac/#documentation/iTunesLibrary/Reference/iTunesLibraryFrameworkReference/_index.html">iTunesLibrary.framework Documentation</a>
