## SwiftUI List in SidebarListStyle only renders 1 item when data comes from a StateObject
### FB7833192

When using SwiftUI List with the SidebarListStyle, where the data for the list is bound to a StateObject that loads the data asynchronously, the List only renders the first item regardless of how many elements are in the list. By either using the default list style, or getting the data from a constant array instead of the StateObject, the full list of items renders successfully.

Please see the attached Xcode project for a minimal repro.
