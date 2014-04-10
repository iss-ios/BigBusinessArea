//
//  MenuViewGenerator.h
//  XiFangTong
//
//  Created by issuser on 13-7-30.
//  Copyright (c) 2013年 YouYan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewGenerator : UIView<UIAlertViewDelegate>
{
    UIViewController *activeController_;
}
-(id)initWithFrame:(CGRect)frame titles:(NSArray *)titles imageNames:(NSArray *)images activeController:(UIViewController *)controller;

@end
