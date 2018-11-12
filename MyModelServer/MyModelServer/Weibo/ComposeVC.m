//
//  ComposeVC.m
//  MyModelServer
//
//  Created by Bad on 2018/11/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "ComposeVC.h"
#import "MenuItemModel.h"

@interface ComposeVC ()

@property (nonatomic , strong) NSMutableArray *btnArray;

@property (nonatomic , assign) int btnIndex;

@property (nonatomic , strong) NSTimer *timer;

@end

@implementation ComposeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self addBtn];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

-(NSMutableArray *)btnArray{
    
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    
    return _btnArray;
}

-(void)update{
    
    if (self.btnIndex == self.btnArray.count) {
        
        [self.timer invalidate];
        
        return ;
    }
    
    
  UIButton *btn = self.btnArray [self.btnIndex];
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        btn.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    self.btnIndex ++ ;
}

//添加按钮

-(void)addBtn{
    
    CGFloat btn_WH = 100;
    int cloumn = 3;
    
    CGFloat margin = (Swidth - cloumn * btn_WH) / (cloumn + 1);
    CGFloat x = 0;
    CGFloat y = 0;
    int curCloumn = 0; //列
    int curRow = 0;    //行
    CGFloat oriY = 300;
    
    
    for (int i = 0; i< self.itemArray.count; i++) {
        Item  *btn = [Item buttonWithType:UIButtonTypeCustom];
        
        curCloumn = i % cloumn;
        curRow = i / cloumn;
        
        x = margin + (btn_WH + margin) * curCloumn;
        y = (btn_WH + margin) *curRow + oriY;
        
        btn.frame = CGRectMake(x, y, btn_WH, btn_WH);

        MenuItemModel *item = self.itemArray[i];
        
        [btn setImage:item.Itemimage forState:UIControlStateNormal];
        [btn setTitle:item.Itemtitle forState:UIControlStateNormal];
        
        
        [self.view addSubview:btn];
        
        btn.transform = CGAffineTransformMakeTranslation(0, Sheight);
        [self.btnArray addObject:btn];
        
        //监听
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown]; //手指按下
        [btn addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside]; //手指抬起
    }
    
    
    
}

//按下
-(void)btnClick:(UIButton *)sendr{
    [UIView animateWithDuration:0.5 animations:^{
          sendr.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
    
}

//抬起
-(void)btnClick1:(UIButton *)sendr{
    
    [UIView animateWithDuration:0.5 animations:^{
        sendr.alpha = 0;
        sendr.transform = CGAffineTransformMakeScale(2, 2);
        
    }];
  
}


@end
