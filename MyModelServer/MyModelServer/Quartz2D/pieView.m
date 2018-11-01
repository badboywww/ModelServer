//
//  pieView.m
//  project
//
//  Created by Bad on 2018/10/11.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "pieView.h"

@implementation pieView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

-(void)setPieArray:(NSArray *)PieArray{
    _PieArray = PieArray;
    
    //如果手动调用，系统无法为我们生成上下文。需要系统调用
    [self drawRect:self.bounds];
    
    //系统自动调用 drawRect 方法
    [self setNeedsDisplay];
    
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSNumber *sum;
    if (_PieArray.count > 1) {
        sum = [_PieArray valueForKeyPath:@"@sum.floatValue"];
    }else{
        sum = @1;
    }
    
    NSLog(@"sum = %d" ,sum.intValue);
    
    CGPoint center =  CGPointMake(self.bounds.size.width * 0.5 , self.bounds.size.height * 0.5);
    CGFloat radius = self.bounds.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    
   
    
    for (NSNumber *num in _PieArray) {
        
        startA = endA;
        angle = num.intValue / sum.floatValue * M_PI * 2;
        
       
        endA = startA + angle;
        NSLog(@"startA:%f--endA:%f--angle:%f",startA,endA,angle);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor randomColor]set];
        [path fill];
    }
 
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setNeedsDisplay];
}


-(void)drawPie{
    //画扇形
    CGPoint center =  CGPointMake(self.bounds.size.width * 0.5 , self.bounds.size.height * 0.5);
    CGFloat radius = self.bounds.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 25 / 100.0 * M_PI * 2;
    CGFloat endA = startA + angle;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor redColor]set];
    [path fill];
    
    
    startA=endA;
    angle = 25 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor yellowColor]set];
    [path fill];
    
    startA=endA;
    angle = 50 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor blueColor]set];
    [path fill];
}


@end
