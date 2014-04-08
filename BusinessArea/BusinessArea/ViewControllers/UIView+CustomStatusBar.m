//
//  UIView+CustomStatusBar.m
//  BusinessArea
//
//  Created by iss on 14-4-4.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "UIView+CustomStatusBar.h"
#import <CoreGraphics/CoreGraphics.h>

#define iOS_System_Version [[UIDevice currentDevice].systemVersion floatValue] //当前系统版本号

@implementation UIView (CustomStatusBar)
//- (void)drawRect:(CGRect)rect
//{
//
//}
- (void)setStatusBarColor:(UIColor *)color
{
    if (iOS_System_Version >=7.0) {
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(con, color.CGColor);
        
        CGContextFillRect(con, CGRectMake(0, 0, Screen_Width, 20));
        
        //执行绘画
        CGContextStrokePath(con);
        
        [self setNeedsDisplay];
    }
}
@end
