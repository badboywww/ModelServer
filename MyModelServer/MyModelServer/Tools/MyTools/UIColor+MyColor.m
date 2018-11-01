//
//  UIColor+MyColor.m
//  MyModelServer
//
//  Created by Bad on 2018/10/25.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "UIColor+MyColor.h"

@implementation UIColor (MyColor)


+(UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256)/255.0;
    CGFloat g = arc4random_uniform(256)/255.0;
    CGFloat b = arc4random_uniform(256)/255.0;
    
    //0~255
    return  [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    
}

@end
