//
//  DrawView.m
//  project
//
//  Created by Bad on 2018/10/14.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    
    
    
}

//上下文状态栈
-(void)oneView{
    /*
     1.获取view相关的上下文
     2.描述路径
     3.把路径添加到上下文
     4.把上下文内容渲染
     */
    
    //1.
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.
    UIBezierPath *path = [UIBezierPath bezierPath];
    //添加横线
    [path moveToPoint:CGPointMake(10, 150)];
    [path addLineToPoint:CGPointMake(290, 150)];
    
    //储存上下文栈
    CGContextSaveGState(ctx);
    //设置状态
    //    [[UIColor redColor]set];
    //    CGContextSetLineWidth(ctx, 10);
    //3.
    CGContextAddPath(ctx, path.CGPath);
    //4.
    CGContextStrokePath(ctx);
    
    //恢复上下文状态栈
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(150, 10)];
    [path addLineToPoint:CGPointMake(150, 290)];
    CGContextRestoreGState(ctx);
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

//图形上下文矩阵操作
-(void)twoView{
    /*
     1.获取view相关的上下文
     2.描述路径
     3.把路径添加到上下文
     4.把上下文内容渲染
     */
    
    //1.
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    [[UIColor redColor]set];
    
    //平移 上下文的矩阵操作在添加路径之前操作
    CGContextTranslateCTM(ctx, 100, 50);
    //缩放
    CGContextScaleCTM(ctx, 0.5, 0.6);
    //旋转
    CGContextRotateCTM(ctx, M_PI_4);
    
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
}

@end
