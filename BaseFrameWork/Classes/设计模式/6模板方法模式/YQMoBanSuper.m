//
//  YQMoBanSuper.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/15.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQMoBanSuper.h"

@implementation YQMoBanSuper
-(void)testQuestion1{
    NSLog(@"问题：你多大？[ ]：a.20 b.21 c.22 d.23");
    NSLog(@"答案：%@", [self answer1]);
}
-(NSString *)answer1{
    return nil;
}
-(void)testQuestion2{
    NSLog(@"问题：你是否结婚？[ ]：a.是 b.否");
    NSLog(@"答案：%@", [self answer2]);
}
-(NSString *)answer2{
    return nil;
}
@end
