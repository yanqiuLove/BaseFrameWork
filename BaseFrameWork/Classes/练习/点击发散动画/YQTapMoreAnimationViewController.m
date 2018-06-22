//
//  YQTapMoreAnimationViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/8.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQTapMoreAnimationViewController.h"
#import "DCPathButton.h"

@interface YQTapMoreAnimationViewController ()<DCPathButtonDelegate>

@property (nonatomic , strong) DCPathButton *pathAnimationView;

@end

@implementation YQTapMoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"测试动画";
    [self ConfigureDCPathButton];
}
- (void)ConfigureDCPathButton
{
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                           hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    
    _pathAnimationView = dcPathButton;
    dcPathButton.delegate = self;
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3]];
    [self.view addSubview:dcPathButton];
    
}

#pragma mark - DCPathButton Delegate

- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
    NSLog(@"You tap at index : %ld", index);
}

@end
