//
//  YQTabBarViewController.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/6/22.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//  自定义tabbar

#import "YQTabBarViewController.h"
#import "YQTabBar.h"
#import "YQAllTabBar.h"

@interface YQTabBarViewController ()<YQAllTabBarDelegate>

/**
*  自定义TabBar
*/
@property (nonatomic, weak) YQAllTabBar *customTabBar;

@end

@implementation YQTabBarViewController

// init方法内部会调用initWithNibName方法, 所以在自定义控制器时可以把初始化的代码放到initWithNibName方法中, 以后无论是通过init方法还是通过initWithNibName都可以初始化
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 4.创建子控制器
        
        UIViewController *home = [self addControllerWithClass:[UIViewController class] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
        UIViewController *message = [self addControllerWithClass:[UIViewController class] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
        UIViewController *discover = [self addControllerWithClass:[UIViewController class] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
        UIViewController *profile = [self addControllerWithClass:[UIViewController class] title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建自定义CZTabBar2
    YQAllTabBar *tabBar = [[YQAllTabBar alloc] init];
    // 设置代理
    tabBar.delegate = self;
    
    // 2.设置CZTabBar2的frame
    tabBar.frame = self.tabBar.frame;
    // 3.添加CZTabBar2到父控件
    [self.view addSubview:tabBar];
    self.customTabBar = tabBar;
    // 4.移除系统自带的tabbar
//    [self.tabBar removeFromSuperview];
    for(UIView *view in self.tabBar.subviews) {
        
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
    
}

/**
 *  根据一个类创建一个控制器
 *
 *  @param class         控制器对应的类
 *  @param title         标题
 *  @param image         默认状态的图片
 *  @param selectedImage 选择状态图片
 *
 *  @return 创建好的控制器
 */
- (UIViewController *)addControllerWithClass:(Class)class title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    /*
     注意: 不是所有的控制器都是通过init方法初始化的
     */
    UIViewController *vc = [[class alloc] init];
    return [self addControllerWithVc:vc title:title image:image selectedImage:selectedImage];
}

/**
 *  根据一个创建好的控制器初始化控制器
 *
 *  @param vc            控制器
 *  @param title         标题
 *  @param image         默认图片
 *  @param selectedImage 选中图片
 *
 *  @return 初始化之后的控制器
 */
- (UIViewController *)addControllerWithVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    /*
     iOS7需要通过代码告诉系统不要用tabBar.tintColor来渲染选中图片
     */
    // 1.创建图片
    UIImage *newImage =  [UIImage imageNamed:selectedImage];
    // 2.告诉系统原样显示
    newImage = [newImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 3.设置图片
    vc.tabBarItem.selectedImage = newImage;
    vc.view.backgroundColor = SuiJiColor;
    
    // 设置tabBarButton的标题颜色
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    // 添加控制器到tabbarcontroller
    [self addChildViewController:vc];
    
    // 每添加一个子控制器就要创建一个对应的按钮
    [self.customTabBar addItem: vc.tabBarItem];
    
    return vc;
}

#pragma mark - CZTabBarDelegate
- (void)tabBar:(YQAllTabBar *)tabBar selectedBtnFrom:(NSInteger)from to:(NSInteger)to
{
    // 切换控制器
    // 1.取出当前选中按钮对应的控制器
    //    UIViewController *vc = self.childViewControllers[to];
    //    self.selectedViewController = vc;
    SCLog(@"点击了");
    self.selectedIndex = to;
}

@end
