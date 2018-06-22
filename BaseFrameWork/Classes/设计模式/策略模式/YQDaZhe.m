//
//  YQDaZhe.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQDaZhe.h"

@interface YQDaZhe ()

@property(nonatomic,assign) CGFloat moneyRebate;

@end


@implementation YQDaZhe

@synthesize allPrice = _allPrice;
@synthesize zhekou = _zhekou;

//这个方法是在打折类初始化的时候  就带有一个自身的折扣利率
- (instancetype)initWithMoneyRebate:(CGFloat)moneyRebate {
    if (self = [super init]) {
        _moneyRebate = moneyRebate;
    }
    return self;
}


- (CGFloat)resultMoney {
    NSLog(@"打折");
    return self.allPrice * self.zhekou;
}

-(CGFloat)acceptCash:(CGFloat)cash{
    return self.moneyRebate * cash;
}

@end
