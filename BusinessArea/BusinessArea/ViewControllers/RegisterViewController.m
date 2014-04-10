//
//  RegisterViewController.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
#pragma mark -
#pragma mark view
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showNavigationBarWithTitle:@"注册" leftButton:backButton rightButton:nil];
    [self navigationBar].navBarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:Nav_Bar_Back_Image]];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //背景图片加圆角
    contentView.layer.cornerRadius = 5.0;
    contentView.layer.masksToBounds = YES;
    //    contentView.frame = CGRectMake(contentView.frame.origin.x, 54, contentView.frame.size.width, contentView.frame.size.height);
    //    contentView.contentOffset = CGPointMake(0, 0);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark button click
- (IBAction)backButtonClicked:(id)sender
{
    [dataRequest clearDelegatesAndCancel];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)registerButtonClicked:(id)sender
{
    if (![emailTextField checkInputIsEmptyWithTip:@"手机号或邮箱不能为空"] &&
        ![passwordTextField checkInputIsEmptyWithTip:@"密码不能为空"] &&
        ![rePasswordTextField checkInputIsEmptyWithTip:@"请重新输入一遍密码"] &&
        ![authCodeTextField checkInputIsEmptyWithTip:@"验证码不能为空"] &&
        [passwordTextField checkInputIsEqualToString:rePasswordTextField.text tip:@"两次输入密码不一致"] &&
        [authCodeTextField checkInputIsEqualToString:@"1715" tip:@"验证码输入错误"]) {
        
        dataRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?username=%@&password=%@",Register_Url,emailTextField.text,passwordTextField.text]]];
        [dataRequest setDelegate:self];
        [dataRequest setRequestMethod:@"POST"];
        
        [dataRequest setTimeOutSeconds:10.0];
        [dataRequest setNumberOfTimesToRetryOnTimeout:1]; // 超时重试1次。
//        [mRequest setPostValue:emailTextField.text forKey:@"username"];
//        [mRequest setPostValue:passwordTextField.text forKey:@"password"];
        [dataRequest startAsynchronous];
    }
    
}

#pragma mark -
#pragma mark text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == authCodeTextField) {
        [authCodeTextField doneButtonIsClicked:nil];
    }
    else if (textField == emailTextField){
        [passwordTextField becomeFirstResponder];
    }
    else if (textField == passwordTextField){
        [rePasswordTextField becomeFirstResponder];
    }
    else{
        [authCodeTextField becomeFirstResponder];
    }
    return YES;
}
- (void)resignResponder
{
    [emailTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    [rePasswordTextField resignFirstResponder];
    [authCodeTextField resignFirstResponder];
}
#pragma mark -
#pragma mark request
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"%@",request.responseString);
    if ([[request.responseString JSONValue] isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = [request.responseString JSONValue];
        NSString *status = [dic objectForKey:@"status"];
        
        switch ([status intValue]) {
            case 0:
            {
                [[UIApplication sharedApplication].keyWindow makeToast:@"注册失败" duration:2.0 position:@"bottom"];
                
            }
                break;
            case 1:
            {
                [[UIApplication sharedApplication].keyWindow makeToast:@"注册成功" duration:2.0 position:@"bottom"];
                [self.navigationController popViewControllerAnimated:YES];
            }
                break;
            case 2:
                [[UIApplication sharedApplication].keyWindow makeToast:@"用户已存在" duration:2.0 position:@"bottom"];
                break;
            case 3:
                [[UIApplication sharedApplication].keyWindow makeToast:@"参数错误" duration:2.0 position:@"bottom"];
                break;
            default:
                break;
        }
    }
    
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    
}
@end
