//
//  YQMoBanMoShiViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/15.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQMoBanMoShiViewController.h"
#import "YQMoBanSuper.h"
#import "YQCopyA.h"
#import "YQCopyB.h"


@interface YQMoBanMoShiViewController ()


@end

//创建一个模板类 和 两个复制品  都是继承于模板类
//统一使用模板类创建只不过初始化用子类初始化，这样就是父类对象的指针指向了子类  实际还是子类的实现 这样就少写了重复的代码

@implementation YQMoBanMoShiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YQMoBanSuper *mobanA = [[YQCopyA alloc]init];
    [mobanA testQuestion1];
    [mobanA testQuestion2];
    
    
    
    YQMoBanSuper *mobanB = [[YQCopyB alloc]init];
    [mobanB testQuestion1];
    [mobanB testQuestion2];
    
    
    
    
}


@end
