//
//  YQCeShiModel.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/25.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQCeShiModel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *sex;
@property(nonatomic,strong) NSString *age;
//设置实际cell的高度
@property(nonatomic,assign) CGFloat cellHeight;
//标记是否选中
@property(nonatomic,assign) BOOL whetherSelected;


+ (NSMutableArray *)getYQCeShiModelArray;

@end
