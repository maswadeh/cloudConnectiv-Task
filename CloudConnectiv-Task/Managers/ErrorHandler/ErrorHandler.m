//
//  ErrorHandler.m
//  StrategyInsight
//
//  Created by Rami Arafat on 10/18/15.
//  Copyright © 2015 StartAppz. All rights reserved.
//

#import "ErrorHandler.h"
#import "NSObject+DataExtractor.h"

@implementation ErrorHandler

+(instancetype)sharedHandler
{
    
    static ErrorHandler *_sharedHandler = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedHandler = [[ErrorHandler alloc] init];
        
    });
    
    return _sharedHandler;
}



-(NSError *)handleHTTPResponsewithCustomError:(Errors *)customError domain:(NSString *)domain {

    if (customError == nil)
        return nil;
    
    NSInteger errorCode = customError.errorCode;
    NSString *message = customError.errorDescription;
    
    NSError *error = [[NSError alloc] initWithDomain:domain
                                                code:errorCode
                                            userInfo:@{NSLocalizedDescriptionKey : message}];
    
    
    NSLog(@"error message %@",message);
    return error;
}

-(NSError *)handleHTTPResponseWithError:(NSError *)error domain:(NSString *)domain
{

    NSLog(@"https Error  : %@",error);
return error;
    
}


@end
