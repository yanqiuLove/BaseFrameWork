//
//  YQPersonFatBuilder.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQPersonFatBuilder.h"
#import "YQHeader.h"
#import "YQBody.h"
#import "YQArmLeft.h"
#import "YQArmRight.h"
#import "YQLegLeft.h"
#import "YQLegRight.h"


@interface YQPersonFatBuilder ()

@property(nonatomic,strong) YQHeader *header;
@property(nonatomic,strong) YQBody *body;
@property(nonatomic,strong) YQArmLeft *armLeft;
@property(nonatomic,strong) YQArmRight *armRight;
@property(nonatomic,strong) YQLegLeft *legLeft;
@property(nonatomic,strong) YQLegRight *legRight;

@end


@implementation YQPersonFatBuilder

- (instancetype)init {
    if (self = [super init]) {
        _header = [[YQHeader alloc]init];
        _body = [[YQBody alloc]init];
        _armLeft = [[YQArmLeft alloc]init];
        _armRight = [[YQArmRight alloc]init];
        _legLeft = [[YQLegLeft alloc]init];
        _legRight = [[YQLegRight alloc]init];
    }
    return self;
}

- (void)buildHead {
    [self.header work];
    NSLog(@"建造胖子的头");
}
- (void)buildBody {
    [self.body work];
    NSLog(@"建造胖子的身体");
}
- (void)buildArmLeft {
    [self.armLeft work];
    NSLog(@"建造胖子的左胳膊");
}
- (void)buildArmRight {
    [self.armRight work];
    NSLog(@"建造胖子的右胳膊");
}
- (void)buildLegLeft {
    [self.legLeft work];
    NSLog(@"建造胖子的左腿");
}
- (void)buildLegRight {
    [self.legRight work];
    NSLog(@"建造胖子的右腿");
}

- (void)buildPerson {
    [self buildHead];
    [self buildBody];
    [self buildArmLeft];
    [self buildArmRight];
    [self buildLegLeft];
    [self buildLegRight];
    
    NSLog(@"建造胖子完毕");
}

@end
