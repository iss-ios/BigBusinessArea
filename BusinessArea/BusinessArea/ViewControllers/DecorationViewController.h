//
//  DecorationViewController.h
//  BusinessArea
//
//  Created by Destiny on 14-4-5.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DecorationViewController : UIViewController
{
    NSMutableArray *buttonList;
    IBOutlet UIView *title_view;
    IBOutlet UIButton *ad_button;
    IBOutlet UIScrollView *decorationScrollView;
    
    UISwipeGestureRecognizer *recognizer_right;
}

@end
