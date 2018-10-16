//
//  DragandDropViewController.m
//  project
//
//  Created by Bad on 2018/9/24.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "DragandDropViewController.h"

@interface DragandDropViewController ()

@end

@implementation DragandDropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
    
}

-(void)setNav{
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"view的拖拽";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUI{
    self.view.backgroundColor=[UIColor whiteColor];
   RedView *redVc =[[RedView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    redVc.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redVc];
}





@end
