//
//  YQZhuangTaiMoshiViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQZhuangTaiMoshiViewController.h"
#import "YQZhuangTaiProtocol.h"
#import "YQZhuangTaiManager.h"

@interface YQZhuangTaiMoshiViewController ()

@end

@implementation YQZhuangTaiMoshiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YQZhuangTaiManager *manager = [[YQZhuangTaiManager alloc]init];
    manager.type = ZhuangTaiType_first;
    [manager firstThingTodo];
    [manager secondThingTodo];
    
    
    
}

@end
