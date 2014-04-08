//
//  Common.m
//  BusinessArea
//
//  Created by Destiny on 14-4-5.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "Common.h"

@implementation Common

+(void)setViewCornerRadius:(UIView *)view where:(UIRectCorner)rectCorner
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(5.0, 5.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    [maskLayer setFrame:view.bounds];
    [maskLayer setPath:maskPath.CGPath];
    [view.layer setMask:maskLayer];
}

@end
