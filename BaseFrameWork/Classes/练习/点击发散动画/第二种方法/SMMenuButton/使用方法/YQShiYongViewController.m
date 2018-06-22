//
//  YQShiYongViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/22.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQShiYongViewController.h"
#import "SMMenuButton.h"

@interface YQShiYongViewController ()<SMMenuButtonDelegate>

@end

@implementation YQShiYongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib. jszyfz2017
    
    // 创建按钮
    //    NSArray *imageNames = @[@"icon-star.png",@"icon-star.png",@"icon-star.png",@"icon-star.png",@"icon-star.png"];
    NSArray *imageNames = @[@"camera",@"suibi",@"history"];
    CGRect frame = CGRectMake(150, 150, 60, 60);
    SMMenuButton *smButton = [[SMMenuButton alloc] initWithNormalImageName:@"cube"
                                                         selectedImageName:@"cube_selected"
                                               subButtonBackgroudImageName:nil
                                                       subButtonImageNames:imageNames
                                                                     Frame:frame];
    smButton.subButton_size = CGSizeMake(44, 44);
    // 设置代理事件
    smButton.delegate = self;
    // 设置按钮位置和弧度
    smButton.start_pi = M_PI*0.95;
    smButton.center_pi = -M_PI_2*1.15;
    smButton.lenght = 70;
    
    [self.view addSubview:smButton];
}
#pragma mark - SMMenuButtonDelegate
/*
 *  点击菜单子按钮协议事件
 */
- (void)menuButton:(SMMenuButton *)menuButton clickedMenuButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex：%ld",buttonIndex);
    [menuButton closeMenuButton];
}

/*
 *  将要打开菜单按钮事件
 */
- (void)menuButtonWillOpen:(SMMenuButton *)menuButton
{
    NSLog(@"将要打开按钮");
    menuButton.selected = YES;
    
}

/*
 *  将要关闭菜单按钮事件
 */
- (void)menuButtonWillClose:(SMMenuButton *)menuButton
{
    NSLog(@"将要关闭按钮");
    menuButton.selected = NO;
}


@end
