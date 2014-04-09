//
//  MenuViewGenerator.m
//  XiFangTong
//
//  Created by issuser on 13-7-30.
//  Copyright (c) 2013年 YouYan. All rights reserved.
//

#import "MenuViewGenerator.h"

#import "MenuButton.h"



@implementation MenuViewGenerator


-(id)initWithFrame:(CGRect)frame titles:(NSArray *)titles imageNames:(NSArray *)images activeController:(UIViewController *)controller
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = frame;
        activeController_ = controller;
        for (int i = 0; i < titles.count; i++) {
            
            NSString *title = [titles objectAtIndex:i];

            CGFloat w = Screen_Width/3.0;
           
            MenuButton *menuView = [[MenuButton alloc] initWithFrame:CGRectMake(i%3*w, i/3*w, w,w) image:[images objectAtIndex:i] text:title];
            menuView.tag = i;
            
            [menuView setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"user_btn_bg.png"]] forState:UIControlStateNormal];
            
            [menuView setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"user_btn_bg.png"]] forState:UIControlStateHighlighted];
            
            [menuView addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

            [self addSubview:menuView];
            
            
        }
    }
    return self;
}
//主界面按钮点击事件
-(void)buttonClicked:(UIButton *)sender
{
    int btag = [sender tag];
    switch (btag) {
        case 0:
        {
            
        }
            break;
        case 1:
        {

        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}

@end
