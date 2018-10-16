//
//  UIImage+Watermark.h
//  project
//
//  Created by Bad on 2018/10/14.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Watermark)

/**
    给指定图片加水印
    Watermark: 图片
    ImageSize:开启一个多大图片的上下文
    Opaque:不透明度 一般为 NO
    Scale:图片是否需要缩放 一般为0
    Watermarkstr:水印所添加的文字
    WatermarkstrColor:文字的颜色
    StrFont:文字的字号
 */

-(UIImage *)setImageAddWatermark:(UIImage *)image ImageSize:(CGSize)size Opaque:(BOOL)opaque Scale:(CGFloat)scale Watermarkstr:(NSString *)str WatermarkstrColor:(UIColor *)strColor StrFont:(float)font;

@end

NS_ASSUME_NONNULL_END
