//
//  WeiboAnimationViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "WeiboAnimationViewController.h"

@interface WeiboAnimationViewController ()

@end

@implementation WeiboAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self setNav];
    [self WeiBoAnimView];
}


-(void)setNav{
    
    
    self.title=@"微博";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)WeiBoAnimView{

    self.view.backgroundColor=[UIColor redColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(Swidth/2 - 64 , Sheight - 60, 128, 50);
    [self.view addSubview:btn];
    
}

-(void)btnClick:(UIButton *)sender{
  
     MenuItemModel *item1 = [MenuItemModel itemWithTitle:@"点评" Image:[UIImage imageNamed:@"tabbar_compose_review"]];
     MenuItemModel *item2 = [MenuItemModel itemWithTitle:@"更多" Image:[UIImage imageNamed:@"tabbar_compose_more"]];
     MenuItemModel *item3 = [MenuItemModel itemWithTitle:@"拍摄" Image:[UIImage imageNamed:@"tabbar_compose_camera"]];
     MenuItemModel *item4 = [MenuItemModel itemWithTitle:@"相册" Image:[UIImage imageNamed:@"tabbar_compose_photo"]];
     MenuItemModel *item5 = [MenuItemModel itemWithTitle:@"文字" Image:[UIImage imageNamed:@"tabbar_compose_idea"]];
     MenuItemModel *item6 = [MenuItemModel itemWithTitle:@"签到" Image:[UIImage imageNamed:@"tabbar_compose_review"]];
    
    
    
    ComposeVC *vc = [[ComposeVC alloc]init];
    vc.itemArray = @[item1,item2,item3,item4,item5,item6];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

@end
