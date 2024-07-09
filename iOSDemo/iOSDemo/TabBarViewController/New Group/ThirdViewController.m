//
//  ThiredViewController.m
//  iOSDemo
//
//  Created by ByteDance on 7/8/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    label.text = @"3 View ";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end
