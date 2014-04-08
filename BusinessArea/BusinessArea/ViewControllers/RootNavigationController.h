//
//  RootNavigationController.h
//  BusinessArea
//
//  Created by iss on 14-4-2.
//  Copyright (c) 2014年 youyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootNavigationController : UINavigationController
{
    BOOL showToolBar;
    NSMutableArray *items;
    UIView *customToolBar;
}
@property (strong, nonatomic) NSArray *toolBarItems;

@end
