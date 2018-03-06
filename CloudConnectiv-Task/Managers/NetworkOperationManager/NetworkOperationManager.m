//
//  NetworkOperationManager.m
//
//  Created by Blessed Tree IT on 1/30/17.
//  Copyright © 2017 Blessed Tree IT. All rights reserved.
//

#import "NetworkOperationManager.h"
#import "Constants.h"
#import "BaseResponse.h"

#define AUTHENTICATION_KEY @"AuthenticationKey"

@interface NetworkOperationManager ()
{
   
}
@end

@implementation NetworkOperationManager

+ (NetworkOperationManager*)sharedObject {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
    }];
    static NetworkOperationManager* _sharedObject = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedObject = [[NetworkOperationManager alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]];
    });
    
  //Cookie: ASP.NET_SessionId=focpr0yjtmj3ob2ktuaq3fe3
    [_sharedObject.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [_sharedObject.requestSerializer setTimeoutInterval:120];
    _sharedObject.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD",@"DELETE", nil];
    
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.allowInvalidCertificates = YES;
    policy.validatesDomainName = NO;
    
    _sharedObject.securityPolicy = policy;
    
    
    return _sharedObject;
}


- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    
    if(!self)
        return nil;
    
    [self setResponseSerializer:[AFHTTPResponseSerializer serializer]];

    return self;
}


-(void)saveAuthenticationToken:(NSString *)authenticationToken
{
    if (authenticationToken.length > 0) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:authenticationToken
                     forKey:AUTHENTICATION_KEY];
    }
    
}


-(NSString *)authenticationToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *authenticationToken = [defaults objectForKey:AUTHENTICATION_KEY];
    
    return authenticationToken;
}



-(void)clearAuthenticationToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:AUTHENTICATION_KEY];
}




#pragma mark - HTTP Methods

-(NSURLSessionDataTask*)GET:(NSString *)URLString
                 parameters:(id)parameters
                   progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                    success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                    failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    
    return [super GET:URLString
           parameters:parameters
             progress:downloadProgress
              success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                  

                  [self processTask:task
                           response:responseObject
                            success:success
                            failure:failure];
              }
            
              failure:failure];
}


-(NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    
    
    return [super POST:URLString
            parameters:parameters
              progress:uploadProgress
               success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                   
                   [self processTask:task
                            response:responseObject
                             success:success
                             failure:failure];
               }
            
               failure:failure];
}



-(NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
    constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> _Nonnull))block
                     progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    
    return [super POST:URLString
            parameters:parameters
constructingBodyWithBlock:block
              progress:uploadProgress
               success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                   
                   [self processTask:task
                            response:responseObject
                             success:success
                             failure:failure];
               }
               failure:failure];
}



-(NSURLSessionDataTask *)DELETE:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                        failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    
    return [super DELETE:URLString
              parameters:parameters
                 success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                     
                     [self processTask:task
                              response:responseObject
                               success:success
                               failure:failure];
                     
                 }
                 failure:failure];
    
}


-(NSURLSessionDataTask *)PUT:(NSString *)URLString
                  parameters:(id)parameters
                     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    return [super PUT:URLString
           parameters:parameters
              success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                  
                  [self processTask:task
                           response:responseObject
                            success:success
                            failure:failure];
              }
            
              failure:failure];
}




-(void)processTask:(NSURLSessionDataTask * _Nonnull)task
          response:(id _Nullable)responseObject
           success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
           failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    
    NSDictionary *data=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
    BaseResponse* response = [[BaseResponse alloc] initWithAttributes:data];
    
    if (response.isSuccessful) {
    // Maintain Auth Token
    [[NetworkOperationManager sharedObject] saveAuthenticationToken:response.token];
    
    //Pass the response to the success block for processing
    if (success) {
        success(task, responseObject);
    }
    
    }
    else{
    
            //the response did not suceed. Call the failure block if possible
            if (failure) {
                NSError *error = [[ErrorHandler sharedHandler] handleHTTPResponsewithCustomError:[response.errors firstObject] domain:@"Generic"];
                failure(task, error);
            }
        }
}

@end
