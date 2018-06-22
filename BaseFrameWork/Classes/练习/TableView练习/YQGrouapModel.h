//
//  YQGrouapModel.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/24.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQGrouapModel : NSObject

/** 标题头 */
@property(nonatomic,strong)NSString *headerName;
/** 标题脚 */
@property(nonatomic,strong)NSString *footerName;
/** 车数组 */
@property(nonatomic,strong)NSArray *carsArray;

+ (NSArray *)getData;

@end
