//
//  YQNewUserGuidViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2018/2/6.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//  新手引导

#import "YQNewUserGuidViewController.h"
#import "ZWMGuideView.h"

@interface YQNewUserGuidViewController ()<ZWMGuideViewDataSource,ZWMGuideViewLayoutDelegate>

@property (nonatomic,strong) NSArray *viewsArray;
@property (nonatomic,strong) ZWMGuideView *guideView;
@property (nonatomic,strong) NSArray *descriptionArrar;

@end

@implementation YQNewUserGuidViewController

- (void)viewDidLoad {
    
    
    /**
     
     
     

     
     
     */
    
    
    
    [super viewDidLoad];
    self.navigationItem.title = @"新手引导页";
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(30, 100, 100, 50)];
    view1.backgroundColor = [UIColor redColor];
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 25;
    
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(150, 100, 50, 50)];
    view2.backgroundColor = [UIColor orangeColor];
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(30, 200, 100, 50)];
    view3.backgroundColor = [UIColor cyanColor];
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(220, 200, 100, 50)];
    view4.backgroundColor = [UIColor yellowColor];
    UIView *view5 = [[UIView alloc]initWithFrame:CGRectMake(30, 300, 50, 50)];
    view5.backgroundColor = [UIColor greenColor];
    UIView *view6 = [[UIView alloc]initWithFrame:CGRectMake(80, 330, 50, 50)];
    view6.backgroundColor = [UIColor cyanColor];
    UIView *view7 = [[UIView alloc]initWithFrame:CGRectMake(200, 500, 60, 50)];
    view7.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    [self.view addSubview:view6];
    [self.view addSubview:view7];
    self.viewsArray = @[view1,view2,view3,view4,view5,view6,view7];
    
    
    self.descriptionArrar = @[@"^^提莫队长正在送命^^！",
                              @"^^你好你好^^！",
                              @"^^新手引导页^^！",
                              @"^^新手引导页123^^！",
                              @"^^你的剑就是我的剑^^！",
                              @"^^见识下真正的坑货吧^^！",
                              @"欢迎来到小学生联盟! 小学生还有30秒到达战场！碾碎他们！全军出鸡！"];
    [self.guideView show];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.guideView show];
}
#pragma mark -- ZWMGuideViewDataSource（必须实现的数据源方法）
- (NSInteger)numberOfItemsInGuideMaskView:(ZWMGuideView *)guideMaskView{
    return self.viewsArray.count;
    
}
- (UIView *)guideMaskView:(ZWMGuideView *)guideMaskView viewForItemAtIndex:(NSInteger)index{
    return self.viewsArray[index];
    
}
- (NSString *)guideMaskView:(ZWMGuideView *)guideMaskView descriptionLabelForItemAtIndex:(NSInteger)index{
    return self.descriptionArrar[index];
}

#pragma mark -- ZWMGuideViewLayoutDelegate
- (CGFloat)guideMaskView:(ZWMGuideView *)guideMaskView cornerRadiusForItemAtIndex:(NSInteger)index
{
    if (index == self.viewsArray.count-1)
    {
        return 30;
    }
    
    return 5;
}
- (UIEdgeInsets)guideMaskView:(ZWMGuideView *)guideMaskView insetsForItemAtIndex:(NSInteger)index{
    return UIEdgeInsetsMake(-10, -10, -10, -10);
}



#pragma mark - Lazy
- (ZWMGuideView *)guideView
{
    if (_guideView == nil) {
        _guideView = [[ZWMGuideView alloc] initWithFrame:self.view.bounds];
        _guideView.dataSource = self;
        _guideView.delegate = self;
    }
    return _guideView;
}

@end
