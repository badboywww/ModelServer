//
//  OneView.m
//  project
//
//  Created by Bad on 2018/10/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "OneView.h"

@implementation OneView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    //如果手动调用，系统无法为我们生成上下文。需要系统调用
    [self drawRect:self.bounds];
    
    //系统自动调用 drawRect 方法
    [self setNeedsDisplay];
    
}

//作用：专门绘制图画
//调用：在view上显示时调用
//rect : 当前view 的 bounds
//

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
   
    
#pragma mark 直线
   // [self draw];
#pragma mark 曲线
    //[self curve];
#pragma mark 画图形
   // [self Graphics];
#pragma mark 圆角矩形 -> 圆
// UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 200, 50, 50) cornerRadius:20];
//    [[UIColor blueColor]set];
//    [path fill];
    
#pragma mark 椭圆 -> 圆
//    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 50)];
//    [[UIColor blueColor]set];
//    [path fill];

#pragma mark 弧 -> 扇形
    /*
     ArcCenter 圆心
     radius    半径
     startAngle 开始角度 起始点是圆的最右侧
     endAngle   截止角度
     clockwise  顺时针、逆时针 YES ：顺 NO：逆
    */
    
//    CGPoint center =  CGPointMake(rect.size.width * 0.5, rect.size.height *0.5);
//    CGFloat radius = rect.size.width * 0.5 - 10;
//    CGFloat startA = 0;
//    CGFloat endA = -M_PI_4;
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:NO];
//    
//    [path addLineToPoint:center];
//    [path closePath];
//    
//    
//    [[UIColor blueColor]set];
//   
//    [path stroke];
    

#pragma mark 进度条画图
    
    //画弧
    
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    CGFloat radius = rect.size.width/2 - 10;
    
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 +self.progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    [[UIColor whiteColor]set];
    
    [path stroke];
    
    
    
}

//画直线
-(void)drawLine{
    
    //1.取得跟view相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.添加路径
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    //第一条线
    [path moveToPoint:CGPointMake(10, 100)]; //设置起点
    [path addLineToPoint:CGPointMake(200, 20)]; //添加一根线到某点
    
    //第二条线
    [path moveToPoint:CGPointMake(10, 150)]; //设置起点
    [path addLineToPoint:CGPointMake(200, 100)]; //添加一根线到某点
    
    //第三条线
    [path addLineToPoint:CGPointMake(150, 200)]; //上一条的终点成下一条的起点
    
    //2.1 设置上下文状态
    CGContextSetLineWidth(ctx, 10); //设置宽度
    CGContextSetLineJoin(ctx, kCGLineJoinRound); //设置连接样式
    CGContextSetLineCap(ctx, kCGLineCapRound); //设置顶角的样式
    
    [[UIColor whiteColor]setStroke]; //设置颜色
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文内容在view上显示
    CGContextStrokePath(ctx);
}

//画曲线
-(void)curve{
    
    //1.取得跟view相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.添加路径
    UIBezierPath *path=[UIBezierPath bezierPath];
 
    [path moveToPoint:CGPointMake(20, 200)];
    //QuadCurveToPoint 终点
    //controlPoint 控制点
    [path addQuadCurveToPoint:CGPointMake(200, 200) controlPoint:CGPointMake(100, 10)];
    
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文内容在view上显示
    CGContextStrokePath(ctx);
}

//画图形
-(void)Graphics{
    
    
    //1.取得跟view相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.添加路径
    UIBezierPath *path ;
   path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)]; //矩形
   
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文内容在view上显示
    
    //CGContextStrokePath(ctx); //框
    
    [[UIColor yellowColor]set];
    CGContextFillPath(ctx);// 填充
}


@end
