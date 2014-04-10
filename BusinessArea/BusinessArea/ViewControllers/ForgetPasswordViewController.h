//
//  ForgetPasswordViewController.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPasswordViewController : UIViewController
{
    IBOutlet UIView *contentView;
    IBOutlet AdaptiveTextField *phoneTextField;
    IBOutlet UIButton *backButton;
    
    ASIFormDataRequest   *dataRequest;
}
@end
