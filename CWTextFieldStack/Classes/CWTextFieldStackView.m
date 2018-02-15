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
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initialize];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self initialize];
    
#if TARGET_INTERFACE_BUILDER
    self.backgroundColor = [UIColor lightGrayColor];
#endif
}

- (void)initialize {
    _fieldCount = 0.0f;
    
    _textFields = [NSMutableArray array];
    self.clipsToBounds = YES;
    
    self.layer.cornerRadius = _cornerRadius;
}

- (NSArray<UITextField *> *)textFields {
    return _textFields;
}

- (void)setFieldCount:(NSUInteger)fieldCount {
    if (fieldCount == _fieldCount) {
        return;
    }
    
    _fieldCount = fieldCount;
    
    /* add new text fields if count is more than array */
    if (_textFields.count < _fieldCount) {
        NSInteger numberOfFieldsToAdd = _fieldCount - _textFields.count;
        for (NSInteger i = 0; i < numberOfFieldsToAdd; i++) {
            UITextField *textField = [[UITextField alloc] init];
            textField.backgroundColor = [UIColor colorWithRed:((arc4random() % 255) / 100.0f) green:((arc4random() % 255) / 100.0f) blue:((arc4random() % 255) / 100.0f) alpha:1.0f];
            [self addSubview:textField];
            [_textFields addObject:textField];
            [_delegate cwTextFieldStackView:self didAddUITextField:textField];
        }
    }
    /* else if it is less, remove textfields from the end of the array */
    else if (_textFields.count > _fieldCount) {
        for (NSInteger i = 0; i >= _fieldCount; i--) {
            UITextField *textField = _textFields.lastObject;
            [textField removeFromSuperview];
            [_textFields removeLastObject];
            [_delegate cwTextFieldStackView:self didRemovedUITextField:textField];
        }
    }
    
    
    [self resetFrames];
}

- (void)resetFrames {
        // height of each textfield
    CGFloat height = 30.0f;
    
    if (_fieldCount <= 0) {
        height = self.frame.size.height / (CGFloat)_textFields.count;
    }
    
        // the origin.y of previous text field
    CGFloat lastYPos = -height;
    
    // iterate through _textFields and set the frame of each text field
    for (int i = 0; i < _textFields.count; i++) {
        UITextField *textField = _textFields[i];
        textField.frame = CGRectMake(0.0f, lastYPos + height, self.frame.size.width, height);
        lastYPos = textField.frame.origin.y;
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self resetFrames];
}

@end
