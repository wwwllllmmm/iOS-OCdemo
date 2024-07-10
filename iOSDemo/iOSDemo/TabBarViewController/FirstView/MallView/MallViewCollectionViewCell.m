//
//  MallViewController.m
//  iOSDemo
//
//  Created by ByteDance on 7/9/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "MallViewCollectionViewCell.h"

@implementation MallViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.mallSubview = [[UIView alloc] initWithFrame:self.contentView.bounds];
        self.mallSubview.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.mallSubview];
    }
    return self;
}

@end
