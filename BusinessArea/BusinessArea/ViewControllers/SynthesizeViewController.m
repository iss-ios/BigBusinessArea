//
//  SynthesizeViewController.m
//  BusinessArea
//
//  Created by Destiny on 14-4-6.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "SynthesizeViewController.h"
#import "DecorationViewController.h"

@interface SynthesizeViewController ()

@end

@implementation SynthesizeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    AppDelegate *_AppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.navigationController.view removeGestureRecognizer:_AppDelegate.swRevealController.panGestureRecognizer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    AppDelegate *_AppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.navigationController.view addGestureRecognizer:_AppDelegate.swRevealController.panGestureRecognizer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //手势
    recognizer_left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer_left setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    recognizer_right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer_right setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [self.view addGestureRecognizer:recognizer_left];
    [self.view addGestureRecognizer:recognizer_right];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeButtonListView
{
    for (int i = 0; i < 23; i++)
    {
        
    }
}

#pragma mark - 手势控制
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft)
    {
        DecorationViewController *next = [[DecorationViewController alloc] init];
        [self.navigationController pushViewController:next animated:YES];
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
