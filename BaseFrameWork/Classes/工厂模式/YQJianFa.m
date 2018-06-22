//
//  YQJianFa.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/13.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQJianFa.h"

@implementation YQJianFa

@synthesize numberA = _numberA;
@synthesize numberB = _numberB;

- (CGFloat)jiSuanJieGuo {
    return self.numberA - self.numberB;
}

@end
