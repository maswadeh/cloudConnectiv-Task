//
//  Icons.m
//  National-Wallet
//
//  Created by Mohammad Maswadeh on 1/20/18.
//  Copyright © 2018 BTIT. All rights reserved.
//

#import "UITextField+Icons.h"


@implementation UITextField (Icons)


-(void)addLeftIcon:(NSString *)iconName {
    
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
}
-(void)addRightIcon:(NSString *)iconName {
    
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
}
@end
