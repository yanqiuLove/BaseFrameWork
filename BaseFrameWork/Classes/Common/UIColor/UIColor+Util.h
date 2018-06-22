//
//  UIColor+Util.h
//  SanChiStudent
//
//  Created by xhwl on 16/8/16.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue;
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

#pragma mark - TeacherCommonColor
/** #F4F4F4/背景灰色 */
+ (UIColor *)commonColorWithBackGroundColor;

/** #468aff/主题蓝色 */
+ (UIColor *)commonColorWithMainBlueColor;

#pragma mark - CommonColor
/** #333333 */
+ (UIColor *)commonColorWithSixThree;

/** #666666 */
+ (UIColor *)commonColorWithSixSix;

/** #999999 */
+ (UIColor *)commonColorWithSixNine;

/** #CCCCCC */
+ (UIColor *)commonColorWithSixC;

/** #F9F9F9 */
+ (UIColor *)commonColorWithThreeFNine;

/** #D8D8D8 */
+ (UIColor *)commonColorWithThreeDEight;

/** #EFEFEF */
+ (UIColor *)commonColorWithThreeEF;

/** #ECECEC */
+ (UIColor *)commonColorWithThreeEC;

/** #F0F0F0 */
+ (UIColor *)commonColorWithThreeFZero;

/** #E0E0E0 */
+ (UIColor *)commonColorWithThreeEzero;

/** #19D5B7 */
+ (UIColor *)commonColorWithOneNineDFiveBSeven;

/** #1DA5EA */
+ (UIColor *)commonColorWithItemButtonTextColor;

//+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

@end
