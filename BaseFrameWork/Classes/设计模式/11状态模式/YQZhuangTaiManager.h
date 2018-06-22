//
//  YQZhuangTaiManager.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YQZhuangTaiProtocol.h"

typedef NS_ENUM(NSInteger, ZhuangTaiType) {
    ZhuangTaiType_first,
    ZhuangTaiType_second
};


@interface YQZhuangTaiManager : NSObject

@property(nonatomic,strong) id<YQZhuangTaiProtocol>zhuangTai;
@property(nonatomic,assign) ZhuangTaiType type;

- (void)firstThingTodo;
- (void)secondThingTodo;

@end

















































