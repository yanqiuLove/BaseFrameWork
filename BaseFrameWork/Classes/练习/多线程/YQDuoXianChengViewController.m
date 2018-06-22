//
//  YQDuoXianChengViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/11/21.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQDuoXianChengViewController.h"

@interface YQDuoXianChengViewController ()

@end

@implementation YQDuoXianChengViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
}
/**
 1.线程的创建
 2.线程的状态
    退出 [NSThread exit]; 直接退出线程
    阻塞 比如延迟两秒再执行
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self way2];
    if ([UIApplication sharedApplication].statusBarStyle == UIStatusBarStyleLightContent) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }else {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    
}

/** 创建线程的三种方式 */
- (void)way1 {
    NSThread *thred = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"way1"];
    [thred start];
}
- (void)way2 {
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"way2"];
}
- (void)way3 {
    [self performSelectorInBackground:@selector(run:) withObject:@"way3"];
}
/** 阻塞线程的两种方式 */
- (void)block {
    /** 方式1 */
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    /** 方式2 */
    [NSThread sleepForTimeInterval:2];
    /** 让线程变成死亡状态 */
    [NSThread exit];
    
    //扩展一个方法  distantFuture  遥远的未来，这个线程就会永远阻塞
    //[NSThread sleepUntilDate:[NSDate distantFuture]];
    
}
/** 线程实现的方式 */
- (void)run:(NSString *)str {
    NSLog(@"%@,%@",str,[NSThread currentThread]);
}

/** 添加锁对象 */
- (void)addLocker {
    @synchronized (self) {
        
    }
}
/** 回到主线程 */
- (void)backMain {
    [self performSelectorOnMainThread:@selector(fangfamingzi) withObject:@"" waitUntilDone:YES];
    /** 刷新UI的时候可以不使用上边那种  会多出一个方法，用下边这种目标方法就是imageView的set方法 */
//    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:@"" waitUntilDone:YES];
/** 方式二 */
    dispatch_async(dispatch_get_main_queue(), ^{
       //在这里对下载好的图片进行刷新操作
        //如果想继续回到子线程，还可以继续在这里嵌套，通过线程的名字回到具体的子线程
    });
}
- (void)fangfamingzi {
}

#pragma mark - GCD的使用
- (void)makeQueue {
    /** 1.创建一个并发队列   DISPATCH_QUEUE_CONCURRENT 并行  */
//    dispatch_queue_t queue = dispatch_queue_create("queueName", DISPATCH_QUEUE_CONCURRENT);
    /** 获取全局的并发队列 */
    //第一个参数是优先级  第二个参数默认传0
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /** 2.将任务加入队列  总共三个任务  */
    //  async是异步  sync是同步  只有异步+并发队列才能开启多个线程  如果是sync+并发不能开启多个线程
    //  注意点：并行队列是有全局队列，如果是串行队列没有全局，必须手动创建
    
    //    dispatch_async  并行   dispatch_sync串行
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });
}
/** 创建串行队列 */  //
- (void)makeSyncQueue {
    //  注意点：并行队列是有全局队列，如果是串行队列没有全局，必须手动创建  DISPATCH_QUEUE_SERIAL串行  也可以传NULL
    dispatch_queue_t queue = dispatch_queue_create("queueName", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue = dispatch_queue_create("queueName", NULL);
    
    
//    dispatch_async  并行   dispatch_sync串行
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });
}
/** 获取主队列  其实就是同步队列的另外一种方式 */
/** 异步函数+主队列：只能在主线程中执行 */
- (void)getMainQueue {
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });
}
/** 常用的函数 */
- (void)user {
    dispatch_queue_t queue = dispatch_queue_create("queueName", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });
    
    dispatch_barrier_async(queue, ^{
        //barrier的作用是拦截  会先等上边1 2 执行完之后再执行 3 4 使用barrier不能用全局的定义队列
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"4---%@",[NSThread currentThread]);
        }
    });
}

/** 延迟执行的方法 */
- (void)after {
    //方式一
    [self performSelector:@selector(run) withObject:nil afterDelay:2.0];
    //方式二
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"延迟执行");
    });
    //方式三  延迟两秒 执行run 传递的信息 最后一个参数是不重复
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:NO];
}
/** 程序运行中只执行一次 */
- (void)ones {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"这里的代码在程序运行时只会执行一次,不能放在懒加载里执行");
    });
}
//
/** 创建一个队列组 把需要完成的任务队列放到组里，会先执行组里的再执行组外的  案例：下载两张图片并合成  */
- (void)group {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建一个队列组
    dispatch_group_t group = dispatch_group_create();
    // 1.下载图片1
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString:@""];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        UIImage *image = [UIImage imageWithData:data];
        imageView.image = image;
    });
    // 2.下载图片2
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString:@""];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        UIImage *image = [UIImage imageWithData:data];
        imageView.image = image;
    });
    // 3.合成图片  notify  使用这个方法就会在一个组里，先执行组里的其他任务，再执行这个方法里的
    dispatch_group_notify(group, queue, ^{
        //开启新的图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(100, 100));//设置合成图片的大小
        //绘制图片  属性引用两个image对象
//        [self.image1 drawInRect:CGRectMake(0, 0, 50, 100)];//第一张图片绘制合成图片的左边
//        [self.image2 drawInRect:CGRectMake(50, 0, 50, 100)];//第二张图片绘制合成图片的右边
        //取得上下文中的图片
//        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        //结束上下文
        UIGraphicsEndImageContext();
        //回到主线程显示图片
        dispatch_async(dispatch_get_main_queue(), ^{
           //将图片显示出来
        });
    });
}

/** 使用SDWebImage时内存不够用的时候需要做以下处理   这个是整个应用程序出现内存警告的时候使用 */
//- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
//    //出现内存警告的时候 把内存中的缓存图片清除  这个方法就是监听内存的
//    [[SDWebImageManager sharedManager].imageCache clearMemory];
//    //取消所有下载
//    [[SDWebImageManager sharedManager]cancelAll];
//}
/** 如果是当前控制器出现内存警告需要在下面这个方法中执行 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}































@end
