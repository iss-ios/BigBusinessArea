//
//  UIViewController+CustomNavigationBar.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "UIViewController+CustomNavigationBar.h"

#define Navigation_Bar_Tag  300

#define Status_Bar_Tag  400

#define Navigation_Bar_Height ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0? 64.0:44.0)

#define Status_Bar_Color    @"Status_Bar_Color"

#define iOS_System_Version [[UIDevice currentDevice].systemVersion floatValue] //当前系统版本号

@implementation UIViewController (CustomNavigationBar)
//@synthesize  navigationBar;

-(void)showNavigationBarWithTitle:(NSString *)title leftButton:(UIButton *)leftButton rightButton:(UIButton *)rightButton
{
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    CustomNavigationBar *navBar = [[CustomNavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, Navigation_Bar_Height) title:title leftButton:leftButton rightButton:rightButton];
    navBar.tag = Navigation_Bar_Tag;
    
    [self.view addSubview:navBar];
}
- (CustomNavigationBar *)navigationBar
{
    CustomNavigationBar *navBar = (CustomNavigationBar *)[self.view viewWithTag:Navigation_Bar_Tag];
    if (navBar == nil) {
        navBar = [[CustomNavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, Navigation_Bar_Height) title:nil leftButton:nil rightButton:nil];
    }
    return navBar;
}
- (void)setStatusBarColor:(UIColor *)color
{
    if (color != nil && iOS_System_Version >=7.0) {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setValue:color forKey:Status_Bar_Color];
//        [defaults synchronize];
        
        self.automaticallyAdjustsScrollViewInsets = YES;
        
        UIView *statusBar = [self.view viewWithTag:Status_Bar_Tag];
        if (statusBar == nil) {
            statusBar = [[UIView alloc] init];
            statusBar.frame = CGRectMake(0, 0, Screen_Width, 20);
            [self.view addSubview:statusBar];
        }
        statusBar.backgroundColor = color;
    }
    
}
@end
