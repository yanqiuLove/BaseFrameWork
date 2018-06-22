//
//  YQCarModel.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/24.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQCarModel : NSObject


/** 车的品牌 */
@property(nonatomic,strong)NSString *carName;
/** 车标 */
@property(nonatomic,strong)NSString *carIcon;

+ (instancetype)carName:(NSString *)carName carIcon:(NSString *)icon;

@end
