//
//  TestObject.h
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject <NSSecureCoding>
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) NSSet *set;
@property (nonatomic, strong) NSDictionary *dictionary;
@end
