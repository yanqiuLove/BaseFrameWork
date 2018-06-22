//
//  UIColor+Util.m
//  SanChiStudent
//
//  Created by xhwl on 16/8/16.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hexValue {
    return [UIColor colorWithHex:hexValue alpha:1.0];
}


+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    return [UIColor colorWithHexString:stringToConvert withAlpha:1.0f];
}
#pragma mark - TeacherCommonColor
/** #F4F4F4 */
+ (UIColor *)commonColorWithBackGroundColor {
    return [UIColor colorWithHex:0xF4F4F4];
}
/** #468aff/主题蓝色 */
+ (UIColor *)commonColorWithMainBlueColor {
    return [UIColor colorWithHex:0x468aff];
}

#pragma mark - CommonColor
/** #333333 */
+ (UIColor *)commonColorWithSixThree{
    return [UIColor colorWithHexString:@"#333333"];
}

/** #666666 */
+ (UIColor *)commonColorWithSixSix{
    return [UIColor colorWithHexString:@"#666666"];
}

/** #999999 */
+ (UIColor *)commonColorWithSixNine{
    return [UIColor colorWithHexString:@"#999999"];
}

/** #CCCCCC */
+ (UIColor *)commonColorWithSixC{
    return [UIColor colorWithHexString:@"#CCCCCC"];
}

/** #F9F9F9 */
+ (UIColor *)commonColorWithThreeFNine{
    return [UIColor colorWithHexString:@"#F9F9F9"];
}

/** #D8D8D8 */
+ (UIColor *)commonColorWithThreeDEight{
    return [UIColor colorWithHexString:@"#D8D8D8"];
}

/** #EFEFEF */
+ (UIColor *)commonColorWithThreeEF{
    return [UIColor colorWithHexString:@"#EFEFEF"];
}

/** #ECECEC */
+ (UIColor *)commonColorWithThreeEC{
    return [UIColor colorWithHexString:@"#ECECEC"];
}

/** #F0F0F0 */
+ (UIColor *)commonColorWithThreeFZero{
    return [UIColor colorWithHexString:@"#F0F0F0"];
}

/** #E0E0E0 */
+ (UIColor *)commonColorWithThreeEzero{
    return [UIColor colorWithHexString:@"#E0E0E0"];
}

/** #19D5B7 */
+ (UIColor *)commonColorWithOneNineDFiveBSeven{
    return [UIColor colorWithHexString:@"#19D5B7"];
}

/** #1DA5EA */
+ (UIColor *)commonColorWithItemButtonTextColor{
    return [UIColor colorWithHexString:@"#1DA5EA"];
}

@end
