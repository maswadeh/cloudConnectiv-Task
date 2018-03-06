//
//  ErrorHandler.h
//  StrategyInsight
//
//  Created by Rami Arafat on 10/18/15.
//  Copyright © 2015 StartAppz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Errors.h"


@interface ErrorHandler : NSObject

+(instancetype)sharedHandler;

-(NSError *)handleHTTPResponsewithCustomError:(Errors *)customError domain:(NSString *)domain;
-(NSError *)handleHTTPResponseWithError:(NSError *)error domain:(NSString *)domain;

@end
