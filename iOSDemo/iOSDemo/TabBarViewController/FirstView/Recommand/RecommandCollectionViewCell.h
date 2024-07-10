//
//  RecommandViewController.h
//  iOSDemo
//
//  Created by ByteDance on 7/9/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommandCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UICollectionView *collectionView;

- (void)configureWithVideoURLs:(NSArray<NSURL *> *)videoURLs;

@end
