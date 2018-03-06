//
//  NSObject+DataExtractor.h
//
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DataExtractor)

-(NSInteger)extractIntegerValue:(NSString *)value;
-(BOOL)extractBooleanValue:(id)value;
-(double)extractDoubleValue:(NSString *)value;
-(NSDate *)extractDateValue:(NSString *)value;
-(NSString *)extractStringValue:(id)value;
-(NSDate *)extractTimeValue:(NSString *)value;

-(NSData *)extractUrlValue:(NSString*)value;
-(NSNumber *)extractDedecimalnumber:(NSNumber*)value;
-(BOOL)extractBooleanValueAudio:(id)value;
-(NSNumber *)extractBoolNumber:(NSNumber *)value;
-(NSUInteger)extractLongIntegerValue:(NSString *)value;
-(NSString *)extractCardDateValue:(id)value;
-(NSString *)extractTransactionDateValue:(id)value;

@end
