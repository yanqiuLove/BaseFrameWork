//
//  YQZhuangShi.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/15.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//  装饰类  装饰人类  继承人类

#import "YQPerson.h"

@interface YQZhuangShi : YQPerson

//装饰对象需要装饰的原始对象
@property(nonatomic, strong)YQPerson *person;

@end
