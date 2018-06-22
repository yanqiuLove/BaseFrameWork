//
//  SCDataRequest+YQDataRequestManager.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "SCDataRequest.h"
#import "SCBaseResultArray.h"


@interface SCDataRequest (YQDataRequestManager)

+ (void)getTestDataSuccess:(void (^)(SCBaseResultArray *array))success failure:(void (^)(NSError *error))failure;

@end

