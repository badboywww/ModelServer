//
//  UIImage+Watermark.m
//  project
//
//  Created by Bad on 2018/10/14.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "UIImage+Watermark.h"

@implementation UIImage (Watermark)

// CGSize size: 开启一个多大图片的上下文   opaque:不透明度 一般为 NO    CGFloat scale : 要不要缩放 一般为0
-(UIImage *)setImageAddWatermark:(UIImage *)image ImageSize:(CGSize)size Opaque:(BOOL)opaque Scale:(CGFloat)scale Watermarkstr:(NSString *)str WatermarkstrColor:(UIColor *)strColor StrFont:(float)font{
    
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

@end
