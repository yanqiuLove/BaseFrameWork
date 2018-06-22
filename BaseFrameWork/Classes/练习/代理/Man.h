//
//  Man.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Man;
@protocol manDelegate <NSObject>

- (void)personEatFood;

@end

@interface Man : NSObject

@property(nonatomic,strong)id<manDelegate>delegate;

- (void)eatFood;

@end
