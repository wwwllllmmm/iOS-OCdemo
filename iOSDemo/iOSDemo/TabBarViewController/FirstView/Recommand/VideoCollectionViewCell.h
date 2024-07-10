//
//  VideoCollectionViewCell.h
//  iOSDemo
//
//  Created by ByteDance on 7/10/24.
//  Copyright © 2024 aaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

- (void)configureWithURL:(NSURL *)url;

@end
