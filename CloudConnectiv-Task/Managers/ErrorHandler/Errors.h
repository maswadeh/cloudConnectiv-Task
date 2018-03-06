//
//  Error.h
//
//  Created by Mohammad Maswadeh on 2/8/17.
//  Copyright © 2017 Blessed Tree IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObject.h"

@interface Errors : BaseObject

@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSString* errorDescription;

@end
