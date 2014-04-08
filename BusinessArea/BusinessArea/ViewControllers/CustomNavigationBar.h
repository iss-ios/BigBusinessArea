//
//  CustomNavigationBar.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationBar : UIView
{
    UIView *navigationBarView;
    UILabel *titleLabel;
}
@property (strong, nonatomic) UIView *leftView; //navigationBar的左视图，最大宽度为navigationBar宽度的0.4倍，默认为nil;

@property (strong, nonatomic) UIView *rightView; //navigationBar的右视图，最大宽度为navigationBar宽度的0.4倍，默认为nil;

@property (strong, nonatomic) UIView *titleView; //navigationBar的标题视图，最大宽度为navigationBar宽度的0.8倍，默认为nil;

@property (copy,   nonatomic) NSString *title; //navigationBar的标题，默认为nil;

@property (strong, nonatomic) UIColor *barTintColor; //navigationBar颜色，与statusBarColor颜色无关，默认为whiteColor;

@property (strong, nonatomic) UIView *backgroundView; //navigationBar的背景视图，默认为nil，注：当系统版本号为7.0及以上时，若设置此属性且statusBarView为nil时，statusBar的背景与navigationBar的背景一致;

@property (strong, nonatomic) UIView *statusBarView; //注：只有当系统版本号为7.0及以上时才能设置，默认为nil;

@property (strong, nonatomic) UIColor *statusBarColor; //注：只有当系统版本号为7.0及以上时才有效，默认与navigationBar的barTintColor一样;

@property(nonatomic,copy) NSDictionary *titleTextAttributes;

- (id)initWithFrame:(CGRect) frame title:(NSString *)text leftButton:(UIButton *)leftButton rightButton:(UIButton *)rightButton;

@end
