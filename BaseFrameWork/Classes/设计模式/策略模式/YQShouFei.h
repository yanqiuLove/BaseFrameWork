//
//  YQShouFei.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/14.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YQShouFei <NSObject>

@property(nonatomic,assign) CGFloat allPrice;
@property(nonatomic,assign) CGFloat zhekou;
//需要在控制器中设置对应的属性
- (CGFloat)resultMoney;
//调用方法时设置一个金额
- (CGFloat)acceptCash:(CGFloat)cash;

@end
