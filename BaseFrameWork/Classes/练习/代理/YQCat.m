//
//  YQCat.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/21.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQCat.h"

@implementation YQCat

-(void)healpMe {
    if ([self.delegate respondsToSelector:@selector(helpMeCashMouth)]) {
        [self.delegate helpMeCashMouth];
        
    }
}

@end
