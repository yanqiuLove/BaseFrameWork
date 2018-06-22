//
//  YQWaiGuanMoShiViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/18.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQWaiGuanMoShiViewController.h"
#import "YQFound.h"

@interface YQWaiGuanMoShiViewController ()

@end

@implementation YQWaiGuanMoShiViewController

//1.统一管理  其中found类知道子类的具体需求  再把客户端的需求交给子类对象去完成 这里不需要继承found  只需继承NSObject即可
//2.如果遇到遗留代码不易维护不易扩展的时候可以考虑使用外观模式，使用一个外观类负责跟老项目进行维护，然后在扩展的时候直接跟外观类进行对接

- (void)viewDidLoad {
    [super viewDidLoad];
    YQFound *found = [[YQFound alloc]init];
    [found mairu];
    [found maichu];
    
}


@end
