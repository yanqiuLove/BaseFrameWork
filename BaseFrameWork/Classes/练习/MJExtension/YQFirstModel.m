//
//  YQFirstModel.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFirstModel.h"
#import "YQSecondModel.h"
#import "YQFourthModel.h"

@implementation YQFirstModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"statuses":@"YQSecondModel",@"ads":@"YQFourthModel"};
}

@end
