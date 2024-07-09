//
//  ThiredViewController1.m
//  iOSDemo
//
//  Created by ByteDance on 7/8/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "FifthViewController.h"

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    label.text = @"5 View ";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end
