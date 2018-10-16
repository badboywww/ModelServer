//
//  ViewController.m
//  project
//
//  Created by Bad on 2018/6/3.
//  Copyright © 2018年 Bad. All rights reserved.
//

#import "ViewController.h"
#import "dataStorageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];

    [self setNav];
    
    [self setUI];
    
  
    
}

-(void)setNav{
    self.title=@"主页";
}



-(void)setUI{

#pragma mark 数据持久化存储
    UIButton *OneBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    OneBtn.frame=CGRectMake(0, self.view.frame.size.width/2-22,self.view.frame.size.width, 44);
    [OneBtn setTitle:@"数据存储" forState:UIControlStateNormal];
    [OneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    OneBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [OneBtn addTarget:self action:@selector(OneAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:OneBtn];
    
#pragma mark View的故事
    UIButton *TwoBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    TwoBtn.frame=CGRectMake(0, CGRectGetMaxY(OneBtn.frame)+5,self.view.frame.size.width, 44);
    [TwoBtn setTitle:@"View的故事" forState:UIControlStateNormal];
    [TwoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    TwoBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [TwoBtn addTarget:self action:@selector(TwoAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:TwoBtn];
    
#pragma  View 拖拽
    UIButton *ThreeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    ThreeBtn.frame=CGRectMake(0, CGRectGetMaxY(TwoBtn.frame)+5,self.view.frame.size.width, 44);
    [ThreeBtn setTitle:@"View的拖拽" forState:UIControlStateNormal];
    [ThreeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ThreeBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [ThreeBtn addTarget:self action:@selector(ThreeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ThreeBtn];
    
#pragma  View 拖拽
    UIButton *FourBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    FourBtn.frame=CGRectMake(0, CGRectGetMaxY(ThreeBtn.frame)+5,self.view.frame.size.width, 44);
    [FourBtn setTitle:@"上传文件" forState:UIControlStateNormal];
    [FourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    FourBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [FourBtn addTarget:self action:@selector(FourAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FourBtn];
    
#pragma  View Quartz2D
    UIButton *FiveBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    FiveBtn.frame=CGRectMake(0, CGRectGetMaxY(FourBtn.frame)+5,self.view.frame.size.width, 44);
    [FiveBtn setTitle:@"Quartz2D" forState:UIControlStateNormal];
    [FiveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    FiveBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [FiveBtn addTarget:self action:@selector(FiveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FiveBtn];
    
    UIButton *SixBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SixBtn.frame=CGRectMake(0, CGRectGetMaxY(FiveBtn.frame)+5,self.view.frame.size.width, 44);
    [SixBtn setTitle:@"选择图片" forState:UIControlStateNormal];
    [SixBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    SixBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [SixBtn addTarget:self action:@selector(SixAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SixBtn];
    
#pragma make WMT
    UIButton *SevenBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SevenBtn.frame=CGRectMake(0, CGRectGetMaxY(SixBtn.frame)+5,self.view.frame.size.width, 44);
    [SevenBtn setTitle:@"WMT" forState:UIControlStateNormal];
    [SevenBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    SevenBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [SevenBtn addTarget:self action:@selector(SevenAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SevenBtn];
    
   
    
    
}

-(void)OneAction{
    
    dataStorageViewController *vc=[dataStorageViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)TwoAction{
    OneViewController *vc=[[OneViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)ThreeAction{
    DragandDropViewController *vc=[DragandDropViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)FourAction{
    NSString *url=@"/Users/badwwy/Documents/";
    
    NSString *filepath=@"/Users/badwwy/Library/Developer/CoreSimulator/Devices/824F6640-32FA-4389-8C0B-562CF532B9DA/data/Containers/Data/Application/81CAD79E-EF25-4D10-9C7E-2A773A1E2D3B/Library/Caches/";
    
    [HRRequestTools RequestFileUrl:url LocalFiles:filepath Progress:^(NSProgress *progress) {
        
    } Success:^(NSDictionary *result) {
        NSLog(@"result==%@",result);
    } failed:^(NSString *result) {
        NSLog(@"result==%@",result);
    }];
}

-(void)FiveAction{
    QuartzViewController *vc=[QuartzViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)SixAction{
    GetPhotoViewController *vc=[GetPhotoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)SevenAction{
    MyOneViewController *vc=[MyOneViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
