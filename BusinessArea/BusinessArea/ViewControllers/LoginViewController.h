//
//  LoginViewController.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<ASIHTTPRequestDelegate>
{
    IBOutlet UIView      *contentView;
    IBOutlet AdaptiveTextField *emailTextField;
    IBOutlet AdaptiveTextField *passwordTextField;
    IBOutlet UIImageView *backgroudImgView;
    IBOutlet UIButton    *backButton;
    ASIFormDataRequest   *dataRequest;
}
@end
