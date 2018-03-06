//
//  UIView+RoundedCorners.m
//
//  Created by Rami Arafat on 10/26/15.
//  Copyright © 2015. All rights reserved.
//

#import "UIView+RoundedCorners.h"

const CGSize DS_DEFAULT_OFFSET = {0, 2};
const CGFloat DS_DEFAULT_RADIUS = 1.0f;
const CGFloat DS_DEFAULT_OPACITY = 0.8f;

@implementation UIView (RoundedCorners)

-(void)addRoundedCorners
{
    [self addRoundedCornersWithRadius:5.0];
}

-(void)addRoundedCornersWithRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

-(void)checkOrientation {
    
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];
    NSArray * indexofDash = [language componentsSeparatedByString:@"-"];
    NSString *languageWithoutRegionCode =[indexofDash objectAtIndex:0];
    
    if([languageWithoutRegionCode isEqualToString:@"en"])
    {
    }
    else  if([languageWithoutRegionCode isEqualToString:@"ar"])
    {
        self.transform=CGAffineTransformMakeScale(-1,1);

    }
    

}

-(void)makeCircular
{
    [self addRoundedCornersWithRadius:self.bounds.size.width / 2];
}

- (void)addDropShadow:(UIColor *)color
           withOffset:(CGSize)offset
               radius:(CGFloat)radius
              opacity:(CGFloat)opacity
{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
}

-(void)addDefaultShadow {
    
    UIColor *shadowColor = [UIColor blackColor];
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = DS_DEFAULT_OFFSET;
    self.layer.shadowRadius = DS_DEFAULT_RADIUS;
    self.layer.shadowOpacity = DS_DEFAULT_OPACITY;
}

-(void)addBordersWithWidth:(CGFloat)radius {
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = radius;
    
}

-(NSString *)getDeviceLanguage {

    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];
    NSArray * indexofDash = [language componentsSeparatedByString:@"-"];
    NSString *languageWithoutRegionCode =[indexofDash objectAtIndex:0];
    NSString *languageName ;
    
    if([languageWithoutRegionCode isEqualToString:@"en"])
    {
        languageName=languageWithoutRegionCode;
    }
    else  if([languageWithoutRegionCode isEqualToString:@"ar"])
    {
        
        languageName=languageWithoutRegionCode;
    }
    
    return languageName;
    
}

@end
