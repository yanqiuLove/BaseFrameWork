//
//  YQStateManager.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/27.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//  这里定义的是多种状态下需要做的相同的一件事儿   比如：根据是否是会员的状态来处理登录的逻辑

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YQStateDelegate.h"


@interface YQStateManager : NSObject

//状态属性，是任意类型，但是必须遵守协议，遵守协议之后可以根据状态的不同来完成协议里边的事情
@property(nonatomic,strong) id<YQStateDelegate>state;

+ (instancetype)statusManger;

/** 需要做的第一件事儿 */
- (void)needToDoFirstThing;

- (void)needToDoSecondThingWithName:(NSString *)name;

@end
