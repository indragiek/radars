//
//  TestObject.m
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import "TestObject.h"
#import "ModelObject.h"
#import "Defines.h"

@implementation TestObject
- (id)init
{
	if ((self = [super init])) {
		// Fill each container with ModelObject's
		self.array = @[[ModelObject new], [ModelObject new], [ModelObject new]];
		self.set = [NSSet setWithObjects:[ModelObject new], [ModelObject new], [ModelObject new], nil];
		self.dictionary = @{@"1": [ModelObject new], @"2" : [ModelObject new], @"3" : [ModelObject new]};
	}
	return self;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super init])) {
		// All of these classes conform to NSSecureCoding, so there should be no problem
		// encoding and decoding to them (and it isn't documented otherwise)
#ifdef USE_ARCHIVING
		NSData *arrayData = [aDecoder decodeObjectOfClass:[NSData class] forKey:@"array"];;
		if (arrayData) self.array = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
		NSData *setData = [aDecoder decodeObjectOfClass:[NSData class] forKey:@"set"];
		if (setData) self.set = [NSKeyedUnarchiver unarchiveObjectWithData:setData];
		NSData *dictData = [aDecoder decodeObjectOfClass:[NSData class] forKey:@"dictionary"];
		if (dictData) self.dictionary = [NSKeyedUnarchiver unarchiveObjectWithData:dictData];
#else
		self.array = [aDecoder decodeObjectOfClass:[NSArray class] forKey:@"array"];
		self.set = [aDecoder decodeObjectOfClass:[NSSet class] forKey:@"set"];
		self.dictionary = [aDecoder decodeObjectOfClass:[NSDictionary class] forKey:@"dictionary"];
#endif
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
#ifdef USE_ARCHIVING
	if (self.array)
		[aCoder encodeObject:[NSKeyedArchiver archivedDataWithRootObject:self.array] forKey:@"array"];
	if (self.set)
		[aCoder encodeObject:[NSKeyedArchiver archivedDataWithRootObject:self.set] forKey:@"set"];
	if (self.dictionary)
		[aCoder encodeObject:[NSKeyedArchiver archivedDataWithRootObject:self.dictionary] forKey:@"dictionary"];
#else
	[aCoder encodeObject:self.array forKey:@"array"];
	[aCoder encodeObject:self.set forKey:@"set"];
	[aCoder encodeObject:self.dictionary forKey:@"dictionary"];
#endif
}

+ (BOOL)supportsSecureCoding
{
	return YES;
}
@end
