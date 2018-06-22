//
//  YQHouse.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/1.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQHouse<objectType> : NSObject
/** 定义一个类，如果需要这个类里只允许添加一种对象，可以使用自定义泛型  在类后边添加一个type 这个标记可以随便起 就行 */
- (void)add:(objectType)object;
- (objectType)get;

@end
