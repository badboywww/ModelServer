//
//  UIView+CALayer.h
//  MyModelServer
//
//  Created by Bad on 2018/11/6.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface UIView (CALayer)

#pragma mark 视图动画
/**
    图标抖动
 */
+(CAAnimation *)setTranslationView:(UIView *)view;

/**
    图标按线运动
 */
+(CAAnimation *)setLineView:(UIView *)view X:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h;


/**
 转场动画:
 */
+(CATransition *)setTransitionAnimationImageView:(UIImageView *)imageVc imageArray:(NSMutableArray *)ArrVc AnimationType:(NSString *)type AnimationSubtype:(NSString *)subtype;

@end

NS_ASSUME_NONNULL_END
