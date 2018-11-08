//
//  ReflectionVc.m
//  MyModelServer
//
//  Created by Bad on 2018/11/8.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "ReflectionVc.h"

@interface ReflectionVc()
@property (weak, nonatomic) IBOutlet UIImageView *OneImageVc;

@end


@implementation ReflectionVc

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(Class)layerClass{
    
    return  [CAReplicatorLayer class];
  
}

+(instancetype)ReflectionsVc{
    return [[NSBundle mainBundle]loadNibNamed:@"ReflectionVc" owner:nil options:nil][0];
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
         self = [[NSBundle mainBundle]loadNibNamed:@"ReflectionVc" owner:nil options:nil][0];
        [self ReflectionAction];
    }
    
    return self;
}

-(void)ReflectionAction{
    
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 2;
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    //复制层子控件，按照复制层的锚点旋转
    repL.instanceRedOffset   -= 0.1;
    repL.instanceGreenOffset -= 0.1;
    repL.instanceBlueOffset  -= 0.1;
    repL.instanceAlphaOffset -= 0.1;
}

@end
