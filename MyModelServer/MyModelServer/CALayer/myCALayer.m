//
//  myCALayer.m
//  MyModelServer
//
//  Created by Bad on 2018/10/22.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "myCALayer.h"

@implementation myCALayer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //UIView 本身就自带阴影效果，他是透明的
    self.layer.shadowOpacity = 1;
    //设置阴影偏移量
    self.layer.shadowOffset = CGSizeMake(-30, -10);
    //设置模糊程度
    self.layer.shadowRadius = 10;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    
}

@end
