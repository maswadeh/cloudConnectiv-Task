//
//  BaseResponse.h
//
//  Created by Mohammad Maswadeh on 2/8/17.
//  Copyright © 2017 Blessed Tree IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObject.h"

@interface BaseResponse : BaseObject

@property (nonatomic, assign) NSArray* errors;
@property (nonatomic, assign) BOOL isSuccessful;
@property (nonatomic, strong) NSString* token;

@end
