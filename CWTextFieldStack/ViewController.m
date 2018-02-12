//
//  ViewController.m
//  CWTextFieldStack
//
//  Created by Vijay Chandran J on 09/02/18.
//  Copyright © 2018 Vijay Chandran J. All rights reserved.
//

#import "ViewController.h"
#import "CWTextFieldStackView.h"

@interface ViewController () {
    CWTextFieldStackView        *stackView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    stackView = [[CWTextFieldStackView alloc] init];
    
    [self.view addSubview:stackView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    stackView.frame = CGRectMake(0.0f, 30.0, 300.0f, 100.0f);
    stackView.backgroundColor = [UIColor grayColor];
    stackView.fieldCount = 2;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
