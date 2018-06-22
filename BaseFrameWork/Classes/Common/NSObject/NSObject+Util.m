//
//  NSObject+Util.m
//  SanChiStudent
//
//  Created by xhwl on 16/8/16.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import "NSObject+Util.h"
#import <objc/runtime.h>

const char* propertiesKey = "propertiesKey";


@implementation NSObject (Util)

+ (BOOL)isEmpty:(NSObject *)object {
    if(object && ![[NSNull null] isEqual:object] && ![@"(null)" isEqual:object]){
        if([object isKindOfClass:[NSArray class]] ||
           [object isKindOfClass:[NSMutableArray class]]){
            NSArray* this = (NSArray*)object;
            return this.count > 0 ? NO : YES;
        }
        if([object isKindOfClass:[NSDictionary class]] ||
           [object isKindOfClass:[NSMutableDictionary class]]){
            NSDictionary* this = (NSDictionary*)object;
            return this.count >0 ? NO : YES;
        }
        if([object isKindOfClass:[NSString class]]){
            NSString* this = (NSString*)object;
            return this.length >0 ? NO : YES;
        }
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)isNotEmpty:(NSObject *)object {
    return ![NSObject isEmpty:object];
}

- (NSArray *)getPropertyList {
    NSArray *plist = objc_getAssociatedObject(self, propertiesKey);
    
    if (plist != nil) {
        return plist;
    }
    
    // 1.获取类的属性
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:count];
    // 遍历数组
    for (unsigned int i=0; i<count; i++) {
        // 获取属性
        objc_property_t pty = list[i];
        
        // 获取属性的名字
        const char *cname = property_getName(pty);
        
        [arrM addObject:[NSString stringWithUTF8String:cname]];
    }
    
    // 释放属性数组
    free(list);
    
    // 3.设置关联对象
    objc_setAssociatedObject(self, propertiesKey, arrM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return arrM.copy;
}


@end
