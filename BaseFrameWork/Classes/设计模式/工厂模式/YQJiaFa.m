//
//  YQJiaFa.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/13.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQJiaFa.h"

@implementation YQJiaFa

@synthesize numberA = _numberA;
@synthesize numberB = _numberB;

- (CGFloat)jiSuanJieGuo {
    
    CGFloat result = self.numberA + self.numberB;
    return result;
    
}

@end
