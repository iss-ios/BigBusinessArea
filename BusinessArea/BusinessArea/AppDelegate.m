//
//  AppDelegate.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "HomeViewController.h"
#import "SynthesizeViewController.h"
#import "DecorationViewController.h"
#import "RootNavigationController.h"
#import "RootToolBarItem.h"
#import "LoginViewController.h"
#import "UserInfoViewController.h"

#define ToolBar_Height 49.0
#define ToolBarItemNorImage(i) [NSString stringWithFormat:@"tool_nor_%i.png",i]
#define ToolBarItemPreImage(i) [NSString stringWithFormat:@"tool_nor_%i.png",i]
#define ButtonSelectedImage   @"tool_selected_back.png"

@implementation AppDelegate

@synthesize appNavigation;
@synthesize swRevealController;

#pragma mark -
#pragma mark application

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[CustomWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /*
     *加载主界面，左、中、右结构
     */
    //菜单
    MenuViewController *menuController = [[MenuViewController alloc] init];
    //主页
    HomeViewController *homeController = [[HomeViewController alloc] init];
    
    swRevealController = [[SWRevealViewController alloc] init];
    [swRevealController setRearViewController:menuController];
    [swRevealController setFrontViewController:homeController];
    [swRevealController setDelegate:self];
    [swRevealController setBounceBackOnLeftOverdraw:NO];
    [swRevealController setStableDragOnLeftOverdraw:YES];
    [swRevealController setRearViewRevealOverdraw:0];
    [swRevealController setRearViewRevealWidth:Margin_Wight];
    [swRevealController setFrontViewPosition:FrontViewPositionLeft];
    [self showCustomToolBar];
    
    appNavigation = [[UINavigationController alloc] initWithRootViewController:swRevealController];
    [appNavigation setNavigationBarHidden:YES];
    [appNavigation.view addGestureRecognizer:swRevealController.panGestureRecognizer];
    
    [self.window setRootViewController:appNavigation];
    [application setStatusBarHidden:NO];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window.statusBarColor = [UIColor blackColor];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - SWRevealViewControllerDelegate

- (void)revealController:(SWRevealViewController *)revealController panGestureEndedToLocation:(CGFloat)location progress:(CGFloat)progress
{
    if (location == 0 && progress == 0)
    {
        SynthesizeViewController *synthesizeController = [[SynthesizeViewController alloc] init];
        [appNavigation pushViewController:synthesizeController animated:YES];
    }
}
#pragma mark -
#pragma mark
- (void)showCustomToolBar
{
    items = [[NSMutableArray alloc] init];
    if (customToolBar == nil) {
        customToolBar = [[UIView alloc] init];
        customToolBar.frame = CGRectMake(0, Screen_Height-ToolBar_Height, Screen_Width, ToolBar_Height);
        customToolBar.backgroundColor = [UIColor blackColor];
        [swRevealController.view addSubview:customToolBar];
    }
    
    NSArray *toolBarItems = [NSArray arrayWithObjects:@"主页",@"客服",@"分享",@"会员",@"论坛", nil];
    showToolBar = YES;
    customToolBar.frame = CGRectMake(0, Screen_Height-ToolBar_Height, Screen_Width, ToolBar_Height);
    
    //toolbar 背景图
    UIImageView *backImgView = [[UIImageView alloc] init];
    backImgView.frame = CGRectMake(0, 0, customToolBar.frame.size.width, customToolBar.frame.size.height);
    backImgView.image = [UIImage imageNamed:@"tab_bar_back.png"];
    [customToolBar addSubview:backImgView];
    
    //toolbar 按钮
    if (items.count != 0) {
        [items removeAllObjects];
    }
    CGFloat width = Screen_Width/toolBarItems.count;
    
    for (int i = 0; i<toolBarItems.count; i++) {
        
        NSString *buttonTitle = [toolBarItems objectAtIndex:i];
        
        RootToolBarItem *item = [[RootToolBarItem alloc] initWithFrame:CGRectMake(i*width, 0, width, ToolBar_Height) title:buttonTitle normalImage:[UIImage imageNamed:ToolBarItemNorImage(i)] pressedImage:[UIImage imageNamed:ToolBarItemPreImage(i)]];
        item.selectedImage = [UIImage imageNamed:ButtonSelectedImage];
        item.tag = i;
        [items addObject:item];
        [customToolBar addSubview:item];
        
        [item addTarget:self action:@selector(toolBarItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}
- (void)hideCustomToolBar
{
    showToolBar = NO;
    customToolBar.hidden = YES;
    customToolBar.frame = CGRectMake(0, Screen_Height+ToolBar_Height, Screen_Width, ToolBar_Height);
}
- (void)toolBarItemClicked:(UIButton *)sender
{
    for (RootToolBarItem *item in items) {
        if (item.tag == sender.tag) {
            item.selected = YES;
        }
        else{
            item.selected = NO;
        }
    }
    switch (sender.tag) {
        case 0:
            //主页
            break;
        case 1:
            //客服
            break;
        case 2:
            //分享
            break;
        case 3:
        {
             //会员
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            BOOL logined = [defaults boolForKey:Logined_Key];
            if (logined) {
                UserInfoViewController *userInfo = [[UserInfoViewController alloc] init];
                [swRevealController.navigationController pushViewController:userInfo animated:YES];
            }
            else{
                LoginViewController *login = [[LoginViewController alloc] init];
                [swRevealController.navigationController pushViewController:login animated:YES];
            }
        }
            
            break;
        case 4:
            //论坛
            break;
            
        default:
            break;
    }
}
@end
