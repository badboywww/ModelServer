//
//  UIView+CALayer.m
//  MyModelServer
//
//  Created by Bad on 2018/11/6.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "UIView+CALayer.h"
#define Angle2Rad(angle) ((angle) / 180.0 * M_PI)
@implementation UIView (CALayer)


#pragma mark 图标抖动

+(CAAnimation *)setTranslationView:(UIView *)view{
    
    //创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    //设置属性
    anim.keyPath = @"transform.rotation";
    
    anim.values = @[@(Angle2Rad(-5)),@(Angle2Rad(5)),@(Angle2Rad(-5))];
    
    anim.repeatCount = MAXFLOAT;
    
    anim.duration = 0.25;
    
    anim.autoreverses = YES;
    
    
    return anim;
}

#pragma mark 按线运动
+(CAAnimation *)setLineView:(UIView *)view X:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h{
        //创建帧动画
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
        //设置属性值
        anim.keyPath =@"position";
    
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, w, h)];
        anim.path = path.CGPath;

        anim.repeatCount = MAXFLOAT;
    
        anim.duration = 1;
    
        anim.autoreverses = YES;
    
    return anim;
}


#pragma mark 转场动画
/*
 
 AnimationType:
        kCATransitionFade   淡出
        kCATransitionMoveIn 覆盖原图
        kCATransitionPush   推出
        kCATransitionReveal 底部显出来
        pageCurl            向上翻一页
        pageUnCurl          向下翻一页
        rippleEffect        滴水效果
        suckEffect          收缩效果
        cube                立方体效果
        oglFlip             上下翻转效果
 
 AnimationSubtype:
        kCATransitionFromRight  从右
        kCATransitionFromLeft   从左
        kCATransitionFromTop    从上
        kCATransitionFromBottom 从下
 */
static int _i = 1;
+(CATransition *)setTransitionAnimationImageView:(UIImageView *)imageVc imageArray:(NSMutableArray *)ArrVc AnimationType:(NSString *)type AnimationSubtype:(NSString *)subtype{
    
  //  2
    if (_i > ArrVc.count-1) {
        _i = 0;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%@",ArrVc[_i]];
    imageVc.image = [UIImage imageNamed:imageName];
    _i++;
    
    //转场动画
    CATransition *anim = [CATransition animation];
    
    //转场类型
    anim.type = type;
    
    //转场方向
    anim.subtype = subtype;
    
    //    //动画开始点
    //    anim.startProgress = 0.2;
    //
    //    //动画结束点
    //    anim.endProgress = 0.5;
    
    anim.duration = 1;
    
    
    return anim;
}



@end
