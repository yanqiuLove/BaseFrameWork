//
//  YQFanXingViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/1.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFanXingViewController.h"
#import "YQHouse.h"
#import "YQType1.h"
#import "YQType2.h"

@interface YQFanXingViewController ()

@end

@implementation YQFanXingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不指定类型默认就是id
    
//    YQHouse<YQType1 *> *house1 = [[YQHouse alloc]init];
//    [house1 add:<#(YQType1 *)#>]
//    [house1 get];
    
//    YQHouse<YQType2 *> *house2 = [[YQHouse alloc]init];
//    [house2 add:<#(YQType2 *)#>]
    
    
    
    YQHouse *house0 = nil;
    YQHouse<NSString *> *house1 = nil;
    YQHouse<NSMutableString *> *house2 = nil;
    
    house0 = house1;
    house0 = house2;
    
    house1 = house0;
    house2 = house0;
    
    //如果在YQHouse类中只是单纯的设定一个类型 上边的那两种转换都可以  即  不需要强制抓换
    //如果在YQHouse类中 加上__covariant : 小类型（泛型类的子类类型）--> 大类型（泛型类的父类类型）
    //如果在YQHouse类中 加上__contravariant : 大类型（泛型类的父类类型）--> 小类型（泛型类的子类类型）
    
    
    
    
//#import <Foundation/Foundation.h>
//
//    @interface YQHouse<objectType> : NSObject
//    @interface YQHouse<__covariant objectType> : NSObject 小变大
//    @interface YQHouse<__contravariant objectType> : NSObject 大变小
//    /** 定义一个类，如果需要这个类里只允许添加一种对象，可以使用自定义泛型  在类后边添加一个type 这个标记可以随便起 就行 */
//    - (void)add:(objectType)object;
//    - (objectType)get;
//
//    @end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


@end
