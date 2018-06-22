//
//  YQTextModel.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/11.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQTextModel.h"
#import "YQQuestionModel.h"

@implementation YQTextModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"questionArray":@"YQQuestionModel"};
}

@end
