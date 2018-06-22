//
//  YQCarModel.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/24.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQCarModel.h"

@implementation YQCarModel


+ (instancetype)carName:(NSString *)carName carIcon:(NSString *)icon {
    YQCarModel *carModel = [[YQCarModel alloc]init];
    carModel.carName = carName;
    carModel.carIcon = icon;
    return carModel;
}

@end
