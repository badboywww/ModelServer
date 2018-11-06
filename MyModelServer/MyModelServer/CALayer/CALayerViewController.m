//
//  CALayerViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/10/22.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "CALayerViewController.h"

#define Angle2Rad(angle) ((angle) / 180.0 * M_PI)

@interface CALayerViewController ()
{
    NSMutableArray *ImageArray;
}

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ImageArray = [NSMutableArray new];
    
    
    [self setNav];
    [self setUI];
}

-(void)setNav{
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"CALayer";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setUI{
    
//    UIView *myVc=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    myVc.backgroundColor=[UIColor redColor];
//
//    //UIView 本身就自带阴影效果，他是透明的
//    myVc.layer.shadowOpacity = 1;
//    //设置阴影偏移量
//    myVc.layer.shadowOffset = CGSizeMake(-30, -10);
//    //设置模糊程度
//    myVc.layer.shadowRadius = 10;
//    //设置阴影颜色
//    myVc.layer.shadowColor = [UIColor blackColor].CGColor;
//    //边框颜色
//    myVc.layer.borderColor = [UIColor greenColor].CGColor;
//    //边框宽度
//    myVc.layer.borderWidth = 2;
//    //设置圆角
//    myVc.layer.cornerRadius = 50;
//
//    [self.view addSubview:myVc];
    
    
    //  [self myCALayer];
    
    //转场动画
//    [self TransitionAnimation];
    
    //动画组
//    [self Animationgroup];
    
    //幸运大转盘
    [self setluck];
    
}

//幸运大转盘
-(void)setluck{
    
    UIButton *oneBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    oneBtn.frame = CGRectMake(50, 100, 100, 50);
    [oneBtn setTitle:@"开始旋转" forState:UIControlStateNormal];
    oneBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [oneBtn addTarget:self action:@selector(beginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneBtn];
    
    UIButton *twoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    twoBtn.frame = CGRectMake(Swidth-150, 100, 100, 50);
    [twoBtn setTitle:@"暂停" forState:UIControlStateNormal];
    twoBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [twoBtn addTarget:self action:@selector(stopClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twoBtn];
    
    
    _wheels = [WheelView wheelsView];
    
    _wheels.center = self.view.center;
    
    [self.view addSubview:_wheels];

}

//开始旋转
-(void)beginClick:(UIButton *)sender{
    [_wheels start];
}

//暂停旋转
-(void)stopClick:(UIButton *)sender{
    [_wheels stop];
}

 //动画组
-(void)Animationgroup{
    _myRedVc=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _myRedVc.backgroundColor = [UIColor redColor];
    [self.view addSubview:_myRedVc];
}

//转场动画
-(void)TransitionAnimation{
    
    for (int i=0; i<3; i++) {
        
        NSString *imgStr = [NSString stringWithFormat:@"%d",i+1];
        [ImageArray addObject:imgStr];
    }
    
    _myImageVc=[[UIImageView alloc]initWithImage:[UIImage imageNamed:ImageArray[0]]];
    _myImageVc.frame=CGRectMake(100, 180, 200, 200);

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myImageVc];
}

//3D 效果
-(void)myCALayer{
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(50, 70, 100, 100);
//    layer.backgroundColor = [UIColor redColor].CGColor;
//
//    [self.view.layer addSublayer:layer];
//
//    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    
    _myImageVc=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    _myImageVc.frame=CGRectMake(100, 180, 200, 200);
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myImageVc];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
#pragma mark 3D 效果
//    [UIView animateWithDuration:1 animations:^{
//        //旋转
//        self.myImageVc.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
//        //平移
//        self.myImageVc.layer.transform = CATransform3DMakeTranslation(100, 50, 0);
//        //缩放
//        self.myImageVc.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0);
        
        //kvc
        //结构体转成对象
        //做一些快速的缩放，平移，旋转
//        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
//        [self.myImageVc.layer setValue:@(M_PI) forKeyPath:@"transform.rotation"];
        
        
#pragma mark 心跳效果
//        CABasicAnimation *anim = [CABasicAnimation animation];
//
//        //设置属性
//        anim.keyPath = @"transform.scale";
//        anim.toValue = @0;
//
//        //重复执行次数
//        anim.repeatCount = MAXFLOAT;
//
//        //重复执行时长
//        anim.duration = 0.25;
//
//        //自动反转
//        anim.autoreverses = YES;
//
//
//        [self.myImageVc.layer addAnimation:anim forKey:nil];
        
//
//
//
//
//    }];
#pragma mark 图标抖动
//    [self doudong];
    
#pragma mark 转场动画
//    [self TransitionanimationAction];
    
#pragma mark 动画组
//    [self AnimationgroupAction];
    
}

-(void)AnimationgroupAction{
    
    //设置动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    //动画一: 缩放
    CABasicAnimation *scaleAnim = [CABasicAnimation animation];
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.toValue = @0.5;
    
    //动画二: 平移
    CABasicAnimation *Anim = [CABasicAnimation animation];
    Anim.keyPath = @"position.y";
    Anim.toValue = @(400);
    
    //加载动画
    group.animations = @[scaleAnim,Anim];
    
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [self.myRedVc.layer addAnimation:group forKey:nil];
    
}




-(void)TransitionanimationAction{

#pragma mark 进场动画
    [self.myImageVc.layer addAnimation:[UIImageView setTransitionAnimationImageView:self.myImageVc imageArray:ImageArray AnimationType:@"cube" AnimationSubtype:@"kCATransitionFromRight"] forKey:nil];
}

-(void)doudong{

    #pragma mark 图标抖动
//    [self.myImageVc.layer addAnimation:[UIView setTranslationView:self.myImageVc] forKey:nil];
    
#pragma mark 画圈
    [self.myImageVc.layer addAnimation:[UIView setLineView:self.myImageVc X:50 Y:50 W:300 H:400] forKey:nil];
    

}


@end
