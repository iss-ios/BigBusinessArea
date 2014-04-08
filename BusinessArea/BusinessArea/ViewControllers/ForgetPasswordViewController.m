//
//  ForgetPasswordViewController.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController
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
    //背景图片加圆角
    contentView.layer.cornerRadius = 5.0;
    contentView.layer.masksToBounds = YES;
    
    [self showNavigationBarWithTitle:@"找回密码" leftButton:backButton rightButton:nil];
    [self navigationBar].barTintColor = [UIColor colorWithRed:0 green:108/255.0 blue:200/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark button click
- (IBAction)backButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)findButtonClicked:(id)sender
{
    
}
@end
