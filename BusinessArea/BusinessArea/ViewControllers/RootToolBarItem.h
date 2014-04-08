//
//  RootTabBarItem.h
//  TecentQQ
//
//  Created by iss on 14-3-12.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootToolBarItem : UIButton
{
    UILabel *textLabel;
    UIImageView *imgView;
    UIImage *normalImage;
    UIImage *pressedImage;
    UIImageView *selectedImgView;
}
@property (nonatomic) BOOL selected;
@property (strong, nonatomic) UIImage *selectedImage;

-(id)initWithFrame:(CGRect)frame title:(NSString *)title normalImage:(UIImage *)norImage pressedImage:(UIImage *)preImage;

@end
