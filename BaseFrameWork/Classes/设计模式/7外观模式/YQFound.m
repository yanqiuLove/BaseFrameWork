//
//  YQFound.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/19.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFound.h"
#import "YQWaiGuan1.h"
#import "YQWaiGuan2.h"

@interface YQFound ()

@property(nonatomic,strong) YQWaiGuan1 *waiguan1;
@property(nonatomic,strong) YQWaiGuan2 *waiguan2;

@end

@implementation YQFound

- (instancetype)init {
    if (self = [super init]) {
        _waiguan1 = [[YQWaiGuan1 alloc]init];
        _waiguan2 = [[YQWaiGuan2 alloc]init];
    }
    return self;
}

- (void)mairu {
    [self.waiguan1 mairu];
    [self.waiguan2 mairu];
}

- (void)maichu {
    [self.waiguan1 maichu];
    [self.waiguan2 maichu];
}
@end
