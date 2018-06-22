//
//  YQBuilderProtocol.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/19.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YQBuilderProtocol <NSObject>

//创建一个建造者的协议  定义一个建造者所必须要完成的方法
- (void)buildHead;
- (void)buildBody;
- (void)buildArmLeft;
- (void)buildArmRight;
- (void)buildLegLeft;
- (void)buildLegRight;

- (void)buildPerson;


@end

typedef id<YQBuilderProtocol> YQBuilderProtocol;
