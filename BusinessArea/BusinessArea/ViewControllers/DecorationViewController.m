//
//  DecorationViewController.m
//  BusinessArea
//
//  Created by Destiny on 14-4-5.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "DecorationViewController.h"
#import "SynthesizeViewController.h"

@interface DecorationViewController ()

@end

@implementation DecorationViewController

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
    recognizer_right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer_right setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer_right];
}

//手势控制
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
