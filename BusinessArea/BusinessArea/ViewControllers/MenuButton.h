//
//  MenuButton.h
//  XiFangTong
//
//  Created by issuser on 13-9-6.
//  Copyright (c) 2013年 YouYan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuButton : UIButton
{
    UILabel *textLabel;
    UIImageView *imgView;

}
-(id)initWithFrame:(CGRect)frame image:(NSString *)imageName text:(NSString *)title;


@end
