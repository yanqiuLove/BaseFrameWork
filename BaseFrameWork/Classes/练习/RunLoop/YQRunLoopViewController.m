//
//  YQRunLoopViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/11/28.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQRunLoopViewController.h"



@implementation YQRunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //不能使用自定义的线程使用强引用，因为一个线程如果执行完任务之后就会处于消亡状态，再次让线程工作的时候就会出现崩溃，不允许这样使用  即下边的使用方法是不允许的
//    @property(nonatomic,strong) 自定义线程 *thred;
//    self.thred = [[自定义线程 alloc]initWithTarget:self selector:@selector(run) object:nil];
//    [self.thred start];
    //为了避免一个线程执行完任务之后就死掉  可以使用runloop  即在run方法中执行下边代码  然后就可以在其他地方随时让这个线程处于唤醒状态了 [self.thred start];
    [[NSRunLoop currentRunLoop]addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    //启动runloop
    [[NSRunLoop currentRunLoop] run];
    //唤醒这个线程的事件是perform事件 即需要在特定方法里执行下面代码
//    [self performSelectorOnMainThread:@selector(test) withObject:nil waitUntilDone:NO];
    //实现test方法
    
    //方法二  也可以在启动线程中的方法run中添加一个timer
    //添加timer的方法有两种
    //1
//    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];
    //2  这种方式等于上边两行代码的效果，这种timer默认是在主线程中  所以不需要添加只需要让runloop跑起来就行
//    [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(inde) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] run];
    
    
    
    
}
- (void)run {
    @autoreleasepool {
        //一般在添加runloop的时候最好在这里添加一个释放池
    }
}
@end
