//
//  JieXiShuJuViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/19.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "JieXiShuJuViewController.h"
#import "YQPhoneBaseModel.h"
#import "YQOneDetailModel.h"
#import "YQDataModel.h"

@interface JieXiShuJuViewController ()

@end

@implementation JieXiShuJuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"解析数据";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"phone" ofType:@"json"];
    NSString *jsonStr=[[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    NSMutableArray *array = [YQPhonePersonModel mj_objectArrayWithFile:path];
//    NSLog(@"%ld,%@",array.count,array);
    
    YQPhoneBaseModel *phoneBaseModel = [YQPhoneBaseModel mj_objectWithKeyValues:jsonStr];
    
    NSMutableArray *oneModelArray = [YQOneDetailModel mj_objectArrayWithKeyValuesArray:phoneBaseModel.data.list];
    NSLog(@"%@",oneModelArray);
    NSString *str = @"";
    for (NSInteger i = 0; i < oneModelArray.count; i++) {
        YQOneDetailModel *model = [oneModelArray objectAtIndex:i];
        NSString *nameStr = model.incomingTag;
        NSString *phoneStr = model.organization;
        if (nameStr.length > 0 && phoneStr.length > 0) {
            str = [str stringByAppendingString:[nameStr stringByAppendingString:phoneStr]];
        }
    }
    NSLog(@"%@",str);
    
    
}


@end
