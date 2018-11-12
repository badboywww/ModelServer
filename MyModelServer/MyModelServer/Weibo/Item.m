//
//  Item.m
//  MyModelServer
//
//  Created by Bad on 2018/11/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "Item.h"

@implementation Item

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUp];
    }
    
    return self;
    
}

//按钮初始化
-(void)setUp{
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.8;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleW = imageW;
    CGFloat titleH = self.bounds.size.height - imageH;
    CGFloat titleX = imageX;
    CGFloat titleY = imageH;
    
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
