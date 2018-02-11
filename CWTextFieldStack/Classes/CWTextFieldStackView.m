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
    _textFieldCount = textFieldCount
}

@end
