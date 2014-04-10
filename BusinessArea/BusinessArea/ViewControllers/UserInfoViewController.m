//
//  UserInfoViewController.m
//  BusinessArea
//
//  Created by iss on 14-4-9.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "UserInfoViewController.h"
#import "MenuViewGenerator.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController
#pragma mark -
#pragma mark view
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showNavigationBarWithTitle:nil leftButton:nil rightButton:rightButton];
    [self navigationBar].statusBarColor = [UIColor blackColor];
    [self navigationBar].navBarView = navBarBackView;
   
    [self updateUserInfo:nil];
    
    //加载主界面
    MenuViewGenerator *generator = [[MenuViewGenerator alloc] initWithFrame:CGRectMake(0, 160, 320, 106*3)
                                                                     titles:[NSArray arrayWithObjects:@"发布信息",@"我的发布",@"我的订单",@"基本信息",@"修改密码",@"消息中心",@"意见反馈",@"检查更新",@"退出登录", nil]
                                                                     imageNames:[NSArray arrayWithObjects:@"user_sendinfo.png",@"user_my_publish.png",@"user_my_order.png",@"user_normalinfo.png",@"user_mofify_pw.png",@"user_message.png",@"user_help_feedback.png",@"user_update.png",@"user_exit.png", nil]
                                                                    activeController:self];
    [self.view addSubview:generator];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUserInfo:) name:Notification_Logined_Key object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUserInfo:) name:Notification_Logouted_Key object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark button click
- (IBAction)rightButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)updateUserInfo:(NSNotification *)notification
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL logined = [defaults boolForKey:Logined_Key];
    if (logined) {
        NSString *account = [defaults valueForKey:User_Account_Key];
        userNameLabel.text = account;
        userAccountLabel.text = [NSString stringWithFormat:@"我的账户:%@",account];
    }
    else{
        userNameLabel.text = @"游客";
        userAccountLabel.text = @"账号未登录";
    }
    
}
@end
