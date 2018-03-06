//
//  UIView+RoundedCorners.h
//
//  Created by Rami Arafat on 10/26/15.
//  Copyright © 2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RoundedCorners)

-(void)addRoundedCornersWithRadius:(CGFloat)radius;
-(void)addBordersWithWidth:(CGFloat)width;
-(void)addRoundedCorners;
-(void)makeCircular;
-(void)addDefaultShadow;
-(void)addDropShadow:(UIColor *)color
           withOffset:(CGSize)offset
               radius:(CGFloat)radius
              opacity:(CGFloat)opacity;

-(NSString *)getDeviceLanguage;
-(void)checkOrientation;

@end
