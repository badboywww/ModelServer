//
//  MyImgeView.m
//  project
//
//  Created by Bad on 2018/10/13.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MyImgeView.h"

@implementation MyImgeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

-(instancetype)initWithImage:(UIImage *)image{
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        _image = image;
    }
    
    return self;
}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    
    [self setNeedsDisplay];
    
    
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.image drawInRect:rect];
}

@end
