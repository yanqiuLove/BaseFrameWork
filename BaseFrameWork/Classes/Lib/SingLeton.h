//
//  SingLeton.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/3/31.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//
#define insterfaceSingLeton(name) +(instancetype)share##name;

#define implementationSingLeton(name) \
+ (instancetype)share##name{\
name *instance = [[name alloc]init];\
return instance;\
}\
static name *_instance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[super allocWithZone:zone]init];\
});\
return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone{\
return _instance;\
}



