//
//  AppDelegate.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "RootNavigationController.h"
#import "CustomWindow.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,SWRevealViewControllerDelegate>
{
    BOOL showToolBar;
    NSMutableArray *items;
    UIView *customToolBar;
}
@property (strong, nonatomic) CustomWindow *window;
@property (strong, nonatomic) UINavigationController *appNavigation;
@property (strong, nonatomic) SWRevealViewController *swRevealController;

@end
