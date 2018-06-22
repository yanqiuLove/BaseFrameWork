//
//  YQFileManagerViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/21.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFileManagerViewController.h"

@interface YQFileManagerViewController ()

/** testView */
@property(nonatomic,strong)UIView *testView;
/** 数据库 */
@property(nonatomic,strong)FMDatabase *db;


@end

@implementation YQFileManagerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSString *mainStr = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [mainStr stringByAppendingString:@"/test.db"];
    self.db = [FMDatabase databaseWithPath:dbPath];
    if ([self.db open]) {
        NSLog(@"打开成功");
        BOOL success = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER DEFAULT 1)"];
        if (success) {
            NSLog(@"创建表成功");
        } else {
            NSLog(@"创建表失败");
        }
    } else {
        NSLog(@"打开失败");
    }
    
    
    
    /** 管理系统文件 */
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager createDirectoryAtPath:@"" withIntermediateDirectories:NO attributes:nil error:nil];
    NSString *str = @"";
    NSData *strda = [str dataUsingEncoding:NSUTF8StringEncoding];
    [manager createFileAtPath:@"" contents:strda attributes:nil];
    
    /** 写入 */
    NSString *testStr = @"写入文件的字符串";
    NSString *strPath = @"";
    [testStr writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    /** 读取 */
    NSError *error;
    NSString *readStr = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@",readStr);
    NSString *path = @"";
    //保证路径中没有中文 如果有中文下边的方法中不能识别
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:path];
    NSString *writeurlStr = @"";
    [writeurlStr writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //往一个文件中多次写入文件  则后边写入的会覆盖之前的内容
    
    
    
    
    
    

    NSArray *words = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
    //获取设备缓存路径
    NSString *writeCachePatch = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    //拼接file路径，最终数据存储到words.plist文件中
    NSString *writeFilePath = [writeCachePatch stringByAppendingPathComponent:@"words.plist"];
    //写
    [words writeToFile:writeFilePath atomically:YES];
    //取
    NSString *readCachePatch = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *readFilePath = [readCachePatch stringByAppendingPathComponent:@"words.plist"];
    NSArray *products = [NSArray arrayWithContentsOfFile:readFilePath];
    
    
    /**
     //拿到图片
     //    UIImage *image = [self thumbnailImageForVideo:[NSURL fileURLWithPath:path] atTime:1];
     UIImage *image = [[UIImage alloc]init];
     //    NSString *path_document = NSHomeDirectory();
     //设置一个图片的存储路径
     NSString *imagePath = [[[NSString string] appendDocumentDir] stringByAppendingString:@"pic.png"];
     //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
     [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
     
     //删除本地写入的图片
     NSString *localImagePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/pic.png"];
     [[NSFileManager defaultManager] removeItemAtPath:localImagePath error:nil];
     
     */
    
    UIImage *cunchudeimage = [UIImage imageNamed:@"app_logo"];
    NSString *imagePayh = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *lastImagePath = [imagePayh stringByAppendingString:@"/image.png"];
    [UIImagePNGRepresentation(cunchudeimage) writeToFile:lastImagePath atomically:YES];
    
    [[NSFileManager defaultManager]removeItemAtPath:lastImagePath error:nil];
    
    
    
    
    
    

}

/**
 
 //plist文件中写入数组
 NSArray *dataarray = [NSArray array];
 [dataarray writeToFile:[self writeCacheFilePlistName:@"myStyleModel.plist"] atomically:YES];
//写入缓存的路径
- (NSString *)writeCacheFilePlistName:(NSString *)writePlistName{
    //获取设备缓存路径
    NSString *writeCachePatch = [writePlistName appendCacheDir];
    //拼接file路径，最终数据存储到words.plist文件中
    NSString *writeFilePath = [writeCachePatch stringByAppendingPathComponent:writePlistName];
    return writeFilePath;
}
// 删除plist文件
-(void)deleteFileToplist
{
    NSFileManager *manager=[NSFileManager defaultManager];
    //文件路径
    NSString *myStylePlistfilepath = [@"myStyleModel.plist" appendCacheDir];
    [manager removeItemAtPath:myStylePlistfilepath error:nil];
}

 
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
