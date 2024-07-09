//
//  MallViewController.m
//  iOSDemo
//
//  Created by ByteDance on 7/9/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "MallViewController.h"

@implementation MallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    label.text = @"MallViewController ";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end

