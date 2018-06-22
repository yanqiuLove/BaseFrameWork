//
//  YQUserModel.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQUserModel : NSObject

@property(nonatomic,assign) NSInteger userId;
@property(nonatomic,strong) NSString *userName;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,strong) NSMutableArray *classArray;



@property(nonatomic,strong) UIImage *image;

@end
