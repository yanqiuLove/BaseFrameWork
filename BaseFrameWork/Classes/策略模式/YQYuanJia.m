//
//  YQYuanJia.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQYuanJia.h"



@implementation YQYuanJia

@synthesize allPrice = _allPrice;
@synthesize zhekou = _zhekou;

- (CGFloat)resultMoney {
    NSLog(@"原价");
    return self.allPrice;
}

- (CGFloat)acceptCash:(CGFloat)cash{
    return cash;
}

@end
