//
//  YQZhuangTaiManager.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQZhuangTaiManager.h"
#import "YQZhuangTaiOne.h"
#import "YQZhuangTaiTow.h"

@implementation YQZhuangTaiManager

- (void)setType:(ZhuangTaiType)type {
    _type = type;
    if (_type == ZhuangTaiType_first) {
        self.zhuangTai = [[YQZhuangTaiOne alloc]init];
    }else if (_type == ZhuangTaiType_second) {
        self.zhuangTai = [[YQZhuangTaiTow alloc]init];
    }
}


- (void)firstThingTodo {
    
    [self.zhuangTai firstThing];
}

- (void)secondThingTodo {
    [self.zhuangTai secondThing];
}

@end
