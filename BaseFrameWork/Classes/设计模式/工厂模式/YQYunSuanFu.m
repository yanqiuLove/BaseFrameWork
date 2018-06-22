//
//  YQYunSuanFu.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/13.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQYunSuanFu.h"
#import "YQJiaFa.h"
#import "YQJianFa.h"

@implementation YQYunSuanFu

+ (id<YQJiSuanQi>)withType:(YunSuanFu)yunSuanFu {
    if (yunSuanFu == YunSuanFu_jia) {
        YQJiaFa *jiafa = [[YQJiaFa alloc]init];
        return jiafa;
    }else if (YunSuanFu_jian) {
        YQJianFa *jianfa = [[YQJianFa alloc]init];
        return jianfa;
    }
}

@end
