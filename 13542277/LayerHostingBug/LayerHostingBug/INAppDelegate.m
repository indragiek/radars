//
//  INAppDelegate.m
//  LayerHostingBug
//
//  Created by Indragie Karunaratne on 2013-03-30.
//  Copyright (c) 2013 indragie. All rights reserved.
//

#import "INAppDelegate.h"

@implementation INAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// This is the workaround I found for the issue:
	// Triggering the setter for subviews seems to reorder them in the correct order
	// [self.window.contentView setSubviews:[[self.window.contentView subviews] copy]];
}

@end
