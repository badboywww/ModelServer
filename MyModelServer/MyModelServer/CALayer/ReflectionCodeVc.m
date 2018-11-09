//
//  ReflectionCodeVc.m
//  MyModelServer
//
//  Created by Bad on 2018/11/8.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "ReflectionCodeVc.h"

@interface ReflectionCodeVc(){
    CGRect ImageFrame;
}

@end

@implementation ReflectionCodeVc

+(Class)layerClass{
    
    return  [CAReplicatorLayer class];
    
}

//添加图片设置倒影层
-(void)setAddImgae:(UIImage *)image{
    
    NSLog(@"%lf",(float)self.bounds.size.height);
    
    CGFloat image_w =self.bounds.size.width;
    CGFloat image_h =self.bounds.size.height;
    
    UIImageView *imageVc = [[UIImageView alloc]initWithImage:image];
    imageVc.frame = CGRectMake(0, 0, image_w, image_h/2);
    [self addSubview:imageVc];
    
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 2;
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    //复制层子控件，按照复制层的锚点旋转
    repL.instanceRedOffset   -= 0.1;
    repL.instanceGreenOffset -= 0.1;
    repL.instanceBlueOffset  -= 0.1;
    repL.instanceAlphaOffset -= 0.1;
    
    
}


@end
