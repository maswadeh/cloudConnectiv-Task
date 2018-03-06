//
//  NSObject+DataExtractor.m
//
//  Copyright (c) 2015. All rights reserved.
//

#import "NSObject+DataExtractor.h"

@implementation NSObject (DataExtractor)


#pragma mark - Data Extraction

-(NSInteger)extractIntegerValue:(NSString *)value{
    
    NSInteger integerValue = 0;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        integerValue = [value integerValue];
    }
    
    return integerValue;
    
}
-(NSUInteger)extractLongIntegerValue:(NSString *)value{
    
    NSUInteger integerValue = 0;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        integerValue = [value integerValue];
    }
    
    return integerValue;
    
}


-(BOOL)extractBooleanValue:(id)value{
    
    BOOL boolValue = NO;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        boolValue = [value boolValue];
    }
    
    return boolValue;
    
}


-(double)extractDoubleValue:(NSString *)value{
    
    double doubleValue = 0.0;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        doubleValue = [value doubleValue];
    }
    
    return doubleValue;
    
}

-(NSString *)extractCardDateValue:(id)value {
   
    NSString *formattedDate = @"";
    NSDate *time = nil;

    if (value != nil && ![value isEqual:[NSNull null]]) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS";
        time = [dateFormatter dateFromString:value];
    
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/yy"];
        formattedDate = [dateFormat stringFromDate:time];
        
    }

    return formattedDate;

}

-(NSString *)extractTransactionDateValue:(id)value {
    
    NSString *formattedDate = @"";
    NSDate *time = nil;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS";
        time = [dateFormatter dateFromString:value];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MMM. dd, yyyy HH:mm a"];
        formattedDate = [dateFormat stringFromDate:time];
        
    }
    
    return formattedDate;

}


-(NSDate *)extractDateValue:(NSString *)value{

    NSDate *date = nil;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale currentLocale];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
        
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'hh:mm:ss";
            
        date = [dateFormatter dateFromString:value];
    }
    
    return date;
}

-(NSDate *)extractTimeValue:(NSString *)value{
    
    NSDate *time = nil;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale currentLocale];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
        
        dateFormatter.dateFormat = @"HH:mm:ss";
        
        
        time = [dateFormatter dateFromString:value];
    }
    
    return time;
}

-(NSString *)extractStringValue:(id)value{
    
    NSString *string = @"";
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        string = value;
    }
    
    return string;
}

-(NSData *)extractUrlValue:(NSString*)value{
    
    
    NSData * image=nil;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        
        NSURL * url =[NSURL URLWithString:value];
        image =[[NSData alloc] initWithContentsOfURL:url];
        
        
    }
    return image;
}

-(NSNumber *)extractDedecimalnumber : (NSNumber*)value{
    
    NSNumber *number=nil;
    if (value != nil && ![value isEqual:[NSNull null]]) {
        number = value;
    }
    
    return number;
}
-(NSNumber *)extractBoolNumber:(NSNumber *)value{
NSNumber *number=nil;
    if (value != nil && ![value isEqual:[NSNull null]]) {
        number = [NSNumber numberWithBool:[value boolValue]];
    }
    return number;

}
-(BOOL)extractBooleanValueAudio:(id)value{
    
    BOOL boolValue = false;
    
    if (value != nil && ![value isEqual:[NSNull null]]) {
        boolValue = [value boolValue];
    }
    
    return boolValue;
    
}


@end
