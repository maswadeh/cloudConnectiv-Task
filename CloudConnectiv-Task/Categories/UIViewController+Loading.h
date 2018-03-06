//
//  UIViewController+Loading.h
//  National-Wallet
//
//  Created by Mohammad Maswadeh on 12/17/17.
//  Copyright © 2017 BTIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController (Loading)

-(MBProgressHUD *)createProgressHUD;

-(void)displayErrorMessage:(NSString *)errorMessage;
-(void)displaySuccessMessage:(NSString *)successMessage;
-(void)displayNotificationMessage:(NSString *) message image:(UIImage *)image;
-(void)showActivityIndicator;
-(void)hideActivityIndicator;

@end
