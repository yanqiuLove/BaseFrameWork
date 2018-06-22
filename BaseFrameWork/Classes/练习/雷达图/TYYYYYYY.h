//
//  TYYYYYYY.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2018/1/23.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKDBModel.h"

@interface TYYYYYYY : JKDBModel

@property(nonatomic,strong) UIImage *image;
/** 数据库存储的图片二进制 */
@property (nonatomic, strong) NSData *imageData;
/** 服务器上的地址 */
@property (nonatomic, copy) NSString *url;
/** 观课id */
@property (nonatomic, copy) NSString *classId;
/** 维度id  1:知识素养 2:教学实施 3:学习结果 4:课堂氛围 0:没有选择维度 */
@property (nonatomic, copy) NSString *dimensionId;
/** 标记是观课还是随笔  comeFromeVc  1:总结 2:随笔 */
@property (nonatomic, copy) NSString *comeFromeVc;

@end
