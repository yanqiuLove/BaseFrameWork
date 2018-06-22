//
//  MJExtensionViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "MJExtensionViewController.h"

#import "YQFirstModel.h"
#import "YQSecondModel.h"
#import "YQThirdModel.h"
#import "YQFourthModel.h"

#import "YQJsonStrModel.h"

@interface MJExtensionViewController ()

@end

@implementation MJExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //模型属性中有数组，数组中又有模型，模型的属性中又有一层模型
    [self getRequestData];
    /** json字符串转模型 */
    [self jsonStrModel];
    /** JSON array -> model array【将一个字典数组转成模型数组】 */
    [self jsonArrModelArr];
    
}
/** 模型属性中有数组，数组中又有模型，模型的属性中又有一层模型 */
- (void)getRequestData {
    NSDictionary *dict = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"Nice weather!",
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   @{
                                       @"text" : @"Go camping tomorrow!",
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   ],
                           @"ads" : @[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.ad01.com"
                                       },
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.ad02.com"
                                       }
                                   ],
                           @"totalNumber" : @"2014"
                           };
    
    YQFirstModel *model = [YQFirstModel mj_objectWithKeyValues:dict];
    NSLog(@"%@",model);
    
    
}
/** json字符串转模型 */
- (void)jsonStrModel {
    //json字符串转模型
    // 1.Define a JSONString
    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    // 2.JSONString -> User
    YQJsonStrModel *jsonStrModel = [YQJsonStrModel mj_objectWithKeyValues:jsonString];
    
    // 3.Print user's properties
    NSLog(@"name=%@, icon=%@, age=%ld", jsonStrModel.name, jsonStrModel.icon, jsonStrModel.age);
}
/** JSON array -> model array【将一个字典数组转成模型数组】 */
- (void)jsonArrModelArr {
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png"
                               },
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png"
                               }
                           ];
    
    // JSON array -> User array
    NSArray *userArray = [YQJsonStrModel mj_objectArrayWithKeyValuesArray:dictArray];
    
    for (YQJsonStrModel *user in userArray) {
        NSLog(@"name=%@, icon=%@", user.name, user.icon);
    }
    
    /** 反过来  将模型数组转换成字典数组 */
    
//    User *user1 = [[User alloc] init];
//    user1.name = @"Jack";
//    user1.icon = @"lufy.png";
//    
//    User *user2 = [[User alloc] init];
//    user2.name = @"Rose";
//    user2.icon = @"nami.png";
//    
//    NSArray *userArray = @[user1, user2];
//    
//    // Model array -> JSON array
//    NSArray *dictArray = [User mj_keyValuesArrayWithObjectArray:userArray];
//    NSLog(@"%@", dictArray);
}

@end
