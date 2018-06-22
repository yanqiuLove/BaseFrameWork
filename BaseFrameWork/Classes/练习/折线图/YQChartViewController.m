//
//  YQChartViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQChartViewController.h"

@interface YQChartViewController ()

@property(nonatomic,strong) UIButton *button;

@end

@implementation YQChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *textView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 170, 100)];
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 170, 100)];
    
    [self.button setImage:[UIImage imageNamed:@"jiaoShiJiaoXue"] forState:UIControlStateNormal];
    [self.button setImage:[UIImage imageNamed:@"jiaoShiJiaoXue_select"] forState:UIControlStateSelected];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor commonColorWithMainBlueColor] forState:UIControlStateSelected];
    
    [self.button setTitleEdgeInsets:UIEdgeInsetsMake(30, -80, 0, 0)];
    
    [self.button setTitle:@"课堂观察" forState:UIControlStateNormal];
    
    
    UIImageView *testImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    UIImage *lastImage = [UIImage imageNamed:@"1"];
    lastImage = [UIImage imageWithColor:[UIColor cyanColor]];

    testImageView.image = lastImage;
    [self.view addSubview:testImageView];
    
    
    [textView addSubview:self.button];
    [self.view addSubview:textView];
    
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.button.selected = !self.button.selected;
}

@end
