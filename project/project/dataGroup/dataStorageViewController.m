//
//  dataStorageViewController.m
//  project
//
//  Created by Bad on 2018/9/4.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "dataStorageViewController.h"

@interface dataStorageViewController ()

@end

@implementation dataStorageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
}

-(void)setNav{
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"数据存储";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUI{
    
    UIButton *OneBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    OneBtn.frame=CGRectMake(0, self.view.frame.size.width/2-22,self.view.frame.size.width, 44);
    [OneBtn setTitle:@"获取应用沙盒--存储" forState:UIControlStateNormal];
    [OneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    OneBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [OneBtn addTarget:self action:@selector(OneAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:OneBtn];
    
    UIButton *TwoBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    TwoBtn.frame=CGRectMake(0, CGRectGetMaxY(OneBtn.frame)+20,self.view.frame.size.width, 44);
    [TwoBtn setTitle:@"获取应用沙盒--读取" forState:UIControlStateNormal];
    [TwoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    TwoBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [TwoBtn addTarget:self action:@selector(TwoAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:TwoBtn];
    
    
    UIButton *ThreeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    ThreeBtn.frame=CGRectMake(0, CGRectGetMaxY(TwoBtn.frame)+20,self.view.frame.size.width, 44);
    [ThreeBtn setTitle:@"偏好设置-存储" forState:UIControlStateNormal];
    [ThreeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ThreeBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [ThreeBtn addTarget:self action:@selector(ThreeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ThreeBtn];
    
    UIButton *FourBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    FourBtn.frame=CGRectMake(0, CGRectGetMaxY(ThreeBtn.frame)+20,self.view.frame.size.width, 44);
    [FourBtn setTitle:@"偏好设置--读取" forState:UIControlStateNormal];
    [FourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    FourBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [FourBtn addTarget:self action:@selector(FourAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FourBtn];
    
    
    UIButton *FiveBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    FiveBtn.frame=CGRectMake(0, CGRectGetMaxY(FourBtn.frame)+20,self.view.frame.size.width, 44);
    [FiveBtn setTitle:@"归档" forState:UIControlStateNormal];
    [FiveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    FiveBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [FiveBtn addTarget:self action:@selector(FiveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FiveBtn];
    
    UIButton *SixBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SixBtn.frame=CGRectMake(0, CGRectGetMaxY(FiveBtn.frame)+20,self.view.frame.size.width, 44);
    [SixBtn setTitle:@"解档" forState:UIControlStateNormal];
    [SixBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    SixBtn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [SixBtn addTarget:self action:@selector(SixAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SixBtn];
    
    
    
}

-(void)OneAction{
    
    NSArray *arr=@[@"123",@1];
    
    //File 文件的全路径:
    NSString *homePath=NSHomeDirectory();
    NSLog(@"%@",homePath);
    
    //获取Caches 文件夹路径
    //  directory :搜索文件夹
    //  domainMask : 在哪个范围搜索 NSUserDomainMask 在用户中查找
    //  expandTilde : YES 在路径中展开 or NO 在路径中不展开 ~:沙盒路径
    NSString *CachesPath =   NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    //拼接文件名：
    NSString *filePath= [CachesPath stringByAppendingPathComponent:@"arr.plist"];
    
    
    
    [arr writeToFile:filePath atomically:YES];
}

-(void)TwoAction{
    
    NSString *CachesPath =   NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    //拼接文件名：
    NSString *filePath= [CachesPath stringByAppendingPathComponent:@"arr.plist"];
    
    NSLog(@"filePath==%@",filePath);
    
    //读取：以什么形式存储，以什么格式读取
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
    
    NSLog(@"%@",arr);
}

-(void)ThreeAction{
    
    //快速进行键值对的存储，不需要关系文件名
    
    //偏好设置存储 NSUserDefaults
    // 获取NSUserDefaults 单例对象
    NSUserDefaults *defaults=  [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"123" forKey:@"num"];  //对象 bool str int double float
    [defaults setBool:YES forKey:@"isOn"];
    
    
}

-(void)FourAction{
    
    //
    NSString *num = [[NSUserDefaults standardUserDefaults]objectForKey:@"num"];
    BOOL ison=[[NSUserDefaults standardUserDefaults]boolForKey:@"isOn"];
    
    NSLog(@"num--isOn:%@---%d",num,ison);
}


-(void)FiveAction{
    //存储自定义对象用归档
    
    //创建自定义对象
    Person *p=[[Person alloc]init];
    p.age=18;
    p.name=@"GBLW";
    
    //获取Caches 文件夹
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    //拼接文件名
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"person.data"];
    
    
    //obj 归档的对象
    //file 归档文件的全路径
    
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    
    //调用自定义对象的 encodeWithCoder
    
    //自定义对象归档，要遵守 NSCoding 协议,并且实现协议方法。
    
}

-(void)SixAction{
    
    //获取Caches 文件夹
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    //拼接文件名
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"person.data"];
    
    //存进去是啥，取出来是啥
    //解档
    Person *p= [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    //调用自定义对象的  initWithCoder
    
    NSLog(@"name=%@ age=%d",p.name,p.age);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
