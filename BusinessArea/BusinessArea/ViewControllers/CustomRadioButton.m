//
//  CustomRadioButton.m
//  BusinessArea
//
//  Created by Destiny on 14-4-9.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import "CustomRadioButton.h"

@implementation CustomRadioButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setButtonWithArray:(NSMutableArray *)array
{
    if (buttonList == nil)
    {
        buttonList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    if (buttonList.count != 0)
    {
        [buttonList removeAllObjects];
    }
    
    
    for (int i = 0; i < [array count]; i++)
    {
        int button_width = (self.frame.size.width / array.count);
        UIButton *button = [[UIButton alloc] init];
        [button setTag:i];
        [button setTintColor:[UIColor blueColor]];
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateSelected];
        [button setFrame:CGRectMake(button_width * i, 0, button_width, self.frame.size.height)];
        [button addTarget:self action:@selector(radioButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [buttonList addObject:button];
        [self addSubview:button];
    }
}

-(void)radioButtonPressed:(UIButton *)button
{
    if (button.tag < buttonList.count)
    {
        [self setRadioButtonStatus:button.tag];
        [self.delegate customRadioButtonPressed:button.tag];
    }
    else
    {
        NSLog(@"CustomRadioButton Error !");
    }
}

-(void)setRadioButtonStatus:(int)index
{
    for (UIButton *button in buttonList)
    {
        if (button.tag == index)
        {
            [button setSelected:YES];
        }
        else
        {
            [button setSelected:NO];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
