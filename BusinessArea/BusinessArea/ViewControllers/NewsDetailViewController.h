//
//  NewsDetailViewController.h
//  BusinessArea
//
//  Created by Destiny on 14-4-5.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController
{
    IBOutlet UIWebView *mWebView;
    IBOutlet UIView *title_view;
    IBOutlet UILabel *title_label;
}

@property (nonatomic, copy) NSString *news_title;

@end
