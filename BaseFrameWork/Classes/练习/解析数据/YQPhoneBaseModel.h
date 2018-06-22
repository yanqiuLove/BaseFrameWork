//
//  YQPhoneBaseModel.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/19.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YQDataModel;
@interface YQPhoneBaseModel : NSObject

@property(nonatomic,strong) NSString *code;
@property(nonatomic,strong) NSArray *errInfo;
@property(nonatomic,strong) YQDataModel *data;


@end
