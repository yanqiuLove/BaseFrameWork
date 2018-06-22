//
//  YQQuestionModel.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/10.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQQuestionModel.h"
#import "YQOptionModel.h"

@implementation YQQuestionModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"optionArray":@"YQOptionModel"};
}

@end
