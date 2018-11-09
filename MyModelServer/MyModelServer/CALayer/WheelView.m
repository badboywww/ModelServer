//
//  WheelView.m
//  MyModelServer
//
//  Created by Bad on 2018/11/6.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "WheelView.h"

@interface WheelView()

@property (weak, nonatomic) IBOutlet UIImageView *contentV;

@property (nonatomic , weak) WheelButton *preBtn; //上一个选中的按钮

@property (nonatomic , strong)CADisplayLink *link;

@end

@implementation WheelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(CADisplayLink *)link{
    
    if (_link == nil) {
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        
        _link = link;
    }
    
    return _link;
}
    

-(void)awakeFromNib{
    
    [super awakeFromNib];
    //添加按钮
    [self setUP];
}

+(instancetype)wheelsView{
    return [[NSBundle mainBundle]loadNibNamed:@"WheelView" owner:nil options:nil][0];
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[NSBundle mainBundle]loadNibNamed:@"WheelView" owner:nil options:nil][0];
       [self setUP];
        
    }
    
    return self;
}

//添加按钮
-(void)setUP{
    
self.contentV.userInteractionEnabled = YES;

    //创建按钮
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    //旋转角度
    CGFloat angle = 0;
    
    //加载按钮原始图片
    UIImage *oriImage = [UIImage imageNamed:@"LuckyAstrology"];
    //选中
    UIImage *oriSelImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    //获取当前屏幕与像素坐标的比例
    CGFloat scale = [UIScreen mainScreen].scale;
    
    CGFloat clipW = oriImage.size.width / 12 * scale;
    CGFloat clipH = oriImage.size.height * scale;
    CGFloat clipX = 0;
    CGFloat clipY = 0;

    for (int i = 0; i < 12;i++) {
        WheelButton *btn = [WheelButton buttonWithType:UIButtonTypeCustom];
        
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
        
        //设置锚点 x,y 1是最大值
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        
        
        //裁剪按钮图片某一区域
        clipX = i * clipW;
        CGRect rect = CGRectMake(clipX, clipY, clipW, clipH); //裁剪区域
        //正常
        CGImageRef clipImage = CGImageCreateWithImageInRect(oriImage.CGImage, rect);
        //选中
        CGImageRef clipSelImage = CGImageCreateWithImageInRect(oriSelImage.CGImage, rect);
       
        //设置按钮图片
        //CGImageRef → UIImage
        
        //正常
        UIImage *image = [UIImage imageWithCGImage:clipImage];
        [btn setImage:image forState:UIControlStateNormal];
        
        //选中
        UIImage *Selimage = [UIImage imageWithCGImage:clipSelImage];
        [btn setImage:Selimage forState:UIControlStateSelected];
        
        //设置选中图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        //监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //添加按钮
        [self.contentV addSubview:btn];
        
        //每一个按钮进行旋转
        btn.transform = CGAffineTransformMakeRotation(angle / 180.0 * M_PI);
        angle += 30;
        
        //第一个按钮成为选中状态
        if(i == 0){
            [self btnClick:btn];
        }
        
    }
    
}

//当按钮点击时监听
-(void)btnClick:(WheelButton *)sender{
    
    //让上一个选中的按钮，取消选中
    self.preBtn.selected = NO;
    //让当前按钮成为选中
    sender.selected = YES;
    //把当前按钮赋值上一个按钮
    self.preBtn = sender;
    
}

//开始旋转
-(void)start{
    self.link.paused = NO;
}

-(void)update{
    
    //让转盘开始旋转
    self.contentV.transform = CGAffineTransformRotate(self.contentV.transform, M_PI / 180.0);
}

//暂停旋转
-(void)stop{
    self.link.paused = YES;
}

//开始选号
- (IBAction)startChooseAction:(id)sender {
    
    
    //先赞同选择器
    self.link.paused = YES;
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 3);
    anim.duration = 1;
    anim.delegate =self;
    
    [self.contentV.layer addAnimation:anim forKey:nil];
    
    
}

//当核心动画停止的时候调用.
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //拿当选中按钮的旋转角度.
    CGAffineTransform transform = self.preBtn.transform;
    
    CGFloat angel = atan2f(transform.b, transform.a);
    
    //让ContentV倒着旋转回去.
    self.contentV.transform = CGAffineTransformMakeRotation(-angel);
}

    

@end
