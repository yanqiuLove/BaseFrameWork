//
//  YQ12306ViewController.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/5/17.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQ12306ViewController.h"
#import "YQTitleView.h"

@interface YQ12306ViewController ()

@property(nonatomic,strong) YQTitleView *titleView;


@end

@implementation YQ12306ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleView = [[YQTitleView alloc]initWithFrame:CGRectMake(0, 100, Kwidth, 60)];
    self.titleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.titleView];
    
}


@end
