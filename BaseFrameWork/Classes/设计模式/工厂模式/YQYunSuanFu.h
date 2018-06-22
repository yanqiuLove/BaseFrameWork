//
//  YQYunSuanFu.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/13.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//  是计算器的运算方法工厂类

#import <Foundation/Foundation.h>
#import "YQJiSuanQi.h"


typedef NS_ENUM(NSInteger, YunSuanFu) {
    YunSuanFu_jia,
    YunSuanFu_jian
};

@interface YQYunSuanFu : NSObject

+ (id<YQJiSuanQi>)withType:(YunSuanFu)yunSuanFu;


@end
