//
//  SlideSwitchView.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/3/21.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "SlideSwitchView.h"



#define ButtonMaxNumber  4

@interface SlideSwitchView ()<SDCycleScrollViewDelegate>
/**<UITableViewDelegate,UITableViewDataSource>*/

/** 底部tableView */
@property(nonatomic,strong)UITableView *bottomTableView;


/** 切换视图 */
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

/** 展示button的scrollview */
@property(nonatomic,strong)UIScrollView *buttonScrollView;
/** title数组 */
@property(nonatomic,strong)NSArray *titleArray;
/** button下边分割线 */
@property(nonatomic,strong)UIView *lineView;
/** 记录上一次点击的button的标题 */
@property (nonatomic, copy) NSString *lastButtonTitle;

@end

@implementation SlideSwitchView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArray = @[@"iOS",@"安卓",@"PHP"];
        //底部scrollview
        [self setBottomTableViewStrle];
        //头部轮播图
        [self addCycleScrollView];
        //buttonScrollview
        [self setButtonScrollViewStyle];
        //分割线
        [self setLineViewStyle];
        //button
        [self addButton];
//        self.bottomTableView.delegate = self;
//        self.bottomTableView.dataSource = self;
        [self loadMore];
        [self upDdata];
        
        
    }
    return self;
}
- (void)loadMore{
    __weak __typeof__(self) weakSelf = self;
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.bottomTableView.mj_footer endRefreshingWithNoMoreData];
        });
    }];
    weakSelf.bottomTableView.mj_footer = footer;
}
- (void)upDdata{
    __weak __typeof__(self) weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.bottomTableView.mj_header endRefreshing];
        });
    }];
    weakSelf.bottomTableView.mj_header = header;
}
/** 设置底部scrollview */
- (void)setBottomTableViewStrle{
    self.bottomTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight) style:UITableViewStyleGrouped];
    self.bottomTableView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    self.bottomTableView.showsHorizontalScrollIndicator = NO;
    self.bottomTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.bottomTableView];
    
}
/** 添加头部轮播图 */
- (void)addCycleScrollView{
    UIImage *imageOne = [UIImage imageNamed:@"1"];
    UIImage *imageTow = [UIImage imageNamed:@"2"];
    UIImage *imageThree = [UIImage imageNamed:@"3"];
    UIImage *imageFour = [UIImage imageNamed:@"4"];
    UIImage *imageFive = [UIImage imageNamed:@"5"];
    NSMutableArray *imageArray = [[NSMutableArray alloc]initWithObjects:imageOne,imageTow,imageThree,imageFour,imageFive, nil];
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Kwidth, 200) imagesGroup:imageArray];
    self.cycleScrollView.autoScrollTimeInterval = 3;
    self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    
    self.cycleScrollView.delegate = self;
    self.bottomTableView.tableHeaderView = self.cycleScrollView;
}
/** 设置展示button的scrollView */
- (void)setButtonScrollViewStyle{
    self.buttonScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.cycleScrollView.frame.origin.y + self.cycleScrollView.frame.size.height, Kwidth, 60)];
    self.buttonScrollView.contentSize = CGSizeMake(Kwidth/ButtonMaxNumber * self.titleArray.count, 0);
    self.buttonScrollView.pagingEnabled = YES;
    self.buttonScrollView.showsHorizontalScrollIndicator = NO;
    self.buttonScrollView.showsVerticalScrollIndicator = NO;
    [self.bottomTableView addSubview:self.buttonScrollView];
}
/** 设置分割线 */
- (void)setLineViewStyle{
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.buttonScrollView.frame.size.height - 1, Kwidth/ButtonMaxNumber, 1)];
    self.lineView.backgroundColor = [UIColor orangeColor];
    [self.buttonScrollView addSubview:self.lineView];
}
/** 添加button */
- (void)addButton{
    CGFloat w = 0;//保存前一个button的宽(也就是下一个button的x坐标)
    for (int i = 0; i < self.titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 100 + i;
        button.backgroundColor = [UIColor cyanColor];
        [button addTarget:self action:@selector(buttonAcction:) forControlEvents:UIControlEventTouchUpInside];
        //为button赋值
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        //设置button的frame
        if (self.titleArray.count < ButtonMaxNumber) {
            button.frame = CGRectMake(w, 0, Kwidth/3, self.buttonScrollView.frame.size.height - 1);
        }else{
            button.frame = CGRectMake(w, 0, Kwidth/ButtonMaxNumber, self.buttonScrollView.frame.size.height - 1);
        }
        w = button.frame.size.width + button.frame.origin.x;
        [self.buttonScrollView addSubview:button];
    }
}
/** button点击事件 */
- (void)buttonAcction:(UIButton *)btn{
    NSString *marketClientType = btn.titleLabel.text;
    if ([self.lastButtonTitle isEqualToString:marketClientType]) {
        //说明这次点击的按钮与上一次是同一个按钮，不做任何处理
        NSLog(@"与上一次点击按钮相同，是 %@ 按钮",marketClientType);
        return;
    }
    //按钮下面线条动画
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.frame = CGRectMake(btn.frame.origin.x, self.buttonScrollView.frame.size.height - 1, btn.frame.size.width, 1);
    }];
    self.lastButtonTitle = marketClientType;
    for (UIButton *button in self.buttonScrollView.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            if (button.tag == btn.tag) {
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }else{
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
        }
    }
    
    if (btn.tag == 102) {
        
        
        
    }
    NSLog(@"%ld",btn.tag);
    
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}

//#pragma mark - UITableViewDelegate,UITableViewDataSource
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 0;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 0;
//}


@end
