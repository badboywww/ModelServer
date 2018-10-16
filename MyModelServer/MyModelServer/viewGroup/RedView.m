//
//  RedView.m
//  project
//
//  Created by Bad on 2018/9/24.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "RedView.h"

@implementation RedView

//手指开始触摸view的做事情
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    NSLog(@"%s",__func__);
//}

// 手指在view上移动时

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    //当前控件随着手指移动而移动

    //获取UITouch
    UITouch *touch = [touches anyObject];

    //获取当前点
    CGPoint curP = [touch locationInView:self];

    //获取上一个点
    CGPoint preP = [touch previousLocationInView:self];

    //计算手指偏移量
    CGFloat offsetX= curP.x - preP.x;
    CGFloat offsetY= curP.y - preP.y;

    //修改控件形变
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);

    
   
}

////手指离开当前view的时候
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    NSLog(@"%s",__func__);
//}

//当触摸事件被打断的时候调用
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"%s",__func__);
}

@end
