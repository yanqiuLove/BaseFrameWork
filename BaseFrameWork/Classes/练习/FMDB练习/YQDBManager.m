//
//  YQDBManager.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQDBManager.h"


@interface YQDBManager ()

@property(nonatomic,strong) FMDatabase *fmdb;

@end

@implementation YQDBManager

static YQDBManager *theData = nil;
+ (instancetype)sharedDataBase {
    @synchronized(self) {
        if(!theData) {
            theData= [[YQDBManager alloc] init];
            [theData initDataBase];
        }
    }
    return theData;
}
- (void)initDataBase{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"studentInfo.db"];
    NSLog(@"---path:%@",filePath);
    //实例化FMDataBase对象
    self.fmdb = [FMDatabase databaseWithPath:filePath];
    if([self.fmdb open]) {
        [self addStudentTable];
//        [self addClassTable];
        [self.fmdb close];
    }else{
        NSLog(@"数据库打开失败---%@", self.fmdb.lastErrorMessage);
    }
}
- (void)addStudentTable {
    NSString *studentSQL = @"CREATE TABLE IF NOT EXISTS studentInfo(id INTEGER NOT NULL PRIMARY KEY,userName TEXT,age INTEGER,userId INTEGER);";
    
//    @"create table if not exists ’studentInfo‘ (id integer Primary Key Autoincrement, userId integer, userName char, age integer)"
    
    BOOL studentSuccess = [self.fmdb executeUpdate:studentSQL];
    if(!studentSuccess) {
        NSLog(@"studentTable创建失败---%@",self.fmdb.lastErrorMessage);
    }
}
- (void)addClassTable {
    NSString *classSQL =@"create table if not exists class (id integerPrimary Key,userClassId integer, className text)";
    BOOL classSuccess = [self.fmdb executeUpdate:classSQL];
    if(!classSuccess) {
        NSLog(@"classTable创建失败---%@",self.fmdb.lastErrorMessage);
    }
}
/** 获取全部学生 */
- (NSMutableArray *)getAllStudent {
    [self.fmdb open];
    NSMutableArray *array = [NSMutableArray new];
    FMResultSet *result = [self.fmdb executeQuery:@"select * from studentInfo"];
    while([result next]) {
        YQUserModel *student = [[YQUserModel alloc] init];
        student.userId = [[result stringForColumn:@"userId"] integerValue];
        student.userName = [result stringForColumn:@"userName"];
        student.age = [[result stringForColumn:@"age"] integerValue];
        [array addObject:student];
    }
    [self.fmdb close];
    return array;
}

/** 添加学生 */
- (void)addStudent:(YQUserModel *)student {
    [self.fmdb open];
    NSString *SQL = @"insert into studentInfo(userId,userName,age) values(?,?,?)";
    BOOL isAddSuccess = [self.fmdb executeUpdate:SQL,@(student.userId),student.userName,@(student.age)];
    if(!isAddSuccess) {
        NSLog(@"studentTable插入信息失败--%@",self.fmdb.lastErrorMessage);
    }
    [self.fmdb close];
}

/** 删除学生 */
- (void)deleteStudent:(YQUserModel *)student {
    [self.fmdb open];
    NSString *SQL = @"delete from studentInfo where userId = ?";
    BOOL isDeleteSuccess = [self.fmdb executeUpdate:SQL,@(student.userId)];
    if(!isDeleteSuccess) {
        NSLog(@"studentTable删除某一信息失败--%@",self.fmdb.lastErrorMessage);
    }
    [self.fmdb close];
}

/** 修改信息 */
- (void)updateStudent:(YQUserModel*)student {
    [self.fmdb open];
    NSString *SQL1 = @"update studentInfo set userName = ? where userId = ?";
    NSString *SQL2 = @"update studentInfo set age = ? where userId = ?";
    BOOL isSuccess1 = [self.fmdb executeUpdate: SQL1, student.userName,@(student.userId)];
    BOOL isSuccess2 = [self.fmdb executeUpdate: SQL2,@(student.age),@(student.userId)];
    if(!isSuccess1) {
        NSLog(@"student.sName修改失败--%@",self.fmdb.lastErrorMessage);
    }
    if(!isSuccess2) {
        NSLog(@"student.sAge修改失败--%@",self.fmdb.lastErrorMessage);
    }
    [self.fmdb close];
}

/** 删除学生表 */
- (void)deleteAllStudent {
    [self.fmdb open];
    NSString *SQL =@"delete from studentInfo";
    BOOL isSuccess = [self.fmdb executeUpdate:SQL];
    if(!isSuccess) {
        NSLog(@"studentTable全部删除失败--%@",self.fmdb.lastErrorMessage);
    }
    //student表删除以后，对应的class也要删除
    [self deleteAllClass];
    [self.fmdb close];
}

/** 获取某一个学生的全部课程 */
- (NSMutableArray *)getAllClassFromStudent:(YQUserModel *)student {
    
    [self.fmdb open];
    NSMutableArray *array = [NSMutableArray array];
    FMResultSet*result = [self.fmdb executeQuery:[NSString stringWithFormat:@"select * from class where userClassId = %ld", student.userId]];
    while([result next]) {
        YQClassModel *class = [[YQClassModel alloc] init];
        class.className = [result stringForColumn:@"className"];
        [array addObject:class];
    }
    [self.fmdb close];
    return array;
}

/** 给class表添加课程 */
- (void)addClass:(YQClassModel *)clas toStudent:(YQUserModel *)student {
    [self.fmdb open];
    NSString *SQL = [NSString stringWithFormat:@"insert into class (userClassId, className) values (%ld,?)", student.userId];
    BOOL isSuccess = [self.fmdb executeUpdate:SQL, clas.className];
    if(!isSuccess) {
        NSLog(@"classTable插入信息失败--%@",self.fmdb.lastErrorMessage);
    }
    [self.fmdb close];
}

/** 给class表删除课程 */
- (void)deleteClass:(YQClassModel *)clas toStudent:(YQUserModel *)student {
    [self.fmdb open];
    NSString *SQL = [NSString stringWithFormat:@"delete from class where userClassId = %ld and className = ?", student.userId];
    BOOL isSuccess = [self.fmdb executeUpdate:SQL,clas.className];
    if(!isSuccess) {
        NSLog(@"classTable删除某一信息失败--%@",self.fmdb.lastErrorMessage);
    }
    [self.fmdb close];
}

/** 删除student下某一的全部class */
- (void)deleteAllCarsFromStudent:(YQUserModel *)student {
    [self.fmdb open];
    NSString *SQL = [NSString stringWithFormat:@"delete from class where userClassId = %ld", student.userId];
    BOOL isSuccess = [self.fmdb executeUpdate:SQL];
    if(!isSuccess) {
        NSLog(@"student下某一的全部class删除失败--%@",self.fmdb.lastErrorMessage);
    }
    [self.fmdb close];
}


/** 删除class表 */
- (void)deleteAllClass {
    NSString*SQL =@"delete from class";
    BOOL isSuccess = [self.fmdb executeUpdate:SQL];
    if(!isSuccess) {
        NSLog(@"classt全部删除失败--%@",self.fmdb.lastErrorMessage);
    }
}

/** 由名字查找学生student信息 */
- (NSMutableArray *)seachAllInfoWith:(NSString *)str {
    [self.fmdb open];
    NSMutableArray*array = [NSMutableArray new];
    //通过名字查询学生信息
    NSString*SQL = [NSString stringWithFormat:@"select * from student where sName = '%@' ", str]; // '%@' 可以查询中文
    FMResultSet*result = [self.fmdb executeQuery:SQL];
    while([result next]) {
        YQUserModel *student = [[YQUserModel alloc] init];
        student.userId = [result intForColumn:@"userId"];
        student.userName = [result stringForColumn:@"userName"];
        [array addObject:student];
    }
    [self.fmdb close];
    return array;
}
    

@end
