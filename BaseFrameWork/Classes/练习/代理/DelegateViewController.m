//
//  DelegateViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "DelegateViewController.h"
#import "Man.h"
#import "Woman.h"
#import "YQCat.h"
#import "YQDog.h"
@interface DelegateViewController ()

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 60, 80, 30)];
    titleLabel.text = @"代理";
    [self.view addSubview:titleLabel];
    
    Man *man = [[Man alloc]init];
    Woman *woman = [[Woman alloc]init];
    man.delegate = woman;
    [man eatFood];
    
    YQCat *cat = [[YQCat alloc]init];
    YQDog *dog = [[YQDog alloc]init];
    cat.delegate = dog;
    [cat healpMe];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
