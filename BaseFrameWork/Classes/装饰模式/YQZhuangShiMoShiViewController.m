//
//  YQZhuangShiMoShiViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQZhuangShiMoShiViewController.h"
#import "YQPerson.h"
#import "YQZhuangShi.h"
#import "YQShangYi.h"
#import "YQXiaYi.h"

@interface YQZhuangShiMoShiViewController ()

@end

@implementation YQZhuangShiMoShiViewController

//被装饰者人类 也就是原始对象  有一个装饰自己的方法
//定义一个装饰类，继承人类  有了人类装饰自己的方法，然后装饰类中定义一个人类对象，在调用装饰人类的方法
//定义多个装饰类，都继承与装饰类，每个装饰类完成一种对原始对象的装饰  即实现装饰人类的方法即可
//实现装饰人类的方法主要是通过在控制器中给装饰类中的人类对象属性赋值  在装饰类中实现的装饰方法中判断装饰类中的人类对象是否有值  有的话就直接调用自己的装饰方法，是谁实例化的人类  就调用谁的装饰方法


- (void)viewDidLoad {
    [super viewDidLoad];
    //首先创建一个被装饰者对象
    YQPerson *person = [[YQPerson alloc]init];
    
    YQShangYi *shangyi = [[YQShangYi alloc]init];
    shangyi.person = person;
    [shangyi operation];
    
    YQXiaYi *xiayi = [[YQXiaYi alloc]init];
    xiayi.person = person;
    [xiayi operation];
    
    
}


@end
