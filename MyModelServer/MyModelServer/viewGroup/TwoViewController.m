//
//  TwoViewController.m
//  project
//
//  Created by Bad on 2018/9/11.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self setNav];
    
    [self setUI];
}

//-(void)setNav{
//
//
//    self.title=@"第二个页面";
//
//    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
//
//
//
//    self.navigationItem.leftBarButtonItem=leftNavbar;
//}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUI{
     self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *OneBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    OneBtn.frame=CGRectMake(0, self.view.frame.size.width/2-22,self.view.frame.size.width, 44);
    [OneBtn setTitle:@"Modal 返回" forState:UIControlStateNormal];
    [OneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    OneBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [OneBtn addTarget:self action:@selector(OneAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:OneBtn];
}

-(void)OneAction:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
