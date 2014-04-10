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
    [self navigationBar].navBarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:Nav_Bar_Back_Image]];
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
        dataRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?username=%@&password=%@",Login_Url,emailTextField.text,passwordTextField.text]]];
        [dataRequest setDelegate:self];
//        [mRequest setRequestMethod:@"POST"];
        
        [dataRequest setTimeOutSeconds:10.0];
        [dataRequest setNumberOfTimesToRetryOnTimeout:1]; // 超时重试1次。
//        [mRequest setPostValue:@"admin" forKey:@"username"];
//        [mRequest setPostValue:@"qwe123" forKey:@"password"];
        [dataRequest startAsynchronous];
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
    [dataRequest clearDelegatesAndCancel];
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
        
        BOOL logined = NO;
        NSString *account = nil;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:logined forKey:Logined_Key];
        [defaults synchronize];
        
        switch ([status intValue]) {
            case 0:
            {
                [[UIApplication sharedApplication].keyWindow makeToast:@"登录失败" duration:2.0 position:@"bottom"];
                
            }
                break;
            case 1:
            {
                logined = YES;
                account = emailTextField.text;
                
                [defaults setBool:logined forKey:Logined_Key];
                [defaults setValue:account forKey:User_Account_Key];
                [defaults synchronize];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:Notification_Logined_Key object:self];
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
