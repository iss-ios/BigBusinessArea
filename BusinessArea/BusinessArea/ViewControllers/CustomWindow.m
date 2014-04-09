//
//  CustomWindow.m
//  BusinessArea
//
//  Created by iss on 14-4-9.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "CustomWindow.h"

@implementation CustomWindow
@synthesize statusBarColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    if (statusBarColor == nil) {
        statusBarColor = [UIColor whiteColor];
    }
    UIView *statusView = [[UIView alloc] init];
    statusView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 20);
    statusView.backgroundColor = statusBarColor;
    [self addSubview:statusView];
    
    //绘图
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    // set the properties
//    CGContextSetAlpha(context,1.0);
//    
//    // draw the rectangle
//    CGRect rectToFill = CGRectMake(rect.origin.x, rect.origin.y, 320, 20);
//    
//    
//    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
//    
//    CGContextFillRect(UIGraphicsGetCurrentContext(), rectToFill);
    
}


@end
