//
//  MHTextField.h
//
//  Created by Mehfuz Hossain on 4/11/13.
//  Copyright (c) 2013 Mehfuz Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldInputCheck.h"

@class AdaptiveTextField;

@protocol AdaptiveTextFieldDelegate <NSObject>

@required
- (AdaptiveTextField*) textFieldAtIndex:(int)index;
- (int) numberOfTextFields;

@end

@interface AdaptiveTextField : UITextField
{
@private
    TextFieldInputCheck *inputCheck_;
}
@property (nonatomic) BOOL required;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, setter = setDateField:) BOOL isDateField;
@property (nonatomic, setter = setEmailField:) BOOL isEmailField;

@property (nonatomic, assign) id<AdaptiveTextFieldDelegate> textFieldDelegate;


- (BOOL) checkInputIsEmpty;//检查输入是否为空
- (BOOL) checkInputIsEmptyWithTip:(NSString *)tip;//检查输入是否为空，并提示
- (BOOL) checkInputIsMobileNumber;//检查输入是否为手机号
- (BOOL) checkInputIsEqualToString:(NSString *)string tip:(NSString *)tipTitle;//检查输入是否与指定字符相同，并提示
- (void) doneButtonIsClicked:(id)sender;
- (BOOL) validate;

@end
