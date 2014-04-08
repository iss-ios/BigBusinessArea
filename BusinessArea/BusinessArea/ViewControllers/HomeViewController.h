//
//  HomeViewController.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
{
    IBOutlet UIView *headerView;
    IBOutlet UIImageView *headerIcon;
    IBOutlet UIScrollView *headerScrollView;
    
    IBOutlet UIView *firstView;
    IBOutlet UIView *secondView;
    
    NSMutableArray *listData;
    NSMutableArray *adListData;
    IBOutlet UITableView *mTableView;
    
    IBOutlet UIButton *leftButton;
}
@end
