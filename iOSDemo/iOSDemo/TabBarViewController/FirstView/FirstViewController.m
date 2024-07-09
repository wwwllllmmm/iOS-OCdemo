//
//  TabView.m
//  iOSDemo
//
//  Created by ByteDance on 7/8/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "FirstViewController.h"
#import "Recommand/RecommandViewController.h"
#import "MallView/MallViewController.h"

@interface FirstViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *buttonCollectionView;
@property (nonatomic, strong) UICollectionView *contentCollectionView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIView *indicatorView;

@end


@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.titles = @[@"图文", @"已关注", @"商城", @"推荐"];
        
    [self setupButtonCollectionView];
    [self setupContentCollectionView];
    [self setupIndicatorView];
}

- (void)setupButtonCollectionView {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    self.buttonCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 50) collectionViewLayout:layout];
//    self.buttonCollectionView.backgroundColor = [UIColor redColor];
    self.buttonCollectionView.delegate = self;
    self.buttonCollectionView.dataSource = self;
    self.buttonCollectionView.showsHorizontalScrollIndicator = NO;
    [self.buttonCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ButtonCell"];
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
    [self.contentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ContentCell"];
    [self.view addSubview:self.contentCollectionView];
}

- (void)setupIndicatorView {
    CGFloat buttonWidth = self.view.bounds.size.width / self.titles.count;
    self.indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 98, buttonWidth, 2)];
    self.indicatorView.backgroundColor = [UIColor blackColor];
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
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ContentCell" forIndexPath:indexPath];
        
        UILabel *label = (UILabel *)[cell viewWithTag:100];
        if (!label) {
            label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor blackColor];
            label.tag = 100;
            [cell.contentView addSubview:label];
        }
        label.text = [NSString stringWithFormat:@"Page %ld", indexPath.item + 1];
        
        return cell;
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
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.frame = CGRectMake(index * buttonWidth, self.indicatorView.frame.origin.y, buttonWidth, self.indicatorView.frame.size.height);
    }];
}

@end
