//
//  main.m
//  SecureCodingXPCService
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#include <Foundation/Foundation.h>
#import "Listener.h"

int main(int argc, const char *argv[])
{
	Listener *client = [Listener new];
	NSXPCListener *lister = [NSXPCListener serviceListener];
	lister.delegate = client;
	[lister resume];
	exit(EXIT_FAILURE);
}
