//
//  CustomNavigationBar.m
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "CustomNavigationBar.h"

#define Navigation_Bar_Height ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0? 64.0:44.0) //navigationBar的高度，如果系统为7.0及以上，高度为64.0，否则为44.0

#define Navigation_Bar_Height_Without_Status_Bar  44.0

#define iOS_System_Version [[UIDevice currentDevice].systemVersion floatValue] //当前系统版本号

#define Title_View_Max_Width [[UIScreen mainScreen] bounds].size.width*0.8 //标题视图最大宽度为屏幕宽度的0.8倍

#define Side_View_Max_Width [[UIScreen mainScreen] bounds].size.width*0.4 //左右视图最大宽度为屏幕宽度的0.4倍

#define OriginalY    ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0? 20.0:0.0) //初始y轴坐标，如果系统为7.0意思，y值为20.0，7.0之前的系统y值为0.0

#define screenWidth  [[UIScreen mainScreen] bounds].size.width //屏幕宽度

#define Side_View_OriginalX 5.0

#define Status_Bar_Height  20.0

#define Navigation_Bar_Tag  100

#define Title_Label_Tag 110

@implementation CustomNavigationBar

@synthesize leftView;
@synthesize rightView;
@synthesize titleView;
@synthesize title;
@synthesize barTintColor;
@synthesize backgroundView;
@synthesize navBarView;
@synthesize statusBarView;
@synthesize statusBarColor;
@synthesize titleTextAttributes;

#pragma mark -
#pragma mark init
-(id)initWithFrame:(CGRect)frame title:(NSString *)text leftButton:(UIButton *)leftButton rightButton:(UIButton *)rightButton
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        
        //background view
        [self setBackgroundView:nil];
        
        //title
        if (text.length != 0) {
            [self setTitle:text];
        }
        
        //left button
        if (leftButton != nil) {
            [self setLeftView:leftButton];
        }
        
        //right button
        if (rightButton != nil) {
            [self setRightView:rightButton];
        }
        
        self.layer.shadowOffset = CGSizeMake(0, 2);
        self.layer.shadowOpacity = 0.6;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    }
    return self;
}

#pragma mark -
#pragma mark property
- (void)setTitleView:(UIView *)tView
{
    //判断标题视图是否超过最大宽度和最大高度
    CGRect frame = tView.frame;
    
    CGFloat height = frame.size.height >=  Navigation_Bar_Height_Without_Status_Bar? Navigation_Bar_Height_Without_Status_Bar:frame.size.height;
    
    CGFloat width = frame.size.width >= Title_View_Max_Width? Title_View_Max_Width:frame.size.width;
    
    
    //设置标签视图
    if (titleView == nil) {
        titleView = [[UIView alloc] init];
        titleView.frame = CGRectMake((screenWidth-width)/2.0, OriginalY+(Navigation_Bar_Height_Without_Status_Bar-height)/2.0, width, height);
        titleView.backgroundColor = [UIColor clearColor];
        [self addSubview:titleView];
    }
    titleView.frame = CGRectMake((screenWidth-width)/2.0, OriginalY+(Navigation_Bar_Height_Without_Status_Bar-height)/2.0, width, height);
    tView.frame = CGRectMake(0, 0, width, height);
    
    [titleView addSubview:tView];
    
}
- (void)setLeftView:(UIView *)lView
{
    CGRect frame = lView.frame;
    
    CGFloat height = frame.size.height >=  Navigation_Bar_Height_Without_Status_Bar? Navigation_Bar_Height_Without_Status_Bar:frame.size.height;
    
    CGFloat width = frame.size.width >= Side_View_Max_Width? Side_View_Max_Width:frame.size.width;
    
    if (leftView == nil) {
        leftView = [[UIView alloc] init];
        leftView.frame = CGRectMake(Side_View_OriginalX, OriginalY+(Navigation_Bar_Height_Without_Status_Bar-height)/2.0, width, height);
        leftView.backgroundColor = [UIColor clearColor];
        [self addSubview:leftView];
    }
    for (UIView *sub in leftView.subviews) {
        [sub removeFromSuperview];
    }
    lView.frame = CGRectMake(0, 0, width, height);
    [leftView addSubview:lView];
}
- (void)setRightView:(UIView *)rView
{
    CGRect frame = rView.frame;
    
    CGFloat height = frame.size.height >=  Navigation_Bar_Height_Without_Status_Bar? Navigation_Bar_Height_Without_Status_Bar:frame.size.height;
    
    CGFloat width = frame.size.width >= Side_View_Max_Width? Side_View_Max_Width:frame.size.width;
    
    if (rightView == nil) {
        rightView = [[UIView alloc] init];
        rightView.frame = CGRectMake(screenWidth-Side_View_OriginalX-width, OriginalY+(Navigation_Bar_Height_Without_Status_Bar-height)/2.0, width, height);
        rightView.backgroundColor = [UIColor clearColor];
        [self addSubview:rightView];
    }
    for (UIView *sub in rightView.subviews) {
        [sub removeFromSuperview];
    }
    rView.frame = CGRectMake(0, 0, width, height);
    [rightView addSubview:rView];
    //    [self setNeedsDisplay];
}
- (void)setBackgroundView:(UIView *)bView
{
    if (backgroundView == nil) {
        backgroundView = [[UIView alloc] init];
        backgroundView.frame = CGRectMake(0, 0, screenWidth, Navigation_Bar_Height);
        //        backgroundView.backgroundColor = [UIColor clearColor];
        [self addSubview:backgroundView];
    }
    for (UIView *sub in backgroundView.subviews) {
        if (sub.tag != Navigation_Bar_Tag) {
            [sub removeFromSuperview];
        }
    }
    bView.frame = backgroundView.frame;
    [backgroundView addSubview:bView];
    //    [self setNeedsDisplay];
}
-(void)setNavBarView:(UIView *)nView
{
    [self addNavigationBarView];
    nView.frame = CGRectMake(0, 0, navigationBarView.frame.size.width, navigationBarView.frame.size.height);
    [navigationBarView addSubview:nView];

}
- (void)setStatusBarView:(UIView *)sbView
{
    if (statusBarView == nil) {
        statusBarView = [[UIView alloc] init];
        statusBarView.frame = CGRectMake(0, 0, screenWidth, Status_Bar_Height);
        statusBarView.backgroundColor = [UIColor clearColor];
        [self addSubview:statusBarView];
    }
    for (UIView *sub in statusBarView.subviews) {
        if (sub.tag != Title_Label_Tag) {
            [sub removeFromSuperview];
        }
        
    }
    sbView.frame = CGRectMake(0, 0, screenWidth, Status_Bar_Height);
    [statusBarView addSubview:sbView];
    [self setNeedsDisplay];
}
- (void)setStatusBarColor:(UIColor *)sbColor
{
    if (iOS_System_Version >= 7.0) {
        statusBarColor = sbColor;
        [self setStatusBarView:nil];
        statusBarView.backgroundColor = sbColor;
    }
    //    [self setNeedsDisplay];
}
- (void)setBarTintColor:(UIColor *)barColor
{
    barTintColor = barColor;
    if (iOS_System_Version >= 7.0) {
        [self addNavigationBarView];
        navigationBarView.backgroundColor = barColor;
    }
    else{
        backgroundView.backgroundColor = barColor;
    }
    //    [self setNeedsDisplay];
}
- (void)setTitle:(NSString *)text
{
    title = text;
    [self setTitleView:nil];
    
    //text.length != 0 &&
    if ([titleView viewWithTag:Title_Label_Tag] == nil) {
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = text;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:21.0];
        titleLabel.tag = Title_Label_Tag;
        
        CGRect bounds = [titleLabel.text boundingRectWithSize:CGSizeMake(Title_View_Max_Width, Navigation_Bar_Height_Without_Status_Bar) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:titleLabel.font,NSFontAttributeName,titleLabel.textColor,NSForegroundColorAttributeName, nil] context:nil];
        titleLabel.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
        
        [self setTitleView:titleLabel];
    }
    //    [self setNeedsDisplay];
}
- (void)addNavigationBarView
{
    if (navigationBarView == nil) {
        navigationBarView = [[UIView alloc] init];
        navigationBarView.frame = CGRectMake(0, OriginalY, screenWidth, Navigation_Bar_Height_Without_Status_Bar);
        navigationBarView.tag = Navigation_Bar_Tag;
        [backgroundView addSubview:navigationBarView];
    }
    //    [self setNeedsDisplay];
}
- (void)setTitleTextAttributes:(NSDictionary *)textAttributes
{
    titleTextAttributes = textAttributes;
    
    if (titleLabel == nil) {
        [self setTitle:title];
    }
    for (NSString *key in textAttributes) {
        if ([key isEqualToString:NSFontAttributeName]) {
            titleLabel.font = [textAttributes valueForKey:key];
        }
        else if ([key isEqualToString:NSForegroundColorAttributeName])
        {
            titleLabel.textColor = [textAttributes valueForKey:key];
            
        }
        else if ([key isEqualToString:NSShadowAttributeName]){
            NSShadow *shadow = [textAttributes valueForKey:key];
            titleLabel.shadowColor = shadow.shadowColor;
            titleLabel.shadowOffset = shadow.shadowOffset;
        }
        
    }
}
@end
