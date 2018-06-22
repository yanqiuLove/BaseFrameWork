//
//  YQDBManager.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YQUserModel.h"
#import "YQClassModel.h"

/*
 数据库操作的管理类
 */

@interface YQDBManager : NSObject

/** 创建数据库单利对象 */
+ (instancetype)sharedDataBase;

/** 获取全部学生 */
- (NSMutableArray*)getAllStudent;

/** 添加学生 */
- (void)addStudent:(YQUserModel *)student;

/** 删除学生 */
- (void)deleteStudent:(YQUserModel *)student;

/** 修改信息 */
- (void)updateStudent:(YQUserModel*)student;

/** 删除学生表 */
- (void)deleteAllStudent;

/** 获取某一个学生的全部课程 */
- (NSMutableArray *)getAllClassFromStudent:(YQUserModel *)student;

/** 给class表添加课程 */
- (void)addClass:(YQClassModel *)clas toStudent:(YQUserModel *)student;

/** 给class表删除课程 */
- (void)deleteClass:(YQClassModel *)clas toStudent:(YQUserModel *)student;

/** 删除student下某一的全部class */
- (void)deleteAllCarsFromStudent:(YQUserModel *)student;

/** 删除class表 */
- (void)deleteAllClass;

/** 由名字查找学生student信息 */
- (NSMutableArray *)seachAllInfoWith:(NSString *)str;

/** 全部信息 */






@end
