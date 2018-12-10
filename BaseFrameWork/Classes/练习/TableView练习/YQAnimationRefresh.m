//
//  YQAnimationRefresh.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/11/4.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQAnimationRefresh.h"

#define BALLOON_GIF_DURATION 0.15

@interface YQAnimationRefresh ()

@property (strong, nonatomic) UIImageView *stateGIFImageView;
@property (strong, nonatomic) NSMutableDictionary *stateImages;

@end

@implementation YQAnimationRefresh

#pragma mark - 懒加载
- (UIImageView *)stateGIFImageView{
    if (!_stateGIFImageView) {
        _stateGIFImageView = [[UIImageView alloc] init];
        [self addSubview:_stateGIFImageView];
    }
    return _stateGIFImageView;
}

- (NSMutableDictionary *)stateImages {
    if (!_stateImages) {
        self.stateImages = [NSMutableDictionary dictionary];
    }
    return _stateImages;
}




@end
