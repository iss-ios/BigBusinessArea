//
//  ModifyUserInfoViewController.m
//  BusinessArea
//
//  Created by iss on 14-4-10.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "ModifyUserInfoViewController.h"

@interface ModifyUserInfoViewController ()

@end

@implementation ModifyUserInfoViewController
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
    [self showNavigationBarWithTitle:@"个人基本信息" leftButton:backButton rightButton:nil];
    [self navigationBar].statusBarColor = [UIColor blackColor];
    [self navigationBar].navBarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:Nav_Bar_Back_Image]];
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

@end
