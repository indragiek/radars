//
//  Listener.m
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import "Listener.h"
#import "XPCProtocol.h"
#import "HostProtocol.h"
#import "ModelObject.h"
#import "TestObject.h"
#import "Defines.h"

@implementation Listener {
	NSXPCConnection *_connection;
}
#pragma mark - NSXPCListenerDelegate

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection
{
	NSXPCInterface *exported = [NSXPCInterface interfaceWithProtocol:@protocol(XPCProtocol)];
	NSXPCInterface *remote = [NSXPCInterface interfaceWithProtocol:@protocol(HostProtocol)];
	newConnection.exportedInterface = exported;
	newConnection.exportedObject = self;
#ifdef USE_WHITELISTING
	NSSet *classes = [NSSet setWithObjects:[ModelObject class], [TestObject class], nil];
	[remote setClasses:classes forSelector:@selector(receiveTestObject:) argumentIndex:0 ofReply:NO];
	[exported setClasses:classes forSelector:@selector(sendTestObject:) argumentIndex:0 ofReply:NO];
#endif
	newConnection.remoteObjectInterface = remote;
	[newConnection resume];
	_connection = newConnection;
	return YES;
}

#pragma mark - XPCProtocol

- (void)sendTestObject:(TestObject *)object
{
	[_connection.remoteObjectProxy receiveTestObject:object];
}
@end
