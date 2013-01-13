//
//  ModelObject.h
//  SecureCodingBug
//
//  Created by Indragie Karunaratne on 2013-01-13.
//  Copyright (c) 2013 nonatomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelObject : NSObject <NSSecureCoding>
@property (nonatomic, copy) NSString *text;
@end
