//
//  HomeViewController.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "AdDetailViewController.h"
#import "NewsDetailViewController.h"
#import "SynthesizeViewController.h"
#import "DecorationViewController.h"
#import "SWRevealViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(IBAction)leftButtonPressed:(id)sender
{
    [self.revealViewController revealToggle:self];
}

-(IBAction)rightButtonPressed:(id)sender
{
    SynthesizeViewController *next = [[SynthesizeViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
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
    
    [Common setViewCornerRadius:firstView where:UIRectCornerAllCorners];
    [Common setViewCornerRadius:secondView where:UIRectCornerTopLeft|UIRectCornerTopRight];
    
    listData = [[NSMutableArray alloc] initWithCapacity:0];
    adListData = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 10; i++)
    {
        [listData addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    if (IOS7) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    [mTableView setTableHeaderView:headerView];
    [mTableView setFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - 10)];
    
    for (int i = 0; i < 5; i ++)
    {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
        [button setTag:i];
        [button addTarget:self action:@selector(adButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [headerScrollView addSubview:button];
        [button setFrame:CGRectMake(i * 290, 0, 290, 130)];
    }
    
    [headerScrollView setFrame:CGRectMake(5, 5, 290, 130)];
    [headerScrollView setContentSize:CGSizeMake(290 * 5, 130)];
}

-(void)adButtonPressed:(UIButton *)button
{
    AdDetailViewController *next = [[AdDetailViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = (HomeTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.contentView.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *HomeTableViewCellIdentifier = @"HomeTableViewCellIdentifier";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeTableViewCellIdentifier];
    
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil] lastObject];
    }
    
    [cell.cell_label setText:@"测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试 测试"];
    
    if (indexPath.row == [listData count] - 1)
    {
        [Common setViewCornerRadius:cell.cell_background_view where:UIRectCornerBottomLeft|UIRectCornerBottomRight];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *next = [[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

-(IBAction)newsDetailButtonPressed:(id)sender
{
    NewsDetailViewController *next = [[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

@end
