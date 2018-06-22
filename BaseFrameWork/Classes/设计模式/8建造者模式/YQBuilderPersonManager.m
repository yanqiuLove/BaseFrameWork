//
//  YQBuilderPersonManager.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQBuilderPersonManager.h"
#import "YQPersonFatBuilder.h"
#import "YQPersonThinBuilder.h"

@implementation YQBuilderPersonManager

- (void)setBuilderPersonType:(BuilderPersonType)builderPersonType {
    _builderPersonType = builderPersonType;
    if (_builderPersonType == BuilderPersonType_fat) {
        self.personBuilder = [[YQPersonFatBuilder alloc]init];
        [self buildPerson];
    }else if (_builderPersonType == BuilderPersonType_thin) {
        self.personBuilder = [[YQPersonThinBuilder alloc]init];
        [self buildPerson];
    }
}

- (void)buildPerson {

    [self.personBuilder buildPerson];
    
}

@end
