//
//  CWTextFieldStackView.m
//  CWTextFieldStack
//
//  Created by Vijay Chandran J on 11/02/18.
//  Copyright © 2018 Vijay Chandran J. All rights reserved.
//

#import "CWTextFieldStackView.h"

@interface CWTextFieldStackView () {
    NSMutableArray<UITextField *>      *_textFields;
}
@end

@implementation CWTextFieldStackView

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        
    }
    return self;
}

- (void)initialize {
    _textFields = [NSMutableArray array];
}

- (void)setTextFieldCount:(NSUInteger)textFieldCount {
    if (textFieldCount == _textFieldCount) {
        return;
    }
    
    _textFieldCount = textFieldCount;
    
    /* add new text fields if count is more than array */
    if (_textFields.count < _textFieldCount) {
        NSInteger numberOfFieldsToAdd = _textFieldCount - _textFields.count;
        for (NSInteger i = 0; i < numberOfFieldsToAdd; i++) {
            UITextField *textField = [[UITextField alloc] init];
            [self addSubview:textField];
            [_textFields addObject:textField];
        }
    }
    /* else if it is less, remove textfields from the end of the array */
    else if (_textFields.count > _textFieldCount) {
        for (NSInteger i = 0; i >= _textFieldCount; i--) {
            UITextField *textField = _textFields.lastObject;
            [textField removeFromSuperview];
            [_textFields removeLastObject];
        }
    }
}

- (void)resetFrames {
        // height of each textfield
    CGFloat height = 30.0f;
        // the origin.y of previous text field
    CGFloat lastYPos = -height;
    
    // iterate through _textFields and set the frame of each text field
    for (int i = 0; i < _textFields.count; i++) {
        UITextField *textField = _textFields[i];
        textField.frame = CGRectMake(0.0f, lastYPos + height, self.frame.size.width, self.frame.size.height);
        lastYPos = textField.frame.origin.y;
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self resetFrames];
}

@end
