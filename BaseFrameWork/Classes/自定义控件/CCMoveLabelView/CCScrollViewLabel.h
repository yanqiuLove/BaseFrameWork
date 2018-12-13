//
//  CCScrollViewLabel.h
//  Cece
//
//  Created by 依小窗 on 2018/12/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCScrollViewLabel : UIScrollView

@property (nonatomic, strong) NSString *text;

- (void)commitInitWithBackgroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

@end

NS_ASSUME_NONNULL_END
