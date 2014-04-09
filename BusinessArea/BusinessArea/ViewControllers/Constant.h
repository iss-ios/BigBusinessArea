//
//  Constant.h
//  jimbrothers
//
//  Created by Apple on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import "UIViewController+CustomNavigationBar.h"
#import "UIView+CustomStatusBar.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "Toast+UIView.h"
#import "NSObject+SBJson.h"
#import "AdaptiveTextField.h"
#import "Common.h"
#import "AppDelegate.h"

//屏幕适配
//#define Title_Height ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0? 64.0:50.0)
#define Title_Height 50.0
#define Screen_Width [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0? YES : NO)


//滑动显示Menu边缘
#define Margin_Wight 80
//
#define POPUP_BOX_EDGE 10

//接口
#define Login_Url                   @"http://www.chinavalues.net/appuser/login.aspx"
#define Register_Url                @"http://www.chinavalues.net/appuser/register.aspx"
#define Modify_Password_Url         @"http://www.chinavalues.net/appuser/updateuserpwd.aspx"
#define GetBusinessClassification   @"http://www.chinavalues.net/appuser/getBusinessClassification.aspx"

//UIImageView完成异步加载图片
#define FinishDownloadImage @"FinishDownloadImage"
#define FinishedImage       @"FinishedImage"

