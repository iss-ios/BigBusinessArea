//
//  SynthesizeViewController.h
//  BusinessArea
//
//  Created by Destiny on 14-4-6.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SynthesizeViewController : UIViewController
{
    NSMutableArray *buttonList;
    IBOutlet UIView *title_view;
    IBOutlet UIScrollView *synthesizeScrollView;
    
    UISwipeGestureRecognizer *recognizer_left;
    UISwipeGestureRecognizer *recognizer_right;
}
@end
