//
//  YQStateManager.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/27.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQStateManager.h"
#import "YQFirstState.h"
#import "YQSecondState.h"

@implementation YQStateManager

+ (instancetype)statusManger {
    YQStateManager *manger = [[YQStateManager alloc] init];
    return manger;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"testStates"]isEqualToString:@"1"]) {
            self.state = [[YQFirstState alloc]init];
        }else {
            self.state = [[YQSecondState alloc]init];
        }
    }
    return self;
}

-(void)needToDoFirstThing{
    
    if ([self.state respondsToSelector:@selector(needToDoFirstThing)]) {

        [self.state needToDoFirstThing];

    }
}

- (void)needToDoSecondThingWithName:(NSString *)name {
    
    if ([self.state respondsToSelector:@selector(needToDoSecondThingWithName:)]) {
        [self.state needToDoSecondThingWithName:name];
    }
    
}


@end
