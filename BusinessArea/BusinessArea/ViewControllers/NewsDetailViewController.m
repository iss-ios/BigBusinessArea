//
//  NewsDetailViewController.m
//  BusinessArea
//
//  Created by Destiny on 14-4-5.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

@synthesize news_title;

-(IBAction)leftButtonPressed:(id)sender
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [title_label setText:news_title];
    [title_view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"title_background.png"]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
