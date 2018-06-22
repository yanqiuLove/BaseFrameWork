//
//  YQFactoryMoney.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//  促销方式的制造工厂

#import <Foundation/Foundation.h>
#import "YQShouFei.h"

typedef NS_ENUM(NSInteger, MoneyType) {
    MoneyType_yuanjia,
    MoneyType_dazhe,
    MoneyType_fanli
};


@interface YQFactoryMoney : NSObject

+ (id<YQShouFei>)factoryWithType:(MoneyType)type;

- (instancetype)initWithCashSuper:(id<YQShouFei>)cashSuper;
- (instancetype)initWithCashType:(MoneyType)type;
- (CGFloat)getResult:(CGFloat)money;

@end
