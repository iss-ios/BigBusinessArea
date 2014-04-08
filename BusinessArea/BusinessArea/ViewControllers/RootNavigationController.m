//
//  RootNavigationController.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "RootNavigationController.h"
#import "RootToolBarItem.h"
#import "LoginViewController.h"

#define ToolBar_Height 49.0
#define ToolBarItemNorImage(i) [NSString stringWithFormat:@"tool_nor_%i.png",i]
#define ToolBarItemPreImage(i) [NSString stringWithFormat:@"tool_nor_%i.png",i]
#define ButtonSelectedImage   @"tool_selected_back.png"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

@synthesize toolBarItems;

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
    items = [[NSMutableArray alloc] init];
    self.toolbarHidden = NO;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (customToolBar == nil) {
        customToolBar = [[UIView alloc] init];
        customToolBar.frame = CGRectMake(0, Screen_Height-ToolBar_Height, Screen_Width, ToolBar_Height);
        customToolBar.backgroundColor = [UIColor blackColor];
        [self.view addSubview:customToolBar];
    }
    [self showCustomToolBar];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark show toolbar
- (void)showCustomToolBar
{
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
//            [self hideCustomToolBar];
//            self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, Screen_Height);
            //会员
            LoginViewController *login = [[LoginViewController alloc] init];
            [self pushViewController:login animated:YES];

        }
            
            break;
        case 4:
            //论坛
            break;
        
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
