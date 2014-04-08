//
//  RegisterViewController.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<ASIHTTPRequestDelegate,UITextFieldDelegate>
{
    IBOutlet UIScrollView      *contentView;
    IBOutlet AdaptiveTextField *emailTextField;
    IBOutlet AdaptiveTextField *passwordTextField;
    IBOutlet AdaptiveTextField *rePasswordTextField;
    IBOutlet AdaptiveTextField *authCodeTextField;
    
    IBOutlet UIButton *backButton;
}

@end
