//
//  MusicalvibrationVc.m
//  MyModelServer
//
//  Created by Bad on 2018/11/8.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MusicalvibrationVc.h"

@implementation MusicalvibrationVc


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //创建一个音量震动条
        CALayer *layer = [CALayer layer];
        CGFloat w = 30;
        CGFloat h = 100;
        layer.bounds = CGRectMake(0, 0, w, h);
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.anchorPoint = CGPointMake(0, 1);
        layer.position = CGPointMake(0, self.bounds.size.height);
        
        //复制层
        CAReplicatorLayer *repl = [CAReplicatorLayer layer];
        repl.frame = self.bounds;
        
        int num = self.frame.size.width / (w+10);
        
        repl.instanceCount = num;
        repl.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
        //设置动画延时执行时间
        repl.instanceDelay = 0.3;
        
        //添加动画
        CABasicAnimation *anim = [CABasicAnimation animation];
        anim.keyPath = @"transform.scale.y";
        anim.toValue = @0;
        anim.duration = 0.5;
        anim.repeatCount = MAXFLOAT;
        anim.autoreverses = YES;
        
        [layer addAnimation:anim forKey:nil];
        [repl addSublayer:layer];
        [self.layer addSublayer:repl];
    }

    return self;
}


@end
