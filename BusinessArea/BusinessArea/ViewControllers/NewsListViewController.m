//
//  NewsListViewController.m
//  BusinessArea
//
//  Created by Destiny on 14-4-9.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "NewsListViewController.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

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
    
    [radio_button setDelegate:self];
    [radio_button setFrame:CGRectMake(0, title_view.frame.size.height, Screen_Width, radio_button.frame.size.height)];
    
    [news_scrollview setFrame:CGRectMake(0, radio_button.frame.size.height + radio_button.frame.origin.y, Screen_Width, Screen_Height - title_view.frame.size.height - radio_button.frame.size.height)];
    [news_scrollview setContentSize:CGSizeMake(Screen_Width * 4, news_scrollview.frame.size.height)];
    [news_scrollview setPagingEnabled:YES];
    [news_scrollview setBounces:NO];
    
    for (int i = 0; i < 5; i++)
    {
        UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test.png"]];
        [news_scrollview addSubview:imageview];
        [imageview setFrame:CGRectMake(Screen_Width * i, 0, Screen_Width, news_scrollview.frame.size.height)];
    }
    
    [title_view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"title_background.png"]]];
    
    [self loadNewsListData:@"1" childTypeID:@"0" beginNum:@"1" endNum:@"10"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [radio_button setRadioButtonStatus:scrollView.contentOffset.x / scrollView.frame.size.width];
}

-(void)customRadioButtonPressed:(int)index
{
    [news_scrollview setContentOffset:CGPointMake(index * news_scrollview.frame.size.width, 0) animated:NO];
}

#pragma mark - ASIFormDataRequest

-(void)loadNewsListData:(NSString *)typelistID childTypeID:(NSString *)childTypeID beginNum:(NSString *)beginNum endNum:(NSString *)endNum
{
    NSString *stringURL = [NSString stringWithFormat:
                           @"%@?typelistID=%@&childTypeID=%@&beginNum=%@&endNum=%@",
                           GetBusinessClassification, typelistID, childTypeID, beginNum, endNum];
    NSLog(@"stringURL : %@", stringURL);
    ASIFormDataRequest *mRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:stringURL]];
    [mRequest setDelegate:self];
    [mRequest setRequestMethod:@"POST"];
    [mRequest setTimeOutSeconds:10.0];
    [mRequest setNumberOfTimesToRetryOnTimeout:1];
    [mRequest startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"商业楼盘", @"住宅楼盘", @"楼盘团购", @"二手房源",  nil];
    [radio_button setButtonWithArray:array];
    [radio_button setRadioButtonStatus:0];
    
//    NSString *result = [request.responseString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    result = [result stringByReplacingOccurrencesOfString:@" " withString:@""];
//    result = [result stringByReplacingOccurrencesOfString:@"　" withString:@""];
//    result = [result stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSError *error;
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"resultDic : %@", resultDic);
    
//    if ([[result JSONValue] isKindOfClass:[NSDictionary class]])
//    {
//        NSDictionary *dic = [request.responseString JSONValue];
//        NSLog(@"dic : %@", dic);
//    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [[UIApplication sharedApplication].keyWindow makeToast:@"请检查网络" duration:2.0 position:@"bottom"];
}

@end
