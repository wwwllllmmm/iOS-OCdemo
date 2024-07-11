//
//  VideoCollectionViewCell.m
//  iOSDemo
//
//  Created by ByteDance on 7/10/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import "VideoTableViewCell.h"

@implementation VideoTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self setupPlayer];
    }
    return self;
}

- (void)setupPlayer {
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"demo.mov" ofType:nil];
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
    AVPlayerItem *avplayerItem = [[AVPlayerItem alloc] initWithURL:videoURL];
   
    self.player = [[AVPlayer alloc] initWithPlayerItem:avplayerItem];
    
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    AVPlayerLayer *playLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playLayer.frame = frame;
    [self.contentView.layer addSublayer:playLayer];
    [self.player play];
}

@end
