//
//  UIImage+Watermark.m
//  project
//
//  Created by Bad on 2018/10/14.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "UIImage+Watermark.h"

@implementation UIImage (Watermark)


#pragma mark 加水印
// CGSize size: 开启一个多大图片的上下文   opaque:不透明度 一般为 NO    CGFloat scale : 要不要缩放 一般为0
+(UIImage *)setImageAddWatermark:(UIImage *)image ImageSize:(CGSize)size Opaque:(BOOL)opaque Scale:(CGFloat)scale Watermarkstr:(NSString *)str WatermarkstrColor:(UIColor *)strColor StrFont:(float)font{
    
    //开始图片上下文
    UIGraphicsBeginImageContextWithOptions(size, opaque,scale);
    
    //把图片添加到图片上下文中
    [image drawAtPoint:CGPointZero];
    
    //绘制文字
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    dict[NSStrokeWidthAttributeName] = @4;
    dict[NSForegroundColorAttributeName] = strColor;
    
    CGFloat str_X=size.width;
    CGFloat str_Y=size.height;
    CGFloat str_w = [str setTextSize:str Font:font].width;
    CGFloat str_h = [str setTextSize:str Font:font].height;
    
    [str drawAtPoint:CGPointMake(str_X-str_w-5, str_Y-str_h-5) withAttributes:dict];
    
    //生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //手动关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark 裁剪头像
+(UIImage *)setImageAddCutpicture:(UIImage *)image ImageSize:(CGSize)size Opaque:(BOOL)opaque Scale:(CGFloat)scale NewImageWidth:(CGFloat)newimagewidth{
    
    
    UIGraphicsBeginImageContextWithOptions(size, opaque,scale);
    
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.width)];
    
    //把路径设置成裁剪区域
    [path addClip];
    
    [image drawAtPoint:CGPointZero];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    newImage = [newImage scaleToWidth:newimagewidth];
    UIGraphicsEndImageContext();
    
    
    
    
    return newImage;
    
}


+(UIImage *)imageWithBorderWidth:(CGFloat)borderW BorderColor:(UIColor *)color image:(UIImage *)image NewImageWidth:(CGFloat)newimagewidth {
    
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    //大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    
    //小圆
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    [path addClip];
    
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    newImage = [newImage scaleToWidth:newimagewidth];
    UIGraphicsEndImageContext();
    
    
    
    
    return newImage;
}

@end
