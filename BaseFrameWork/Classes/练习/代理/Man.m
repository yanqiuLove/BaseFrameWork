//
//  Man.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "Man.h"

@implementation Man

- (void)eatFood {
    
    if ([self.delegate respondsToSelector:@selector(personEatFood)]) {
        [self.delegate personEatFood];
    }
}

@end
