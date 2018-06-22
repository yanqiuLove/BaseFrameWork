//
//  SCBaseResult.h
//  SanChiStudent
//
//  Created by 罗志平 on 16/9/10.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCBaseResult : NSObject

/** 状态码 */
@property (nonatomic , copy) NSString *status_code;

/** 提示 */
@property (nonatomic , copy) NSString *message;

@end
