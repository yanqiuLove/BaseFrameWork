//
//  YQTitleView.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/5/17.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQTitleView.h"
#import "YQTitleCollectionViewCell.h"

@interface YQTitleView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UIView *lineView;
    
/** collectionView的宽 */
@property(nonatomic,assign) CGFloat cWidth;
/** collectionView的高 */
@property(nonatomic,assign) CGFloat cHeight;
/** cell的宽 */
@property(nonatomic,assign) CGFloat cellWidth;
/** cell底部线条的宽 */
@property(nonatomic,assign) CGFloat lWidth;
    
@end


@implementation YQTitleView
static NSString *cellIdentifier = @"YQTitleCollectionViewCell";


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.titleModelArray = @[@"1",@"2",@"3",@"4",@"3",@"4",@"4",@"3",@"4"];
        
        self.cWidth = Kwidth - 50;
        self.cHeight = 60;
        self.cellWidth = (Kwidth - 50)/4;
        self.lWidth = self.cellWidth * 0.8;
        

        
        [self addSubview:self.collectionView];
        [self addSubview:self.lineView];
        [self addMasonry];
        
        self.collectionView.bounces = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        
    }
    return self;
}


#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleModelArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YQTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(passChooseModel:)]) {
        NSString *passStr = [self.titleModelArray objectAtIndex:indexPath.row];
        [self.delegate passChooseModel:passStr];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.collectionView).mas_offset((self.cellWidth - self.lWidth)*0.5 + indexPath.row*self.cellWidth);
        }];
        [self.lineView.superview layoutIfNeeded];
    }];
    
    
}
////动态设置每个Item的尺寸大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeZero;
    size = CGSizeMake(self.cellWidth, self.cHeight);
    return size;
}
////动态设置每个分区的EdgeInsets
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
//                        layout:(UICollectionViewLayout *)collectionViewLayout
//        insetForSectionAtIndex:(NSInteger)section
//{
//    UIEdgeInsets edge = UIEdgeInsetsZero;
//    edge = UIEdgeInsetsMake(0, 15, [UIView getHeightWithHeight:6], 15);
//    return edge;
//}
////动态设置每行的间距大小
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    CGFloat height = 0;
//    return height;
//}
////动态设置每列的间距大小
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    CGFloat height = 0;
//    return height;
//}

#pragma mark - Lazy
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;//最小上下间距
        layout.minimumInteritemSpacing = 0;//最小左右间距
        layout.itemSize = CGSizeMake(self.cellWidth, self.cHeight);//每个cell的大小
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向水平
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.cWidth, self.cHeight) collectionViewLayout:layout];
        // 如果未设置背景颜色是黑色设置背景颜色
        _collectionView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
        // 设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        /** 注册cell */
        [_collectionView registerClass:[YQTitleCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
        /** 注册头 */
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    }
    return _collectionView;
}
- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}
#pragma mark - 约束
- (void)addMasonry {
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).mas_offset(0);
        make.top.mas_equalTo(self).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(self.cWidth, self.cHeight));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.collectionView).mas_offset((self.cellWidth - self.lWidth)*0.5);
        make.top.mas_equalTo(self.collectionView.bottom).mas_offset(-2);
        make.size.mas_equalTo(CGSizeMake(self.lWidth, 2));
    }];
}

@end
