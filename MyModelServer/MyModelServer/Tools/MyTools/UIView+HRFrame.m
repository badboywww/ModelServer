//
//  UIView+HRFrame.m
//  HRKJ
//
//  Created by Bad on 2018/3/6.
//  Copyright © 2018年 Mr.GBLW. All rights reserved.
//

#import "UIView+HRFrame.h"

@implementation UIView (HRFrame)
//宽
-(void)setWwy_width:(CGFloat)wwy_width{
    CGRect rect=self.frame;
    rect.size.width = wwy_width;
    self.frame=rect;
}
-(CGFloat)wwy_width{
    return self.frame.size.width;
}

//高
-(void)setWwy_height:(CGFloat)wwy_height{
    CGRect rect=self.frame;
    rect.size.height=wwy_height;
    self.frame=rect;
}
-(CGFloat)wwy_height{
    return self.frame.size.height;
}

//x
-(void)setWwy_x:(CGFloat)wwy_x{
    CGRect rect=self.frame;
    rect.origin.x=wwy_x;
    self.frame=rect;
    
}
-(CGFloat)wwy_x{
    return self.frame.origin.x;
}

//y

-(void)setWwy_y:(CGFloat)wwy_y{
    CGRect rect=self.frame;
    rect.origin.y=wwy_y;
    self.frame=rect;
    
}
-(CGFloat)wwy_y{
    return self.frame.origin.y;
}

-(void)setWwy_centerX:(CGFloat)wwy_centerX{
    CGPoint center=self.center;
    center.x=wwy_centerX;
    self.center=center;
    
}
-(CGFloat)wwy_centerX{
    return self.center.x;
}
-(void)setWwy_centerY:(CGFloat)wwy_centerY{
    CGPoint center=self.center;
    center.y=wwy_centerY;
    self.center=center;
}
-(CGFloat)wwy_centerY{
    return self.center.y;
}
@end
