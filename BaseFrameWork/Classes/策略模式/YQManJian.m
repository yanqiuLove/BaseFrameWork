//
//  YQManJian.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQManJian.h"

@interface YQManJian ()

@property(nonatomic,assign) CGFloat moneyReturn;

@end


@implementation YQManJian

@synthesize allPrice = _allPrice;
@synthesize zhekou = _zhekou;


//满减  在初始化的时候就有一个满减金额
- (instancetype)initWithMoneyReturn:(CGFloat)moneyReturn {
    if (self = [super init]) {
        _moneyReturn = moneyReturn;
    }
    return self;
}

- (CGFloat)resultMoney {
    NSLog(@"满减");
    return self.allPrice - self.zhekou;
}

-(CGFloat)acceptCash:(CGFloat)cash{
    return cash - self.moneyReturn;
}


@end
