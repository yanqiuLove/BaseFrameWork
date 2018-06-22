//
//  YQFactoryMoney.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFactoryMoney.h"
#import "YQYuanJia.h"
#import "YQDaZhe.h"
#import "YQManJian.h"
#import "YQShouFei.h"

@interface YQFactoryMoney ()

@property(nonatomic,strong) id<YQShouFei>cashSuper;

@end

@implementation YQFactoryMoney

- (instancetype)initWithCashSuper:(id<YQShouFei>)cashSuper {
    if (self = [super init]) {
        _cashSuper = cashSuper;
    }
    return self;
}


//根据实际促销活动返回对应的工厂
-(instancetype)initWithCashType:(MoneyType)type {
    if (self = [super init]) {
        if (type == MoneyType_yuanjia) {
            self.cashSuper = [[YQYuanJia alloc]init];
        }else if (type == MoneyType_dazhe) {
            self.cashSuper = [[YQDaZhe alloc]initWithMoneyRebate:0.5];
        }else if (type == MoneyType_fanli) {
            self.cashSuper = [[YQManJian alloc]initWithMoneyReturn:20];
        }
    }
    return self;
}
//
-(CGFloat)getResult:(CGFloat)money {
    return [self.cashSuper acceptCash:money];
}

+ (id<YQShouFei>)factoryWithType:(MoneyType)type {
    if (type == MoneyType_yuanjia) {
        return [[YQYuanJia alloc]init];
    }else if (type == MoneyType_dazhe) {
        return [[YQDaZhe alloc]init];
    }else if (type == MoneyType_fanli) {
        return [[YQManJian alloc]init];
    }else {
        return nil;
    }
}

@end
