//
//  RecommandViewController.m
//  iOSDemo
//
//  Created by ByteDance on 7/9/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "RecommandViewController.h"

@implementation RecommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    label.text = @"RecommandViewController";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end

