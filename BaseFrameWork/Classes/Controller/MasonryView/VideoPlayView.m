//
//  VideoPlayView.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/18.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "VideoPlayView.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


@interface VideoPlayView ()

/** 播放器的view */
@property(nonatomic,strong) AVPlayerViewController *avplayview;

@end

@implementation VideoPlayView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.avplayview.view];
        [self addmasonary];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.avplayview.view.frame =CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}
- (void)addmasonary {
    
}
- (AVPlayerViewController *)avplayview {
    if (_avplayview == nil) {
        _avplayview =[[AVPlayerViewController alloc] init];
        // 设置视频显示比例
        _avplayview.videoGravity = AVLayerVideoGravityResizeAspect;
        // 是否显示视频播放控件
        _avplayview.showsPlaybackControls = YES;
        // 不支持画中画
        _avplayview.allowsPictureInPicturePlayback = NO;
    }
    return _avplayview;
}

- (void)initWithVideoUrl:(NSString *)urlString {
    self.avplayview.player = [AVPlayer playerWithURL:[NSURL URLWithString:urlString]];
}
- (void)initWithVideoPath:(NSString *)videoPath {
    NSURL *sourceMovieUrl = [NSURL fileURLWithPath:videoPath];
    AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:sourceMovieUrl options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
    self.avplayview.player = [AVPlayer playerWithPlayerItem:playerItem];
}
- (void)play {
    [self.avplayview.player play];
}
- (void)pause {
    [self.avplayview.player pause];
}
@end
