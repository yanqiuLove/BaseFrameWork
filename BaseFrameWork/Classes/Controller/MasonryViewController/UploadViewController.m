//
//  UploadViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/18.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "UploadViewController.h"
#import "VideoPlayView.h"
#import <AVFoundation/AVFoundation.h>

@interface UploadViewController ()

/** 播放视频 */
@property(nonatomic,strong)VideoPlayView *videoPlayView;

/** 占位图片 */
@property(nonatomic,strong)UIImageView *placeImageView;

/** 录制 */
@property(nonatomic,strong)UIButton *luzhiButton;

/** 上传 */
@property(nonatomic,strong)UIButton *uploadButton;

/** 说明webView */
@property(nonatomic,strong)UIView *contentWebView;


@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addView];
    [self addMasonry];
    
}

/** 获取视频第一帧图片 */
- (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
    if(!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
    UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
    return thumbnailImage;
}


- (void)addView{
    [self.view addSubview:self.videoPlayView];
    [self.view addSubview:self.placeImageView];
    [self.view addSubview:self.luzhiButton];
    [self.view addSubview:self.uploadButton];
    [self.view addSubview:self.contentWebView];
    
}
- (void)addMasonry {
    [self.placeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(78);
        make.left.mas_equalTo(self.view).mas_offset(15);
        make.right.mas_equalTo(self.view).mas_offset(-15);
        make.size.mas_equalTo(CGSizeMake(345, 200));
    }];
    
    [self.luzhiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(298);
        make.left.mas_equalTo(self.view).mas_offset(15);
        make.right.mas_equalTo(self.view).mas_offset(-202);
        make.height.mas_equalTo(35);
    }];
}
#pragma mark - lazy
- (VideoPlayView *)videoPlayView {
    if (_videoPlayView == nil) {
        _videoPlayView = [[VideoPlayView alloc]init];
    }
    return _videoPlayView;
}
- (UIImageView *)placeImageView {
    if (_placeImageView == nil) {
        _placeImageView = [[UIImageView alloc]init];
        _placeImageView.image = [UIImage imageNamed:@"NVideo"];
    }
    return _placeImageView;
}
- (UIButton *)luzhiButton {
    if (_luzhiButton == nil) {
        _luzhiButton = [[UIButton alloc]init];
        [_luzhiButton setTitle:@"录制视频" forState:UIControlStateNormal];
        [_luzhiButton setTitleColor:[UIColor colorWithHexString:@"#468AFF"] forState:UIControlStateNormal];
        _luzhiButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _luzhiButton.layer.masksToBounds = YES;
        _luzhiButton.layer.cornerRadius = 18;
        _luzhiButton.layer.borderColor = [UIColor colorWithHexString:@"#468AFF"].CGColor;
        _luzhiButton.layer.borderWidth = 1;
    }
    return _luzhiButton;
}
- (UIButton *)uploadButton {
    if (_uploadButton == nil) {
        _uploadButton = [[UIButton alloc]init];
        _uploadButton.layer.masksToBounds = YES;
        _uploadButton.layer.cornerRadius = 18;
        [_uploadButton setTitle:@"上传视频" forState:UIControlStateNormal];
    }
    return _uploadButton;
}
- (UIView *)contentWebView {
    if (_contentWebView == nil) {
        _contentWebView = [[UIView alloc]init];
    }
    return _contentWebView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
