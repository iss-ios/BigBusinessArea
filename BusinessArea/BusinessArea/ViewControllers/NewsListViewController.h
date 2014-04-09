//
//  NewsListViewController.h
//  BusinessArea
//
//  Created by Destiny on 14-4-9.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomRadioButton.h"

@interface NewsListViewController : UIViewController <CustomRadioButtonDelegate>
{
    IBOutlet UIView *title_view;
    IBOutlet UILabel *title_label;
    IBOutlet UIScrollView *news_scrollview;
    IBOutlet CustomRadioButton *radio_button;
}

@property (nonatomic, copy) NSString *news_title;

@end
