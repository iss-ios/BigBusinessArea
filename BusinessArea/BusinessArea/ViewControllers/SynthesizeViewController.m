//
//  SynthesizeViewController.m
//  BusinessArea
//
//  Created by Destiny on 14-4-6.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "SynthesizeViewController.h"
#import "DecorationViewController.h"
#import "NewsDetailViewController.h"

@interface SynthesizeViewController ()

@end

@implementation SynthesizeViewController

-(IBAction)rightButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

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
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_image.png"]]];
    [title_view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_image.png"]]];
    
    [self initializeButtonListView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeButtonListView
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Synthesize" ofType:@"plist"];
    NSMutableArray *buttonList = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    int x = 0;
    int y = 0;
    
    for (int i = 0; i < [buttonList count]; i++)
    {
        if (i % 4 == 0 && i != 0)
        {
            x = 0;
            y++;
        }
        
        NSString *key = [[[buttonList objectAtIndex:i] allKeys] objectAtIndex:0];
        NSString *value = [[buttonList objectAtIndex:i] valueForKey:key];
        UIButton *button = [[UIButton alloc] init];
        
        [synthesizeScrollView addSubview:button];
        
        [button setTag:i];
        [button setTitle:key forState:UIControlStateNormal];
        [button setFrame:CGRectMake(x * 80, y * 100, 80, 100)];
        [button setImage:[UIImage imageNamed:value] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 25, 5)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(80, -button.imageView.image.size.width, 0, 0)];
        [button.titleLabel setFont:[UIFont systemFontOfSize: 13.0]];
        [button addTarget:self action:@selector(showNewsDetailPage:) forControlEvents:UIControlEventTouchUpInside];
        
        x++;
    }
    
    [synthesizeScrollView setContentSize:CGSizeMake(Screen_Width, (y + 1)* 100)];
    [synthesizeScrollView setFrame:CGRectMake(0, title_view.frame.size.height, Screen_Width, Screen_Height - title_view.frame.size.height)];
}

-(void)showNewsDetailPage:(UIButton *)button
{
    NSLog(@"button tag : %d", button.tag);
    NewsDetailViewController *next = [[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
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
