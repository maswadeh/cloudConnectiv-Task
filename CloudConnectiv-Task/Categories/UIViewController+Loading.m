//
//  UIViewController+Loading.m
//  National-Wallet
//
//  Created by Mohammad Maswadeh on 12/17/17.
//  Copyright © 2017 BTIT. All rights reserved.
//

#import "UIViewController+Loading.h"
#import <SVProgressHUD/SVProgressHUD.h>


@implementation UIViewController (Loading)

-(MBProgressHUD *)createProgressHUD
{
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    HUD.label.text= NSLocalizedString(@"Saving...", nil);
    
    return HUD;
    
}

-(void) displayErrorMessage:(NSString *)errorMessage
{
    if (errorMessage.length <= 0) {
        errorMessage = NSLocalizedString(@"An unhandled error has occurred. Please try again.", @"Generic error message");
    }
    
    [self customizeHUD];
    [SVProgressHUD showErrorWithStatus:errorMessage];
}


-(void)displaySuccessMessage:(NSString *)successMessage
{
    if (successMessage.length <= 0) {
        successMessage = NSLocalizedString(@"The operation has completed successfully", nil);
    }
    
    [self customizeHUD];
    [SVProgressHUD showSuccessWithStatus:successMessage];
}




-(void) displayNotificationMessage:(NSString *) message image:(UIImage *)image
{
    [self customizeHUD];
    [SVProgressHUD showImage:image status:message];
}




-(void)showActivityIndicator
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}



-(void)hideActivityIndicator
{
    // [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}




-(void)customizeHUD
{
    [SVProgressHUD setForegroundColor:[UIColor grayColor]];
    [SVProgressHUD setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}


@end
