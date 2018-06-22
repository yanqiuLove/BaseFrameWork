//
//  AppDelegate.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/3/20.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "AppDelegate.h"

/** 引导页 */
#import "GuideViewController.h"
/** 代理 */
#import "DelegateViewController.h"
/** 文件管理 */
#import "YQFileManagerViewController.h"
/** tableView */
#import "YQTableViewController.h"
/** 操作模型 */
#import "YQOperationModelViewController.h"
/** UIPickerView选择器 */
#import "YQPickerViewController.h"
/** MJExtension */
#import "MJExtensionViewController.h"
/** 状态模式 */
#import "YQStatePatternViewController.h"
/** 1工厂模式 */
#import "YQFactoryStateViewController.h"
/** 2策略模式 */
#import "YQCeLueMoShiViewController.h"
/** 3装饰模式 */
#import "YQZhuangShiMoShiViewController.h"
/** 5工厂方法模式 */
#import "YQGongChangFangFaMoShiViewController.h"
/** 6.模板方法模式 */
#import "YQMoBanMoShiViewController.h"
/** 7.外观模式 */
#import "YQWaiGuanMoShiViewController.h"
/** 8.建造者模式 */
#import "YQJianZaoZheMoShiViewController.h"
/** 9.观察者模式 */
#import "YQGuanChaZheMoShiViewController.h"
/** 10.抽象工厂模式 */
#import "YQChouXiangGongChangViewController.h"
/** 11.状态模式 */
#import "YQZhuangTaiMoshiViewController.h"
/** 12.适配器模式 */

/** 13.备忘录模式 */

/** 14.组合模式 */

/** 15.迭代器模式 */

/** 16.单利模式 */

/** 17.桥接模式 */

/** 18.命令模式 */

/** 19.职责链模式 */

/** 20.中介者模式 */

/** 21.享元模式 */

/** 22.解释器模式 */

/** 23.访问者模式 */

/** 24.原型模式 */

/** 做题动画 */
#import "YQTextAnimationViewController.h"
/** 折线图  图表 */
#import "YQChartViewController.h"
/** 知识讲解 */
#import "YQKnowledgeViewController.h"
/** 多线程 */
#import "YQDuoXianChengViewController.h"
/** FMDB */
#import "YQFMDBViewController.h"
/** 自定义泛型 */
#import "YQFanXingViewController.h"
/** RunLoop */
#import "YQRunLoopViewController.h"
/** 点击发散动画测试 */
#import "YQTapMoreAnimationViewController.h"
/** 解析数据 */
#import "JieXiShuJuViewController.h"
/** 雷达图 */
#import "YQLeiDaTuViewController.h"
/** 柱状图 */
#import "SingleBarChartViewController.h"
/** cell自适应高度 */
#import "YQZiShiYingGaoDuViewController.h"
/** 新手引导 */
#import "YQNewUserGuidViewController.h"
/** 12306生活测试 */
#import "YQ12306ViewController.h"
/** 自定义tabbae */
#import "YQTabBarViewController.h"
/** 出现下拉菜单 */
#import "YQMenuViewController.h"

#import <DDLegacyMacros.h>
#import <CocoaLumberjack.h>


#define controllerName YQMenuViewController



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DDLog addLogger:[DDASLLogger sharedInstance]];// 初始化DDLog日志输出，在这里，我们仅仅希望在xCode控制台输出
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];// 启用颜色区分
//    DDLogError(@"错误信息"); // 红色
//    DDLogWarn(@"警告"); // 橙色
//    DDLogInfo(@"提示信息"); // 默认是黑色
//    DDLogVerbose(@"详细信息"); // 默认是黑色
//    DDLog同时支持自定义日志的颜色.
    
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
//    YQTestView *testViw = [[YQTestView alloc]initWithFrame:CGRectMake(30, 100, 80, 80)];
//    testViw.backgroundColor = [UIColor cyanColor];
//    [self.window addSubview:testViw];
    
    //创建根控制器
    controllerName * vc = [[controllerName alloc]init];
    UINavigationController * naviGationController = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = naviGationController;
//    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}



@end
