//
//  WheelButton.m
//  MyModelServer
//
//  Created by Bad on 2018/11/6.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "WheelButton.h"

@implementation WheelButton

//返回按钮中的UIimgaeView 的尺寸
//contentRect 当前按钮尺寸位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat w = 44;
    CGFloat h = 50;
    CGFloat x = (contentRect.size.width - w) * 0.5;
    CGFloat y = 20;
  
    
    return CGRectMake(x, y, w, h);
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
