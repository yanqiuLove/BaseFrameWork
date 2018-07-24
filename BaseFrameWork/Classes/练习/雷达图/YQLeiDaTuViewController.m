//
//  YQLeiDaTuViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2018/1/3.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQLeiDaTuViewController.h"
#import "RadarMapView.h"
#import "RaderMapCompleteView.h"
#import "TEEEEE.h"
#import "TYYYYYYY.h"

@interface YQLeiDaTuViewController ()

@end

@implementation YQLeiDaTuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"雷达图";
    
    [TEEEEE clearTable];
    [TEEEEE testUrl];
    
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 200, 100, 100)];
    [self.view addSubview:imageView];
    
//    TEEEEE *te = [[TEEEEE findAll] firstObject];
    
    TYYYYYYY *ty = [[TYYYYYYY findAll] firstObject];
    imageView.image = ty.image;
    
    
    
    

    ElementItem *item1 = [[ElementItem alloc]init];
    item1.itemPercent = @[@"0.1",@"0.2",@"0.3",@"0.4",@"0.5",@"0.4"];
//    item1.itemPercent = @[@"0.5",@"0.6",@"0.8",@"0.4",@"0.2",@"0.1"];
    item1.itemColor = [UIColor redColor];
    item1.itemName = @"基础综合";
    ElementItem *item2 = [[ElementItem alloc]init];
//    item2.itemPercent = @[@"0.3",@"0.4",@"0.5"];
    item2.itemPercent = @[@"1",@"0",@"0",@"0",@"0",@"0"];
//    item2.itemPercent = @[@"0.3",@"0.4",@"0.5",@"0.7",@"0.6",@"0.2"];
    item2.itemColor = [UIColor greenColor];
    item2.itemName = @"专业综合";
    ElementItem *item3 = [[ElementItem alloc]init];
//    item3.itemPercent = @[@"0.7",@"0.4",@"0.6"];
//    item3.itemColor = [UIColor yellowColor];
    item3.itemName = @"实践综合";

    //,@"平均得分",@"错误率",@"准确率"
    RaderMapCompleteView *radar = [[RaderMapCompleteView alloc]initWithRadarElements:@[@"考试次数",@"考试难度",@"练习次数",@"考试次数",@"考试难度",@"练习次数"] lengthColor:[UIColor colorWithRed:168.0/255.0 green:168.0/255.0 blue:168.0/255.0 alpha:1]];
    radar.frame =CGRectMake(0, 65, Kwidth, 400);
    radar.content = @"能力测评能力测评能力测评能力测评能力测评能力测评能力测评能力测评";

//    [radar addAbilitysWithElements:@[item1,item2,item3]];
//    [radar addAbilitysWithElements:@[item1]];
    [radar addAbilitysWithElements:@[item1,item2]];
    [self.view addSubview:radar];
    
}


@end
