//
//  PlayVideoViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/18.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "PlayVideoViewController.h"
#import "VideoPlayView.h"

@interface PlayVideoViewController ()

@end

@implementation PlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    VideoPlayView *playView = [[VideoPlayView alloc]initWithFrame:CGRectMake(0, 60, Kwidth, 300)];
    [self.view addSubview:playView];
    [playView initWithVideoUrl:@"http://pic.qiantucdn.com/58pic/shipin/17/09/84/17098445.mp4"];
    [playView play];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
