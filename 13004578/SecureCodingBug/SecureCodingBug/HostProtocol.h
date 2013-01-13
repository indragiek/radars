//
//  HostProtocol.h
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestObject;
@protocol HostProtocol <NSObject>
- (void)receiveTestObject:(TestObject *)object;
@end
