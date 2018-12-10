//
//  ZCCCircleProgressView.m
//  MOSOBOStudent
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCCircleProgressView.h"

@interface ZCCCircleProgressView()

@property (nonatomic, strong)UILabel *bottomLabel;

@property (nonatomic, strong)CAGradientLayer *gradientLayer;
//进度圆环
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ZCCCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setColorsArray:(NSArray *)colorsArray {
    _colorsArray = colorsArray;
    // 圆路径
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.sc_width / 2, self.sc_height / 2) radius:(self.sc_width - 20)/2 startAngle:M_PI + M_PI / 2 endAngle:M_PI / 2 + M_PI*3 clockwise:YES];
    // 先画一个背景环
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = self.bounds;
    bgLayer.fillColor = [UIColor clearColor].CGColor;//填充色 -  透明色
    bgLayer.lineWidth = 20.f;
    bgLayer.strokeColor = [UIColor whiteColor].CGColor;//线条颜色
    bgLayer.strokeStart = 0;
    bgLayer.strokeEnd = 1;
    bgLayer.lineCap = kCALineCapRound;
    bgLayer.path = circlePath.CGPath;
    [self.layer addSublayer:bgLayer];
    // 设置进度条
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.lineWidth = 20.f;
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    _shapeLayer.strokeStart = 0;
    _shapeLayer.strokeEnd = 0;
    _shapeLayer.path = circlePath.CGPath;
    [self.layer addSublayer:_shapeLayer];
    
    self.gradientLayer = [CAGradientLayer layer];
    // 设置渐变图层
    CAGradientLayer *changeGradientLayer = [CAGradientLayer layer];
    changeGradientLayer.frame = CGRectMake(0, 0, self.sc_width , self.sc_height);
    [changeGradientLayer setColors:_colorsArray];
    [changeGradientLayer setLocations:@[@0,@0.9]];
    [changeGradientLayer setStartPoint:CGPointMake(0, 1)];
    [changeGradientLayer setEndPoint:CGPointMake(1, 0)];
    [_gradientLayer addSublayer:changeGradientLayer];
    [self.gradientLayer setMask:_shapeLayer];
    
    self.gradientLayer.frame = self.bounds;
    //将渐变图层映射到进度条路径上
    [self.layer addSublayer:self.gradientLayer];
}
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if(_shapeLayer.strokeEnd != 0) {
        [self animateToZero];
    }
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_shapeLayer.strokeEnd * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf deleteTimer];
        NSString *progressStr = [NSString stringWithFormat:@"%lf",_progress];
        NSDictionary *userInfo = @{@"progressStr":progressStr};
        weakSelf.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:weakSelf selector:@selector(animate:) userInfo:userInfo repeats:YES];
    });
    
}
- (void)setAnimateTime:(CGFloat)animateTime {
    _animateTime = animateTime;
}
- (void)animate:(NSTimer *)time {
    CGFloat progress = [[time.userInfo objectForKey:@"progressStr"]  floatValue];
    if(_shapeLayer.strokeEnd <= progress) {
        _shapeLayer.strokeEnd += progress/(self.animateTime*100);
        self.bottomLabel.text = [NSString stringWithFormat:@"%.0f",_shapeLayer.strokeEnd*100];
    }else {
        [self deleteTimer];
    }
}
// 进度清零  先判断 timer 有没有存在 存在 就把timer 删除
- (void)animateToZero {
    [self deleteTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animateReset) userInfo:nil repeats:YES];
}
- (void)animateReset {
    if(_shapeLayer.strokeEnd > 0){
        _shapeLayer.strokeEnd -= 0.01;
    }else{
        [self deleteTimer];
    }
}
- (void)deleteTimer {
    [self.timer invalidate];
    self.timer = nil;
}


@end
