//
//  RootTabBarItem.m
//  TecentQQ
//
//  Created by iss on 14-3-12.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "RootToolBarItem.h"

#define Label_Height 20.0
#define ImgViewHeight 25.0
#define HighlightedColor [UIColor whiteColor]
#define NormalColor [UIColor whiteColor]

@implementation RootToolBarItem

@synthesize selected;
@synthesize selectedImage;

#pragma mark -
#pragma mark init

-(id)initWithFrame:(CGRect)frame title:(NSString *)title normalImage:(UIImage *)norImage pressedImage:(UIImage *)preImage
{
    self = [super initWithFrame:frame];
    if (self) {
        
        normalImage = norImage;
        pressedImage = preImage;
        
        selectedImgView = [[UIImageView alloc] init];
        selectedImgView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:selectedImgView];
        
        imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(frame.size.width/2.0-ImgViewHeight/2.0, 5, ImgViewHeight, ImgViewHeight);
        imgView.image = norImage;
        [self addSubview:imgView];
        
        textLabel = [[UILabel alloc] init];
        textLabel.frame = CGRectMake(0, frame.size.height-Label_Height, frame.size.width, Label_Height);
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont systemFontOfSize:12.0];
        textLabel.textColor = NormalColor;
        textLabel.text = title;
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        
    }
    return self;
}
#pragma mark -
#pragma mark property
- (void)setSelectedImage:(UIImage *)_image
{
    selectedImage = _image;
    [self setSelected:selected];
}
- (void)setSelected:(BOOL)select
{
    selected = select;
    if (select) {
        textLabel.textColor = HighlightedColor;
        imgView.image = pressedImage;
        selectedImgView.image = selectedImage;
    }
    else{
        textLabel.textColor = NormalColor;
        imgView.image = normalImage;
        selectedImgView.image = nil;
    }
}

#pragma mark -
#pragma mark 设置按钮点击后文字颜色

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    textLabel.textColor = HighlightedColor;
    imgView.image = pressedImage;
    return YES;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (self.state == UIControlStateHighlighted) {
        textLabel.textColor = HighlightedColor;
        imgView.image = pressedImage;
    }
    else{
        textLabel.textColor = NormalColor;
        imgView.image = normalImage;
    }
    return YES;
}
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
//    textLabel.textColor = NormalColor;
//    imgView.image = normalImage;
}
- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    textLabel.textColor = NormalColor;
    imgView.image = normalImage;
}
@end
