//
//  DrawVc.m
//  MyModelServer
//
//  Created by Bad on 2018/11/8.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "DrawVc.h"


@interface DrawVc()

@property (nonatomic , strong) UIBezierPath *path;
@property (nonatomic , weak)   CALayer      *dotLayer;

@end


@implementation DrawVc

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

+(Class)layerClass{
    return [CAReplicatorLayer class];
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self MyPan];
    }
    
    return self;
    
}

//开始绘制
-(void)start{
    //添加动画
    CAKeyframeAnimation *anim =[CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 4;
    
    [self.dotLayer addAnimation:anim forKey:nil];
}

//重新绘制
-(void)reDraw{
    //把路径清空
    [self.path removeAllPoints];
    [self setNeedsDisplay];
    
    //移除动画
    [self.dotLayer removeAllAnimations];
}

//添加手势
-(void)MyPan{
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
    
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
  
    self.path = path;
    
    //创建粒子
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(-10, 0, 10, 10);
    dotLayer.backgroundColor = [UIColor redColor].CGColor;
    self.dotLayer = dotLayer;
    [self.layer addSublayer:dotLayer];
    
    
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    
    repL.instanceCount = 20;
    repL.instanceDelay = 0.25;
}

//手势动画
-(void)pan:(UIPanGestureRecognizer *)pan{
    
    
    //开始绘制
    
    //获取手指当前点
    CGPoint curP = [pan locationInView:self];
    
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
          [self.path moveToPoint:curP];
       
    }else if(pan.state == UIGestureRecognizerStateChanged){
        
        
        [self.path addLineToPoint:curP];
        
        //重绘
        [self setNeedsDisplay];
    }
    
    
}

//绘制
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.path stroke];
    
}


@end
