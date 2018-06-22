//
//  VideoPlayView.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/18.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPlayView : UIView

- (void)initWithVideoUrl:(NSString *)urlString;
- (void)initWithVideoPath:(NSString *)videoPath;
- (void)pause;
- (void)play;

@end
