//
//  YQStatePatternViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/6/19.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQStatePatternViewController.h"
#import "YQStateManager.h"
#import "YQFirstState.h"
#import "YQSecondState.h"

@interface YQStatePatternViewController ()

@end

@implementation YQStatePatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"testStates"];
    
    YQStateManager *stateManager = [[YQStateManager alloc]init];
    [stateManager needToDoFirstThing];
    
    [stateManager needToDoSecondThingWithName:@"第二件事儿"];
    
    
    
//    stateManager.state = [[YQFirstState alloc]init];
//    [stateManager needToDoFirstThing];
//    stateManager.state = [[YQSecondState alloc]init];
//    [stateManager needToDoFirstThing];
    
}

@end
