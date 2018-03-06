//
//  NetworkOperationManager.h
//
//  Created by Blessed Tree IT on 1/30/17.
//  Copyright © 2017 Blessed Tree IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPSessionManager.h"
#import "ErrorHandler.h"
#import "Errors.h"

@interface NetworkOperationManager : AFHTTPSessionManager

+(NetworkOperationManager*)sharedObject;

-(void)saveAuthenticationToken:(NSString *)authenticationToken;
-(NSString *)authenticationToken;
-(void)clearAuthenticationToken;


@end
