//
//  RecommandViewController.m
//  iOSDemo
//
//  Created by ByteDance on 7/9/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "RecommandCollectionViewCell.h"
#import "VideoTableViewCell.h"

@interface RecommandCollectionViewCell () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSURL *> *videoURLs;

@end

@implementation RecommandCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
        if (self) {
            self.recommandTableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
            self.recommandTableView.dataSource = self;
            self.recommandTableView.delegate = self;
            [self.contentView addSubview:self.recommandTableView];
                    
            [self.recommandTableView registerClass:[VideoTableViewCell class] forCellReuseIdentifier:@"VideoTableCell"];
        }
        return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoTableCell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200; // 设置cell的高度
}

@end

