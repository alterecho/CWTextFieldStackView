//
//  CWTextFieldStackView.h
//  CWTextFieldStack
//
//  Created by Vijay Chandran J on 11/02/18.
//  Copyright © 2018 Vijay Chandran J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWTextFieldStackView : UIView

@property (nonatomic) NSUInteger        textFieldCount;

/** Height of each text field in the stack. 0 for auto-set */
@property (nonatomic) CGFloat           textFieldHeight;

@end
