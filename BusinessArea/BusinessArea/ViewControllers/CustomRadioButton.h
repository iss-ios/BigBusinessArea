//
//  CustomRadioButton.h
//  BusinessArea
//
//  Created by Destiny on 14-4-9.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomRadioButtonDelegate

-(void)customRadioButtonPressed:(int)index;

@end

@interface CustomRadioButton : UIView
{
    NSMutableArray *buttonList;
}

@property (nonatomic, assign) id <CustomRadioButtonDelegate> delegate;

-(void)setButtonWithArray:(NSMutableArray *)array;
-(void)setRadioButtonStatus:(int)index;

@end
