//
//  YQBuilderPersonManager.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//  建造小人的管理者  也算是指挥者  与控制器交互  控制器告诉管理者需要的小人类型  具体分配让管理者分配

#import <Foundation/Foundation.h>
#import "YQBuilderProtocol.h"

typedef NS_ENUM(NSInteger, BuilderPersonType) {
    BuilderPersonType_thin,
    BuilderPersonType_fat
};

@interface YQBuilderPersonManager : NSObject

@property(nonatomic,assign) BuilderPersonType builderPersonType;

@property(nonatomic, strong)YQBuilderProtocol personBuilder;

-(void)buildPerson;

@end
