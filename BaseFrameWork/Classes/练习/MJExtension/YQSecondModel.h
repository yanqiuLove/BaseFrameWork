//
//  YQSecondModel.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YQThirdModel.h"

@interface YQSecondModel : NSObject

@property (nonatomic, copy) NSString *text;
@property(nonatomic,strong) YQThirdModel *user;


@end
