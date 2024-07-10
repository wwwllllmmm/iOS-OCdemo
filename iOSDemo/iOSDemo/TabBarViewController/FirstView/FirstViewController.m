//
//  TabView.m
//  iOSDemo
//
//  Created by ByteDance on 7/8/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "FirstViewController.h"
#import "Recommand/RecommandCollectionViewCell.h"
#import "MallView/MallViewCollectionViewCell.h"

@interface FirstViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *buttonCollectionView;
@property (nonatomic, strong) UICollectionView *contentCollectionView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) NSIndexPath *initialIndexPath;

@property (nonatomic, strong) NSArray<NSArray<NSURL *> *> *videoURLGroups;

@end


@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.titles = @[@"图文", @"已关注", @"商城", @"推荐"];
        
    [self setupButtonCollectionView];
    [self setupContentCollectionView];
    [self setupIndicatorView];
    self.initialIndexPath = [NSIndexPath indexPathForItem:3 inSection:0];
    
    self.videoURLGroups = @[
            @[
                [NSURL URLWithString:@"https://www.youtube.com/watch?v=nprLhDi297w"],
                [NSURL URLWithString:@"https://www.youtube.com/watch?v=nprLhDi297w"]
            ],
            @[
                [NSURL URLWithString:@"https://www.youtube.com/watch?v=FwNLo_kAUZA"],
                [NSURL URLWithString:@"https://www.youtube.com/watch?v=FwNLo_kAUZA"]
            ],
            // 添加更多视频URL数组
        ];
    
    
}

- (void)setupButtonCollectionView {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    self.buttonCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 50) collectionViewLayout:layout];
    self.buttonCollectionView.delegate = self;
    self.buttonCollectionView.dataSource = self;
    [self.buttonCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ButtonCell"];
    [self.buttonCollectionView selectItemAtIndexPath:self.initialIndexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];

    [self.view addSubview:self.buttonCollectionView];
}

- (void)setupContentCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    CGFloat yOffset = CGRectGetMaxY(self.buttonCollectionView.frame) ;
    self.contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, yOffset, self.view.bounds.size.width, self.view.bounds.size.height - yOffset) collectionViewLayout:layout];
    self.contentCollectionView.backgroundColor = [UIColor whiteColor];
    self.contentCollectionView.pagingEnabled = YES;
    self.contentCollectionView.delegate = self;
    self.contentCollectionView.dataSource = self;

    [self.contentCollectionView registerClass:[RecommandCollectionViewCell class] forCellWithReuseIdentifier:@"RecommandCell"];
    [self.contentCollectionView registerClass:[MallViewCollectionViewCell class] forCellWithReuseIdentifier:@"MallCell"];
    [self.contentCollectionView scrollToItemAtIndexPath:self.initialIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

    [self.view addSubview:self.contentCollectionView];
}

- (void)setupIndicatorView {
    CGFloat buttonWidth = self.view.bounds.size.width / self.titles.count ;
    self.indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 128, buttonWidth, 2)];
    self.indicatorView.backgroundColor = [UIColor blackColor];
    [self updateIndicatorViewForIndex: 3];
    [self.view addSubview:self.indicatorView];
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.buttonCollectionView) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ButtonCell" forIndexPath:indexPath];
        
        UILabel *label = (UILabel *)[cell viewWithTag:100];
        if (!label) {
            label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor blackColor];
            label.tag = 100;
            [cell.contentView addSubview:label];
        }
        label.text = self.titles[indexPath.item];
        
        return cell;
    } else {
        if (indexPath.item % 2 == 0) {
            MallViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MallCell" forIndexPath:indexPath];
            
            return cell;
        } else {
            RecommandCollectionViewCell *rcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommandCell" forIndexPath:indexPath];
            NSArray<NSURL *> *videoURLs = self.videoURLGroups[indexPath.item];
            [rcell configureWithVideoURLs:videoURLs];
            return rcell;
        }
    }
}

#pragma mark - UICollectionView DelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.buttonCollectionView) {
        return CGSizeMake(self.view.bounds.size.width / self.titles.count, 50);
    } else {
        return CGSizeMake(self.view.bounds.size.width, collectionView.bounds.size.height);
    }
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.buttonCollectionView) {
        
        [self.contentCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        [self updateIndicatorViewForIndex:indexPath.item];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.contentCollectionView) {
        NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
        [self updateIndicatorViewForIndex:index];
        [self.buttonCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.contentCollectionView) {
        CGFloat buttonWidth = self.view.bounds.size.width / self.titles.count;
        CGFloat offsetX = scrollView.contentOffset.x / scrollView.contentSize.width * self.buttonCollectionView.contentSize.width;
        self.indicatorView.frame = CGRectMake(offsetX, self.indicatorView.frame.origin.y, buttonWidth, self.indicatorView.frame.size.height);
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (scrollView == self.contentCollectionView) {
        NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
        [self updateIndicatorViewForIndex:index];
        [self.buttonCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    }
}

- (void)updateIndicatorViewForIndex:(NSInteger)index {
    CGFloat buttonWidth = self.view.bounds.size.width / self.titles.count;
    CGFloat newX = index * buttonWidth;

        // 获取指示器的当前frame
        CGRect currentFrame = self.indicatorView.frame;

        [UIView animateWithDuration:0.25 animations:^{
            CGRect updatedFrame = currentFrame;
            updatedFrame.origin.x = newX;
            updatedFrame.size.width = buttonWidth;
            self.indicatorView.frame = updatedFrame;
        }];
}

@end
