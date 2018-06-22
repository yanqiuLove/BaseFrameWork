//
//  YQStateDelegate.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/27.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YQStateManager;


@protocol YQStateDelegate <NSObject>

/** 完成的第一件事儿  不需要参数 */
- (void)needToDoFirstThing;

/** 完成第二种事儿  可以传入一个参数 */
- (void)needToDoSecondThingWithName:(NSString *)name;

@end
