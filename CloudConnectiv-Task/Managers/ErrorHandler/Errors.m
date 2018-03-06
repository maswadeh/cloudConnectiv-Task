//
//  Error.m
//
//  Created by Mohammad Maswadeh on 2/8/17.
//  Copyright © 2017 Blessed Tree IT. All rights reserved.
//

#import "Errors.h"

@implementation Errors


-(instancetype)initWithAttributes:(NSDictionary *)attributes
{
    if (self = [super initWithAttributes:attributes]) {
        self.errorCode = [self extractIntegerValue:attributes[@"code"]];
        self.errorDescription = [self extractStringValue:attributes[@"description"]];
    }
    
    return self;
}



@end
