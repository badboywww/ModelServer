//
//  UIImage+HRExtension.h
//  HRKJ
//
//  Created by Bad on 2018/3/10.
//  Copyright © 2018年 Mr.GBLW. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIImage (HRExtension)
/**
    根据宽度重新计算图片的高度比
 */
- (UIImage *)scaleToWidth:(CGFloat)width;


@end
NS_ASSUME_NONNULL_END
