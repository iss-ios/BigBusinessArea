//
//  MenuViewGenerator.m
//  XiFangTong
//
//  Created by issuser on 13-7-30.
//  Copyright (c) 2013年 YouYan. All rights reserved.
//

#import "MenuViewGenerator.h"
#import "MenuButton.h"
#import "MyOrdersViewController.h"
#import "MyNoticesViewController.h"
#import "InfoCenterViewController.h"
#import "ModifyUserInfoViewController.h"
#import "ModifyPasswordViewController.h"
#import "FeedbackViewController.h"
#import "LoginViewController.h"


@implementation MenuViewGenerator


-(id)initWithFrame:(CGRect)frame titles:(NSArray *)titles imageNames:(NSArray *)images activeController:(UIViewController *)controller
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = frame;
        activeController_ = controller;
        for (int i = 0; i < titles.count; i++) {
            
            NSString *title = [titles objectAtIndex:i];

            CGFloat w = Screen_Width/3.0;
           
            MenuButton *menuView = [[MenuButton alloc] initWithFrame:CGRectMake(i%3*w, i/3*w, w,w) image:[images objectAtIndex:i] text:title];
            menuView.tag = i;
            
            [menuView setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"user_btn_bg.png"]] forState:UIControlStateNormal];
            
            [menuView setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"user_btn_bg.png"]] forState:UIControlStateHighlighted];
            
            [menuView addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

            [self addSubview:menuView];
            
            
        }
    }
    return self;
}
//主界面按钮点击事件
-(void)buttonClicked:(UIButton *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL logined = [defaults boolForKey:Logined_Key];
    if (!logined) {
        LoginViewController *login = [[LoginViewController alloc] init];
        [activeController_.navigationController pushViewController:login animated:YES];
        return;
    }
    int btag = [sender tag];
    switch (btag) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            MyNoticesViewController *myNotices = [[MyNoticesViewController alloc] init];
            [activeController_.navigationController pushViewController:myNotices animated:YES];

        }
            break;
        case 2:
        {
            MyOrdersViewController *myOrders = [[MyOrdersViewController alloc] init];
            [activeController_.navigationController pushViewController:myOrders animated:YES];
        }
            break;
        case 3:
        {
            ModifyUserInfoViewController *modifyUserInfo = [[ModifyUserInfoViewController alloc] init];
            [activeController_.navigationController pushViewController:modifyUserInfo animated:YES];
            
        }
            break;
        case 4:
        {
            ModifyPasswordViewController *modifyPassword = [[ModifyPasswordViewController alloc] init];
            [activeController_.navigationController pushViewController:modifyPassword animated:YES];
        }
            break;
        case 5:
        {
            InfoCenterViewController *infoCenter = [[InfoCenterViewController alloc] init];
            [activeController_.navigationController pushViewController:infoCenter animated:YES];
            
        }
            break;
        case 6:
        {
            FeedbackViewController *feedback = [[FeedbackViewController alloc] init];
            [activeController_.navigationController pushViewController:feedback animated:YES];
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否要退出当前登录账户" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",@"取消", nil];
            [alert show];
            
        }
            break;
            
        default:
            break;
    }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:NO forKey:Logined_Key];
        [defaults synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:Notification_Logouted_Key object:self userInfo:nil];
    }
}
@end
