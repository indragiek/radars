//
//  AppDelegate.h
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HostProtocol.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, HostProtocol>

@property (assign) IBOutlet NSWindow *window;

@end
