//
//  YQCeLueMoShiViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/13.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQCeLueMoShiViewController.h"
#import "YQFactoryMoney.h"
#import "YQShouFei.h"
#import "YQYuanJia.h"
#import "YQDaZhe.h"
#import "YQManJian.h"

@interface YQCeLueMoShiViewController ()

@property(nonatomic,strong)id<YQShouFei>factoryMoney;

@end

@implementation YQCeLueMoShiViewController

//策略模式是建立在工厂模式之上的，同样是需要几个满足不同需求的工厂类，原价、打折、满减等也需要一个管理这些功能单一的工厂类的管理类
//在管理工厂的类中也需要一个遵守协议的对象属性，区别是在工厂管理类中多了几个初始化方法，方法的作用是为了让每个工厂对象创建出来的时候就拥有某些属性
//工厂管理类通过类型动态返回实际工厂类型的方法中，具体的每种工厂类也需要多出一个初始化方法，比如打折的工厂类需要给一个折扣的比例，满减的需要给一个减少的金额，当然都需要一个总价，都是在总价的基础上进行促销的
//除了每个工厂类独自拥有的初始化方法外，还需要都去实现协议中的方法，这个方法里是具体的实现，最终返回一个实际的总价
//大致可以理解为控制器中创建一个遵守协议的工厂管理类对象，让找个管理类对象根据控制器中传入的类型动态去创建具体的工厂类，在动态返回的同时，让每个工厂类先调用自己的初始化方法传入对应的参数，控制器中执行完这些操作的时候就已经获取到了实际工厂类，然后直接让这个属性调用协议中的方法即可实现最终的价格。

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //单纯的工厂模式
    self.factoryMoney = [YQFactoryMoney factoryWithType:MoneyType_dazhe];
//    self.factoryMoney.allPrice = 120;
//    self.factoryMoney.zhekou = 0.3;
//    NSLog(@"1==%.1f",[self.factoryMoney resultMoney]);
    //打折
    YQFactoryMoney *factoryMoney = [[YQFactoryMoney alloc]initWithCashType:MoneyType_dazhe];
    NSLog(@"2==%.1f",[factoryMoney getResult:120]);
    //满减
    YQFactoryMoney *returnMoney = [[YQFactoryMoney alloc]initWithCashType:MoneyType_fanli];
    NSLog(@"3==%.1f",[returnMoney getResult:120]);
    //原价
    YQFactoryMoney *yuanjia = [[YQFactoryMoney alloc]initWithCashType:MoneyType_yuanjia];
    NSLog(@"4==%.1f",[yuanjia getResult:120]);
    
}

@end
