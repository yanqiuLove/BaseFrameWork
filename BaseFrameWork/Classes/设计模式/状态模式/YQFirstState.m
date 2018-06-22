//
//  YQFirstState.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/27.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFirstState.h"

@implementation YQFirstState

- (void)needToDoFirstThing {
    NSLog(@"设置的状态是第一种状态，第一种状态执行了共同事件中的第一件事儿");
}

- (void)needToDoSecondThingWithName:(NSString *)name {
    NSLog(@"根据管理者传入的字符串做出自己相对应的操作，第一种状态输出++%@",name);
}

@end
