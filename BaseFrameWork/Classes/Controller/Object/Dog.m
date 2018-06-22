//
//  Dog.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/17.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)feed{
    NSLog(@"喂狗");
}
-(void)feedWithAnimal:(Animal *)animal {
    [self feed];
}
@end
