//
//  VideoCollectionViewCell.m
//  iOSDemo
//
//  Created by ByteDance on 7/10/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "VideoCollectionViewCell.h"


@implementation VideoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.frame = self.contentView.bounds;
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.contentView.layer addSublayer:self.playerLayer];
    }
    return self;
}

- (void)configureWithURL:(NSURL *)url {
    self.player = [AVPlayer playerWithURL:url];
    self.playerLayer.player = self.player;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.playerLayer.frame = self.contentView.bounds;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.player pause];
    self.player = nil;
    self.playerLayer.player = nil;
}

@end
