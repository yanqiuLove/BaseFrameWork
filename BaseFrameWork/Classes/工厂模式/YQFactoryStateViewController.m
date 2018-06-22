//
//  YQFactoryStateViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/7.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFactoryStateViewController.h"
#import "YQYunSuanFu.h"
#import "YQJiaFa.h"

@interface YQFactoryStateViewController ()

@property(nonatomic,strong) id<YQJiSuanQi>YunSuanFu;

@end

@implementation YQFactoryStateViewController

//首先需要定义一个协议，就是需要各个工厂类完成的共同方法  直接调用得到结果的方法，定义两个属性，接收传入的两个数
//需要一个工厂管理的类，这里是YQYunSuanFu类，通过运算符的不同，调用不同子类工厂的运算方法
//分别定义四种运算的子类，加减乘除  分别实现各自的运算过程
//控制器中调用就是根据工厂管理类类创建实际需要的子类去完成相应的计算过程
//控制器中需要一个遵守协议的对象，这个对象实际类型需要根据运算符动态创建，具体的创建过程就是通过YQYunSuanFu类调用自己的方法，传入类型，这个方法里实现的就是返回一个遵守协议的对象，然后再给返回的对象进行赋值，最后调用协议中的方法，实现最后的结果运算。


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.YunSuanFu = [YQYunSuanFu withType:YunSuanFu_jian];
    self.YunSuanFu.numberA = 5.00;
    self.YunSuanFu.numberB = 3.00;
    CGFloat jieguo = [self.YunSuanFu jiSuanJieGuo];
    NSLog(@"%f",jieguo);
    
    YQJiaFa *jiafa = [[YQJiaFa alloc]init];
    jiafa.numberA = 4;
    jiafa.numberB = 5;
    NSLog(@"%f",[jiafa jiSuanJieGuo]);
    
}

@end
