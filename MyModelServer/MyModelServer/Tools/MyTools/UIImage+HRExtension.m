//
//  UIImage+HRExtension.m
//  HRKJ
//
//  Created by Bad on 2018/3/10.
//  Copyright © 2018年 Mr.GBLW. All rights reserved.
//

#import "UIImage+HRExtension.h"

@implementation UIImage (HRExtension)

-(UIImage *)scaleToWidth:(CGFloat)width{
    
    if (width > self.size.width) {
        return  self;
    }
    // 计算缩放之后的高度
    CGFloat height = (width / self.size.width) * self.size.height;
    // 初始化要画的大小
    CGRect  rect = CGRectMake(0, 0, width, height);
    
    // 1. 开启图形上下文
    
    UIGraphicsBeginImageContext(rect.size);
    
    // 2. 画到上下文中 (会把当前image里面的所有内容都画到上下文)
    
    [self drawInRect:rect];
    
    // 3. 取到图片
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4. 关闭上下文
    
    UIGraphicsEndImageContext();
    
    // 5. 返回
    
    return image;
    
  
}


@end
