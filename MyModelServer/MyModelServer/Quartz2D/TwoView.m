//
//  TwoView.m
//  project
//
//  Created by Bad on 2018/10/13.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "TwoView.h"

@implementation TwoView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)startTimer{
    
    //为了保证UI刷新在主线程中完成。
    
    [self performSelectorOnMainThread:@selector(startTimeroOnMainThread) withObject:nil waitUntilDone:NO];
    
}

#pragma -mark 初始化定时器

- (void)startTimeroOnMainThread{
    
//    if (!_timer) {
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/3 target:self selector:@selector(update) userInfo:nil repeats:YES];
//         [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
//
//    }
    
    //创建 CADisplayLink （屏幕刷新一次调用一次，每一秒调用60次）
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}




-(void)update{
    
    _snowY += 10;
    
    if (_snowY > self.bounds.size.height) {
        _snowY = 0;
    }
    
    // 他并非立马调用，只是设定一个标志，在下一次屏幕刷新时调用
    [self setNeedsDisplay];
}

static int _snowY = 0;

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage * image = [UIImage imageNamed:@"ICE"];
    
    [image drawAtPoint:CGPointMake(0, _snowY)];
 
    [self startTimer];
}

//绘制文字
-(void)drawText{
    NSString *str = @"王文远";
    
    //AtPoint 文字所画的位置
    //withAttributes 文字属性
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:30];               //设置字体大小
    dict[NSForegroundColorAttributeName] = [UIColor greenColor];            //设置字体颜色
    dict[NSStrokeWidthAttributeName] = @2;                                  //设置字体描边
    dict[NSStrokeColorAttributeName] = [UIColor blueColor];                 //设置描边颜色
    
    NSShadow *shadow=[[NSShadow alloc]init];                                //设置阴影
    shadow.shadowOffset = CGSizeMake(10, 10);                               //阴影位置
    shadow.shadowColor  = [UIColor greenColor];                             //阴影颜色
    shadow.shadowBlurRadius = 2;                                            //阴影模糊程度
    dict[NSShadowAttributeName] = shadow;
    
    
    // [str drawAtPoint:CGPointZero withAttributes:dict];                //无法自动换行
    [str drawInRect:self.bounds withAttributes:dict];                          //自动换行
}

//绘制图片
-(void)drawImg{
    // 1. 加载图片
    UIImage *img=[UIImage imageNamed:@"001"];
    
    //    [img drawAtPoint:CGPointZero]; //绘制图片原有图片尺寸
    //    [img drawInRect:rect];       //绘制图片充满在rect区域
    //    [img drawAsPatternInRect:rect];   //绘制图片平铺rect区域
    
    //    UIRectClip(CGRectMake(0, 0, 50, 50)); //添加裁剪区域，把超出裁剪区域的图片裁减掉
    //    [img drawAsPatternInRect:self.bounds];
}

@end
