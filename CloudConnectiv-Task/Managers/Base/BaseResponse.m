//
//  BaseResponse.m
//
//  Created by Mohammad Maswadeh on 2/8/17.
//  Copyright © 2017 Blessed Tree IT. All rights reserved.
//

#import "BaseResponse.h"
#import "Errors.h"

@implementation BaseResponse

-(instancetype)initWithAttributes:(NSDictionary *)attributes
{
    if (self = [super initWithAttributes:attributes]) {
        self.isSuccessful = [self extractBooleanValue:attributes[@"isSuccess"]];
        self.token = [self extractStringValue:attributes[@"Token"]];
        
        if (attributes[@"errors"] && attributes[@"errors"] != NSNull.null)
            self.errors = [self extractErrors:attributes[@"errors"]];
        
    }
    
    return self;
}




-(NSMutableArray *)extractErrors:(NSArray *)errorsDictsArray {
    NSMutableArray *arrErrors = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictError in errorsDictsArray) {
        
        Errors* error = [[Errors alloc] initWithAttributes:dictError];
        [arrErrors addObject:error];
    }
    
    return arrErrors;
}


@end
