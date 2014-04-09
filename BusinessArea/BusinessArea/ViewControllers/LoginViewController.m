//
//  LoginViewController.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
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
    
    //背景图片加圆角
    contentView.layer.cornerRadius = 5.0;
    contentView.layer.masksToBounds = YES;
    
    [self showNavigationBarWithTitle:@"登录" leftButton:backButton rightButton:nil];
    [self navigationBar].barTintColor = [UIColor colorWithRed:0 green:108/255.0 blue:200/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark  button click

- (IBAction)loginButtonClicked:(id)sender
{
    if (![emailTextField checkInputIsEmptyWithTip:@"用户名或邮箱不能为空"] && ![passwordTextField checkInputIsEmptyWithTip:@"密码不能为空"]) {
        //username=admin&password=qwe123
        ASIFormDataRequest *mRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?username=%@&password=%@",Login_Url,emailTextField.text,passwordTextField.text]]];
        [mRequest setDelegate:self];
//        [mRequest setRequestMethod:@"POST"];
        
        [mRequest setTimeOutSeconds:10.0];
        [mRequest setNumberOfTimesToRetryOnTimeout:1]; // 超时重试1次。
//        [mRequest setPostValue:@"admin" forKey:@"username"];
//        [mRequest setPostValue:@"qwe123" forKey:@"password"];
        [mRequest startAsynchronous];
    }
    
    
}
- (IBAction)registerButtonClicked:(id)sender
{
    RegisterViewController *registerController = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerController animated:YES];
}
- (IBAction)forgetButtonClicked:(id)sender
{
    ForgetPasswordViewController *forget = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forget animated:YES];
}
- (IBAction)backButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -
#pragma mark touches
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![emailTextField isExclusiveTouch] && ![passwordTextField isExclusiveTouch]) {
        [emailTextField resignFirstResponder];
        [passwordTextField resignFirstResponder];
    }
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
                [[UIApplication sharedApplication].keyWindow makeToast:@"登录失败" duration:2.0 position:@"bottom"];
                
            }
                break;
            case 1:
            {
                [[UIApplication sharedApplication].keyWindow makeToast:@"登录成功" duration:2.0 position:@"bottom"];
                [self.navigationController popViewControllerAnimated:YES];
            }
                break;
            case 2:
                [[UIApplication sharedApplication].keyWindow makeToast:@"帐号被锁定" duration:2.0 position:@"bottom"];
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
    
    [[UIApplication sharedApplication].keyWindow makeToast:@"请检查网络" duration:2.0 position:@"bottom"];
}
@end
