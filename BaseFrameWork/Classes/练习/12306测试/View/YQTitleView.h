//
//  YQTitleView.h
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/5/17.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YQTitleViewDelegate <NSObject>
    - (void)passChooseModel:(NSString *)chooseModel;
@end

@interface YQTitleView : UIView

/** 标题模型数组 */
@property(nonatomic,strong) NSArray *titleModelArray;

@property(nonatomic,weak) id<YQTitleViewDelegate>delegate;
    
@end
