//
//  singletonModeController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/23.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "singletonModeController.h"

@interface singletonModeController ()

@end

@implementation singletonModeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    
    [self setUI];
}

/* Nav */
- (void)setNav {
    
    self.title = @"单例模式";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

/* 返回 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    //单例模式举例 [self singletonModels];
    
    
    
}

/* 单例模式举例 */
- (void)singletonModels {
    
    toolsModel *t1 = [[toolsModel alloc]init];
    toolsModel *t2 = [toolsModel new];
    
    NSLog(@"%p----%p---%p",t1,t2,[toolsModel sharetoolsModel]);
    
}

@end
