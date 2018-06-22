//
//  GuideViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "GuideViewController.h"
#import "YQGuideView.h"
#import <SDCycleScrollView.h>

@interface GuideViewController ()

/** 图片数组 */
@property(nonatomic,strong)NSMutableArray *imageArray;

@end

@implementation GuideViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageArray = [NSMutableArray array];
    YQGuideView *guideView = [[YQGuideView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight)];
    for (NSInteger i = 1; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"guide_%ld",i]];
        [self.imageArray addObject:image];
    }
    [guideView initWithGuideImageArray:self.imageArray pageControlStyle:pageControlStyleHavePageControl  selectedColor:[UIColor blueColor] noSelectedColor:[UIColor orangeColor]];
    [self.view addSubview:guideView];
    
    
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Kwidth, Kheight) imagesGroup:self.imageArray];
//    [self.view addSubview:cycleScrollView];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
