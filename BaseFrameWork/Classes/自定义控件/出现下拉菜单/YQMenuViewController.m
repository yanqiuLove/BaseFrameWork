//
//  YQMenuViewController.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/6/22.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQMenuViewController.h"
#import "YQMenuView.h"


@interface YQMenuViewController ()

@end

@implementation YQMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 100)];
    contentView.backgroundColor = [UIColor yellowColor];
    UIView *inView = [[UIView alloc]initWithFrame:CGRectMake(60, 200, 80, 30)];
    inView.backgroundColor = [UIColor redColor];
    [self.view addSubview:inView];
    
    [YQMenuView popFrom:inView content:contentView dismiss:^{
        
    }];
    
}



@end
