//
//  SingleBarChartViewController.m
//  ZFChartView
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SingleBarChartViewController.h"
#import "ZFChart.h"

@interface SingleBarChartViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>

@property (nonatomic, strong) ZFBarChart *barChart;

@property(nonatomic,strong) NSArray *teacherArray;
@property(nonatomic,strong) NSArray *scoreArray;

@property (nonatomic, assign) CGFloat height;

@end

@implementation SingleBarChartViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(0, 165, Kwidth, 400)];
    self.barChart.dataSource = self;
    self.barChart.delegate = self;
    self.barChart.topicLabel.text = @"xx小学各年级人数";
    self.barChart.unit = @"人";
    self.barChart.isAnimated = NO;
//    self.barChart.isResetAxisLineMinValue = YES;
    self.barChart.isResetAxisLineMaxValue = YES;
//    self.barChart.isShowAxisLineValue = NO;
//    self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
    self.barChart.isShowXLineSeparate = NO;
    self.barChart.isShowYLineSeparate = YES;
//    self.barChart.topicLabel.textColor = ZFWhite;
//    self.barChart.unitColor = ZFWhite;
//    self.barChart.xAxisColor = ZFWhite;
//    self.barChart.yAxisColor = ZFWhite;
//    self.barChart.xAxisColor = ZFClear;
//    self.barChart.yAxisColor = ZFClear;
//    self.barChart.axisLineNameColor = ZFWhite;
//    self.barChart.axisLineValueColor = ZFWhite;
//    self.barChart.backgroundColor = ZFBlue;
//    self.barChart.isShowAxisArrows = NO;
    self.barChart.separateLineStyle = kLineStyleRealLine;
//    self.barChart.isMultipleColorInSingleBarChart = YES;
//    self.barChart.separateLineDashPhase = 0.f;
//    self.barChart.separateLineDashPattern = @[@(5), @(5)];
    
    
    
    
    self.barChart.xAxisColor = [UIColor colorWithHexString:@"EBEBEB"];
    self.barChart.yAxisColor = [UIColor colorWithHexString:@"EBEBEB"];
    self.barChart.separateColor = [UIColor colorWithHexString:@"EBEBEB"];
    self.barChart.unitColor = [UIColor colorWithHexString:@"9B9B9B"];
//    self.barChart.axisLineNameColor = [UIColor colorWithHexString:@"9B9B9B"];
    self.barChart.axisLineNameColor = [UIColor colorWithHexString:@"474747"];
//    self.barChart.axisLineNameColor = [UIColor colorWithHexString:@"474747"];
//    self.barChart.axisLineValueColor = [UIColor colorWithHexString:@"474747"];
    //y周文字颜色
    self.barChart.axisLineValueColor = [UIColor colorWithHexString:@"9B9B9B"];
//    self.barChart.kPopoverLabelPattern = kPopoverLabelPatternBlank;
    
    
    NSMutableArray *xarray = [NSMutableArray array];
    NSMutableArray *yarray = [NSMutableArray array];
    
    for (NSInteger i = 0; i<10; i++) {
        NSString *str = [NSString stringWithFormat:@"教师%ld",i];
        [xarray addObject:str];
        NSInteger score = 1.1 + arc4random() % 4;
        NSString *scores = [NSString stringWithFormat:@"%ld",score];
        [yarray addObject:scores];
    }
    
    self.teacherArray = xarray;
    self.scoreArray = yarray;
    [self.view addSubview:self.barChart];
    [self.barChart strokePath];
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    return self.scoreArray;
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    return self.teacherArray;
}

//- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
//    return @[ZFMagenta];
//    
////    return @[ZFRandom, ZFRandom, ZFRandom, ZFRandom, ZFRandom, ZFRandom];
//}

- (CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart{
    return 5;
}

//- (CGFloat)axisLineMinValueInGenericChart:(ZFGenericChart *)chart{
//    return 50;
//}

//- (NSUInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart{
//    return 10;
//}

//- (NSInteger)axisLineStartToDisplayValueAtIndex:(ZFGenericChart *)chart{
//    return 7;
//}

- (void)genericChartDidScroll:(UIScrollView *)scrollView{
    NSLog(@"当前偏移量 ------ %f", scrollView.contentOffset.x);
}

#pragma mark - ZFBarChartDelegate

/** 每个柱状图的宽度 */
- (CGFloat)barWidthInBarChart:(ZFBarChart *)barChart{
    return 30.f;
}
/** 每个柱状图之间的间隔 */
- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{
    return 30.f;
}

//- (id)valueTextColorArrayInBarChart:(ZFGenericChart *)barChart{
//    return ZFBlue;
//}

- (NSArray *)gradientColorArrayInBarChart:(ZFBarChart *)barChart{
    ZFGradientAttribute *gradientAttribute = [[ZFGradientAttribute alloc] init];
    UIColor *color = [UIColor colorWithHexString:@"56B5EE"];
    UIColor *endColor = [UIColor colorWithHexString:@"5AB1EF"];
    gradientAttribute.colors = @[(id)color.CGColor, (id)endColor.CGColor];
    gradientAttribute.locations = @[@(0.5), @(0.99)];
    return [NSArray arrayWithObjects:gradientAttribute, nil];
}



@end
