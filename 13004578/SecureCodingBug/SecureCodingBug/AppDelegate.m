//
//  AppDelegate.m
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import "AppDelegate.h"
#import "TestObject.h"
#import "XPCProtocol.h"
#import "ModelObject.h"

@implementation AppDelegate {
	NSXPCConnection *_connection;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	_connection = [[NSXPCConnection alloc] initWithServiceName:@"com.indragie.SecureCodingXPCService"];
	NSXPCInterface *exported = [NSXPCInterface interfaceWithProtocol:@protocol(HostProtocol)];
	NSXPCInterface *remote = [NSXPCInterface interfaceWithProtocol:@protocol(XPCProtocol)];
#ifdef USE_WHITELISTING
	NSSet *classes = [NSSet setWithObjects:[ModelObject class], [TestObject class], nil];
	[exported setClasses:classes forSelector:@selector(receiveTestObject:) argumentIndex:0 ofReply:NO];
	[remote setClasses:classes forSelector:@selector(sendTestObject:) argumentIndex:0 ofReply:NO];
#endif
	_connection.exportedInterface = exported;
	_connection.exportedObject = self;
	_connection.remoteObjectInterface = remote;
	[_connection resume];
	/* Immediately after this message is sent, this exception is thrown inside the XPC service (logged in Console):
	 
	 2013-01-13 11:38:18.103 AM com.indragie.SecureCodingXPCService[4086]: Warning: Exception caught during decoding of received message, dropping incoming message.
	 Exception: Exception while decoding argument 2 of invocation:
	 <NSInvocation: 0x7fdf64902370>
	 return value: {v} void
	 target: {@} 0x0
	 selector: {:} sendTestObject:
	 argument 2: {@} 0x0
	 
	 Exception: value for key 'NS.objects' was of unexpected class 'ModelObject'. Allowed classes are '{(
	 NSArray
	 )}'. 
	 
	 If #define USE_WHITELISTING is set in Defines.h, setClasses:forSelector:argumentIndex:ofReply: will be called
	 on the remote and exported object interfaces to whitelist the ModelObject and TestObject classes. This has no 
	 effect and the same exception is received.
	 
	 If #define USE_ARCHIVING is set in Defines.h, ModelObject uses NSKeyedArchiver/Unarchiver to archive and unarchive the
	 object to and from NSData before encoding/decoding with NSSecureCoder. This solves the issue and -receiveTestObject
	 is called with a valid object.
	 */
	[_connection.remoteObjectProxy sendTestObject:[TestObject new]];
}

#pragma mark - HostProtocol

- (void)receiveTestObject:(TestObject *)object
{
	// This is called immediately by the XPC service after the -sendTestObject: message is sent
	// This is never called because an exception is thrown as soon as -sendTestObject: is sent to the XPC service
	NSLog(@"%@", object);
}

@end
