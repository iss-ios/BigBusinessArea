//
//  MenuButton.m
//  XiFangTong
//
//  Created by issuser on 13-9-6.
//  Copyright (c) 2013年 YouYan. All rights reserved.
//

#import "MenuButton.h"
#define Image_Width  45
#define Button_Normal_Color  [UIColor blackColor]
#define Button_Press_Color  [UIColor blackColor]

@implementation MenuButton

-(id)initWithFrame:(CGRect)frame image:(NSString *)imageName text:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake((frame.size.width-Image_Width)/2.0, 15, Image_Width, Image_Width);
        imgView.image = [UIImage imageNamed:imageName];
        [self addSubview:imgView];
        
        //显示文字
        textLabel = [[UILabel alloc] init];
        textLabel.frame = CGRectMake(0, 75, frame.size.width, 21);
        textLabel.font = [UIFont boldSystemFontOfSize:14.0];
        textLabel.textColor = [UIColor blackColor];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        textLabel.text = title;
    }
    return self;
}
/**
 设置按钮点击后文字颜色
 **/
-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    textLabel.textColor = Button_Press_Color;
    return YES;
}
-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (self.state == UIControlStateHighlighted) {
        textLabel.textColor = Button_Press_Color;
    }
    else{
        textLabel.textColor = Button_Normal_Color;
    }
    return YES;
}
-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    textLabel.textColor = Button_Normal_Color;
}
-(void)cancelTrackingWithEvent:(UIEvent *)event
{
    textLabel.textColor = Button_Normal_Color;
}

@end
