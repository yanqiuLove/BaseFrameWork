//
//  SCDataRequest+YQDataRequestManager.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "SCDataRequest+YQDataRequestManager.h"


@implementation SCDataRequest (YQDataRequestManager)

+ (void)getTestDataSuccess:(void (^)(SCBaseResultArray *array))success failure:(void (^)(NSError *error))failure {
//    NSDictionary *params = @{@"page":page};
//    NSString *url = @"/api/teacher/usercenter/getCollectNewsList";
//    [[NetWorkTools shareManager] requestWithType:HttpTypeGet URLString:url parameters:params success:^(id responseObject) {
//        SCBaseResultArray *array = [SCBaseResultArray mj_objectWithKeyValues:responseObject];//字典转模型
//        SCLog(@"getMyCollectionWithParamters = %@",responseObject);
//        
//        success(array);
//    } failure:^(NSError *error) {
//        SCLog(@"getMyCollectionWithParamters = %@",error);
//        failure(error);
//    }];
}

@end
