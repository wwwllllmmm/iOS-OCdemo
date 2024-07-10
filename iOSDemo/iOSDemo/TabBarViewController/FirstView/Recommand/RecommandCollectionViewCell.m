//
//  RecommandViewController.m
//  iOSDemo
//
//  Created by ByteDance on 7/9/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "RecommandCollectionViewCell.h"
#import "VideoCollectionViewCell.h"

@interface RecommandCollectionViewCell () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray<NSURL *> *videoURLs;
@property (nonatomic, strong) NSIndexPath *currentPlayingIndexPath;
@end

@implementation RecommandCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
        if (self) {
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;

            self.collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
            self.collectionView.dataSource = self;
            self.collectionView.delegate = self;
            self.collectionView.pagingEnabled = YES;
            self.collectionView.showsVerticalScrollIndicator = NO;
            [self.collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"VideoCollectionViewCell"];
            self.collectionView.backgroundColor = [UIColor blackColor];

            [self.contentView addSubview:self.collectionView];
        }
        return self;
}

- (void)configureWithVideoURLs:(NSArray<NSURL *> *)videoURLs {
    self.videoURLs = videoURLs;
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointZero animated:NO];
    self.currentPlayingIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.videoURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCollectionViewCell" forIndexPath:indexPath];
    NSURL *videoURL = self.videoURLs[indexPath.item];
    [cell configureWithURL:videoURL];
    if (!self.currentPlayingIndexPath || self.currentPlayingIndexPath.item == indexPath.item) {
        [cell.player play];
        self.currentPlayingIndexPath = indexPath;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.contentView.bounds.size;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSArray *visibleCells = [self.collectionView visibleCells];
    if (visibleCells.count == 1) {
        VideoCollectionViewCell *cell = (VideoCollectionViewCell *)visibleCells.firstObject;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        if (indexPath && indexPath.item != self.currentPlayingIndexPath.item) {
            [cell.player play];
            self.currentPlayingIndexPath = indexPath;
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.currentPlayingIndexPath) {
        VideoCollectionViewCell *currentCell = (VideoCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:self.currentPlayingIndexPath];
        [currentCell.player pause];
    }
}

@end
