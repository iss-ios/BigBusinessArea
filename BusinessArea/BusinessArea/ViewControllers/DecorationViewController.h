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
    IBOutlet UIView *title_view;
    IBOutlet UIScrollView *decorationScrollView;
    
    UISwipeGestureRecognizer *recognizer_right;
}

@end
