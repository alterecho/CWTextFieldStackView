//
//  CWTextFieldStackView.h
//  CWTextFieldStack
//
//  Created by Vijay Chandran J on 11/02/18.
//  Copyright © 2018 Vijay Chandran J. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CWTextFieldStackView;

@protocol CWTextFieldStackViewDelegate
/* Called when a UITextField is added */
- (void)cwTextFieldStackView:(CWTextFieldStackView *)textFieldStackView didAddUITextField:(UITextField *)textField;
/* Called when a UITextField is removed */
- (void)cwTextFieldStackView:(CWTextFieldStackView *)textFieldStackView didRemovedUITextField:(UITextField *)textField;
@end

IB_DESIGNABLE
@interface CWTextFieldStackView : UIView

@property (nonatomic) IBInspectable NSUInteger  fieldCount;


/** Height of each text field in the stack. 0 for auto-set */

@property (nonatomic) IBInspectable CGFloat     fieldHeight;
@property (nonatomic) IBInspectable CGFloat     cornerRadius;

@property (nonatomic, readonly) NSArray<UITextField *>      *textFields;

@property (nonatomic, weak) id<CWTextFieldStackViewDelegate>        delegate;

@end
