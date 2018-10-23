//
//  CALayerViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/10/22.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "CALayerViewController.h"

@interface CALayerViewController ()

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    
    [self myCALayer];
}


-(void)myCALayer{
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 70, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"smm"].CGImage;
    
}

@end
