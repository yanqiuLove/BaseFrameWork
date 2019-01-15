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
    /** 如果公共的代理方法中有需要用到的参数回调，可以使用在不中状态下定义各自的block  通过block将控制器用到的数据传递给manager 再通过manager定义的代理传递到控制器 即所有交互都通过manager */
    
    YQZhuangTaiManager *manager = [[YQZhuangTaiManager alloc]init];
    manager.type = ZhuangTaiType_first;
    [manager firstThingTodo];
    [manager secondThingTodo];
    
    
    
}

@end
