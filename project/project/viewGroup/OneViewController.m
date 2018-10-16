//
//  OneViewController.m
//  project
//
//  Created by Bad on 2018/9/11.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@property(nonatomic , strong) UIViewController *vc;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    
    [self setUI];
}
-(void)setNav{
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"第一个页面";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUI{
    UIButton *OneBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    OneBtn.frame=CGRectMake(0, self.view.frame.size.width/2-22,self.view.frame.size.width, 44);
    [OneBtn setTitle:@"Modal 进入" forState:UIControlStateNormal];
    [OneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    OneBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [OneBtn addTarget:self action:@selector(OneAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:OneBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)OneAction{
    
    UIViewController *vc=[[TwoViewController alloc]init];
    
    _vc=vc;
    
    //把新的控制器的view 添加到窗口上，而且有从下往上的动画
    
    //1.获取窗口
  UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    
    [keywindow addSubview:vc.view];
    
    vc.view.transform=CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
    
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        vc.view.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
