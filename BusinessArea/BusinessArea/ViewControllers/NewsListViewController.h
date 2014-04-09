//
//  NewsListViewController.h
//  BusinessArea
//
//  Created by Destiny on 14-4-9.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListViewController : UIViewController
{
    IBOutlet UIView *title_view;
    IBOutlet UIView *button_view;
    IBOutlet UILabel *title_label;
    IBOutlet UIScrollView *news_scrollview;
}

@property (nonatomic, copy) NSString *news_title;

@end
