//
//  UIViewController+CustomNavigationBar.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationBar.h"



@interface UIViewController (CustomNavigationBar)

- (void)showNavigationBarWithTitle:(NSString *)title leftButton:(UIButton *)leftButton rightButton:(UIButton *)rightButton;

- (CustomNavigationBar *)navigationBar;

- (void)setStatusBarColor:(UIColor *)color;

@end
