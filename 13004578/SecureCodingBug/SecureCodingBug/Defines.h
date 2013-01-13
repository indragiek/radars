//
//  Defines.h
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import <Foundation/Foundation.h>

// Uncomment this line to use NSXPCInterface's whitelisting methods to whitelist
// the "ModelObject" class. This shouldn't even be necessary according to the docs
// since none of the parameters in the methods of the XPC and host protocols are container
// classes, but trying anyways.

// #define USE_WHITELISTING

// Uncomment this line to use NSKeyedArchiver and NSKeyedUnarchiver to archive and unarchive
// the container objects (NSArray, NSSet, NSDictionary) in TestObject before encoding and
// decoding them with NSCoder. This is the only workaround I found to this bug.

// #define USE_ARCHIVING