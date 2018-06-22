//
//  YQGrouapModel.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/24.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQGrouapModel.h"
#import "YQCarModel.h"

@implementation YQGrouapModel

+ (NSArray *)getData {
    YQGrouapModel *grouapModel0 = [[YQGrouapModel alloc]init];
    grouapModel0.headerName = @"第一组头";
    grouapModel0.footerName = @"第一组脚";
    grouapModel0.carsArray = @[
                               [YQCarModel carName:@"一" carIcon:@"app_logo"],
                               [YQCarModel carName:@"二" carIcon:@"app_logo"],
                               [YQCarModel carName:@"三" carIcon:@"app_logo"]
                               ];
    NSArray *array = @[grouapModel0];
    return array;
}


@end
