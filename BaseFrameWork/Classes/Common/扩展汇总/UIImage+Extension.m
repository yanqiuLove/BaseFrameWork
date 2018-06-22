//
//  UIImage+Extension.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/2.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)resizableImageWithImageName:(NSString *)name
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
