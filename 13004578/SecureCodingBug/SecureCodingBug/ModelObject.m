//
//  ModelObject.m
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import "ModelObject.h"

@implementation ModelObject
- (id)init
{
	if ((self = [super init])) {
		self.text = @"this is some text";
	}
	return self;
}

#pragma mark - NSSecureCoding

+ (BOOL)supportsSecureCoding
{
	return YES;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super init])) {
		self.text = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"text"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:self.text forKey:@"text"];
}
@end
