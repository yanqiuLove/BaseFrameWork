//
//  YQGuideView.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/21.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQGuideView.h"

@interface YQGuideView ()<UIScrollViewDelegate>

/** 引导页创建一个跟视图放scrollView展示图片 */
@property(nonatomic,strong)UIImageView *rootImageView;
@property(nonatomic,strong)UIPageControl *pageControl;


@end

@implementation YQGuideView
//引导页
#pragma mark 创建rootImageView
-(void)createRootImageView{
    self.rootImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.rootImageView];
    //    因为父视图是一个imageView,要开启互动,否则无法做任何操作
    [self setUserInteractionEnabled:YES];
}
#pragma mark 创建第二层视图scrollView
-(void)createScrollViewWithGuideImageArray:(NSMutableArray *)imageArray pageControlStyle:(pageControlStyle)style{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //    设置scrollView内容大小--可滑动范围
    [scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * imageArray.count, 0)];
    //    向其中添加pageImageView
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    for (int i = 0; i < imageArray.count; i++) {
        //        相对于scrollView内容的位置
        UIImageView *pageImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        [pageImageView setImage:[imageArray objectAtIndex:i]];
        if (i == imageArray.count - 1) {
            [self createIntoButton:pageImageView];
        }
        [scrollView addSubview:pageImageView];
    }
    //    设置分页,否则滚动效果很糟糕
    [scrollView setPagingEnabled:YES];
    //    去掉弹性
    [scrollView setBounces:NO];
    //    去掉滚动条
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    //    设置代理,以便于滑动时改变pageControl
    [scrollView setDelegate:self];
    //    scrollView目前为第二层视图
    [self addSubview:scrollView];
}

#pragma mark 创建和scrollView同为第二层视图的pageControl

//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
//    [self.pageControl setCurrentPage:index];
//    if (index == 2) {
//        self.pageControl.hidden = YES;
//    }else{
//        self.pageControl.hidden = NO;
//    }
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //四舍五入
    NSInteger index = (NSInteger)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    [self.pageControl setCurrentPage:index];
    if (index == 2) {
        self.pageControl.hidden = YES;
    }else{
        self.pageControl.hidden = NO;
    }
}
-(void)createPageControlWithImageArray:(NSMutableArray *)imageArray pageControlStyle:(pageControlStyle)style selectedColor:(UIColor *)selectedColor noSelectedColor:(UIColor *)noSelectedColor{
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.userInteractionEnabled = NO;
    //    设置位置
    [self.pageControl setCenter:CGPointMake(self.bounds.size.width/2, Kheight - 60)];
    [self.pageControl setBounds:CGRectMake(0, 0, Kheight - 50 * kSCREEN_SCALE_WIDTH, 44)];
    //    设置页数
    [self.pageControl setNumberOfPages:imageArray.count];
    if (style == pageControlStyleHavePageControl){
        //    设置pagecontroll选中和待选中的颜色
        self.pageControl.currentPageIndicatorTintColor = selectedColor;
        self.pageControl.pageIndicatorTintColor = noSelectedColor;
    }else{
        [self.pageControl setValue:[UIImage imageNamed:@"bluePoint"] forKeyPath:@"_pageImage"];
        [self.pageControl setValue:[UIImage imageNamed:@"redPoint"] forKeyPath:@"_currentPageImage"];
    }
    [self addSubview:self.pageControl];
}

#pragma mark 创建最后一页的“点击进入”按钮
-(void)createIntoButton:(UIImageView*)pageImageView{
    [pageImageView setUserInteractionEnabled:YES];
    UIButton *intoButton = [[UIButton alloc] init];
    intoButton.frame = CGRectMake(0, Kheight - 300, Kwidth, 300);
    intoButton.backgroundColor = [UIColor clearColor];
    //    消息响应
    [intoButton addTarget:self action:@selector(intoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //    添加到pageImageView
    [pageImageView addSubview:intoButton];
}

- (void)initWithGuideImageArray:(NSMutableArray *)guideImageArray pageControlStyle:(pageControlStyle)style selectedColor:(UIColor *)selectedColor noSelectedColor:(UIColor *)noSelectedColor {
    [self createRootImageView];
    [self createScrollViewWithGuideImageArray:guideImageArray pageControlStyle:style];
    if (style == pageControlStyleHavePageControl || style == pageControlStyleChangePageControl) {
        [self createPageControlWithImageArray:guideImageArray pageControlStyle:style selectedColor:selectedColor noSelectedColor:noSelectedColor];
    }
    
}

- (void)intoButtonClick {
    NSLog(@"点击进入");
}

@end

