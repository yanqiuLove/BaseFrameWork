//
//  UIColor+WJ.h
//  FHIAsk
//
//  Created by feiHuaJianKangWang on 9/23/14.
//  Copyright (c) 2014 feiHuaJianKangWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WJ)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha;

//透明度默认是1
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
