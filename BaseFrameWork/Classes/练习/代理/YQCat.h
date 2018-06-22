//
//  YQCat.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/21.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol catDelegate <NSObject>

- (void)helpMeCashMouth;

@end



@interface YQCat : NSObject

/** 代理 */
@property(nonatomic,weak)id <catDelegate>delegate;


- (void)healpMe;

@end
