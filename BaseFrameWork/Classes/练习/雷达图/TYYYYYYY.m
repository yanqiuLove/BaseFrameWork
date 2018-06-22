//
//  TYYYYYYY.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2018/1/23.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "TYYYYYYY.h"

@implementation TYYYYYYY
- (UIImage *)image {
    if (_image == nil) {
        _image = [UIImage imageWithData:self.imageData];
    }
    return _image;
}
- (NSData *)imageData {
    if (_imageData == nil) {
        _imageData = UIImageJPEGRepresentation(self.image,1);
    }
    return _imageData;
}
+ (NSArray *)transients {
    return @[@"image"];
}

/**
 
 《北京市房屋建筑使用安全管理办法》自2011年5月1日起施行。第三十条违反本办法第八条第(三)项规定(一)擅自变动房屋建筑主体和承重结构是禁止的。
 
 
 */
@end
