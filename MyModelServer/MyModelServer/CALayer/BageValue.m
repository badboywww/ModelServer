//
//  BageValue.m
//  MyModelServer
//
//  Created by Bad on 2018/11/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "BageValue.h"

@interface BageValue()

@property(nonatomic , weak) UIView *smallCircle;
@property(nonatomic , weak) CAShapeLayer *shap;

@end

@implementation BageValue

-(CAShapeLayer *)shap{
    
    if (_shap == nil) {
        //创建形状图层
        CAShapeLayer *shap = [CAShapeLayer layer];
        shap.fillColor = self.backgroundColor.CGColor;
        _shap = shap;
        [self.superview.layer insertSublayer:shap atIndex:0];
    }
    
    return _shap;
    
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
     [self setUp];
    
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUp];
    }
    
    return self;
    
}

//初始化
- (void) setUp{
    
    //设置弧度
    self.layer.cornerRadius = 10;
    
    
    //设置文字大小
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
    //设置背景颜色
    [self setBackgroundColor:[UIColor redColor]];
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
    
    
    //添加小圆
    UIView *smallCircle = [[UIView alloc]init];
    smallCircle.frame = self.frame;
    smallCircle.layer.cornerRadius = self.layer.cornerRadius;
    smallCircle.backgroundColor = self.backgroundColor;
    self.smallCircle = smallCircle;
    //在那个View下面添加
    [self.superview insertSubview:smallCircle belowSubview:self];
    
   
    
}

//计算两个圆的距离
- (CGFloat)distanceWithSmallCircle:(UIView *)smallCircle BigCircle:(UIView *)bigCircle{
    
    
    CGFloat offsetX = bigCircle.center.x - smallCircle.center.x;
    CGFloat offsetY = bigCircle.center.y - smallCircle.center.y;
    
    
    return sqrt(offsetX * offsetX + offsetY * offsetY);
}


//根据两个圆计算不规则路径
-(UIBezierPath *)pathWithSmallCircle:(UIView *)smallCircle BigCircle:(UIView *)bigCircle{
    
    //小圆 X1 Y1  大圆 X2 Y2
    
    
    CGFloat X1 = smallCircle.center.x;
    CGFloat Y1 = smallCircle.center.y;
    
    CGFloat X2 = bigCircle.center.x;
    CGFloat Y2 = bigCircle.center.y;
    
    CGFloat d = [self distanceWithSmallCircle:smallCircle BigCircle:bigCircle];
    
    CGFloat cosθ = (Y2 - Y1) / d;
    CGFloat sinθ = (X2 - X1) / d;
    
    CGFloat R1 = smallCircle.wwy_width * 0.5;
    CGFloat R2 = bigCircle.wwy_width * 0.5;
    
    CGPoint pointA = CGPointMake(X1 - R1 * cosθ, Y1 + R1 * sinθ);
    CGPoint pointB = CGPointMake(X1 + R1 * cosθ, Y1 - R1 * sinθ);
    
    CGPoint pointC = CGPointMake(X2 + R2 * cosθ, Y2 - R2 * sinθ);
    CGPoint pointD = CGPointMake(X2 - R2 * cosθ, Y2 + R2 * sinθ);
    
    
    CGPoint pointO = CGPointMake(pointA.x + d * 0.5 * sinθ, pointA.y + d * 0.5 * cosθ);
    CGPoint pointP = CGPointMake(pointB.x + d * 0.5 * sinθ, pointB.y + d * 0.5 * cosθ);
    
    //描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //AB
    [path moveToPoint:pointA];
    [path addLineToPoint:pointB];
    //BC(曲线)
    [path addQuadCurveToPoint:pointC controlPoint:pointP];
    //CD
    [path addLineToPoint:pointD];
    //DA(曲线)
    [path addQuadCurveToPoint:pointA controlPoint:pointO];
    
    return path;
    
}


//手势
- (void)pan:(UIPanGestureRecognizer *)pan{
    
    
    //当前移动偏移量
    CGPoint tranP = [pan translationInView:self];
    
    //移动
    // transform 没有改变 center
//    self.transform = CGAffineTransformTranslate(self.transform, tranP.x, tranP.y);
    
    CGPoint center = self.center;
    center.x += tranP.x;
    center.y += tranP.y;
    self.center = center;
    
    //复位
    [pan setTranslation:CGPointZero inView:self];
    
    //计算距离
    CGFloat distance = [self distanceWithSmallCircle:self.smallCircle BigCircle:self];
    
    //去出小圆半径
    CGFloat radius = self.bounds.size.width * 0.5;
    
    radius = radius - distance / 10.0;
    
    //重新设置小圆的宽高
    self.smallCircle.bounds = CGRectMake(0, 0, radius * 2, radius * 2);
    self.smallCircle.layer.cornerRadius = radius;
    
    
    if (self.smallCircle.hidden == 0) {
        //返回不规则路径
        UIBezierPath *path = [self pathWithSmallCircle:self.smallCircle BigCircle:self];
        
        //路径转换成图形
        self.shap.path = path.CGPath;
    }

    //判断拖动距离，隐藏
    if (distance > 60) {
        self.smallCircle.hidden = YES;
        [self.shap removeFromSuperlayer];
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        if (distance < 60) {
            [self.shap removeFromSuperlayer];
            self.center = self.smallCircle.center;
            self.smallCircle.hidden = NO;
        }else{
            
            //播放一个动画，再做消失
            UIImageView *imageV = [[UIImageView alloc]initWithFrame:self.bounds];
            NSMutableArray *imageArray = [NSMutableArray array];
            
            for (int i = 0; i < 8; i++) {
                NSString *imageName = [NSString stringWithFormat:@"1%d",i+1];
                UIImage *image = [UIImage imageNamed:imageName];
                [imageArray addObject:image];
            }
            imageV.animationImages = imageArray;
            [imageV setAnimationDuration:1];
            [imageV startAnimating];
            [self addSubview:imageV];
            
            //消失
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
            });
            
        }
        
        
    }
    
}


//重写高亮状态
-(void)setHighlighted:(BOOL)highlighted{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
