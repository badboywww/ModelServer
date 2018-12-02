//
//  ViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/10/16.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "ViewController.h"

#define CELL @"cell"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setNav];
    
    [self setUI];
    
    //66666
    
}

-(void)setNav{
    self.title=@"主页";
}



-(void)setUI{
    
    
    _tableVc = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Swidth, Sheight-64)];
    _tableVc.delegate = self;
    _tableVc.dataSource = self;
    _tableVc.showsVerticalScrollIndicator=NO;
    _tableVc.contentInset = UIEdgeInsetsMake(0, 0, 105, 0);
    _tableVc.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_tableVc];
    
    _dataArray=[NSMutableArray new];
    
    NSArray *arr=[NSArray arrayWithObjects: @"数据存储",
                                            @"View的故事",
                                            @"View的拖拽",
                                            @"上传文件",
                                            @"Quartz2D",
                                            @"选择图片",
                                            @"WMT",
                                            @"CALayer",
                                            @"微博",
                                            @"多线程",
                                            @"单例模式",
                                            @"多图下载",
                                            @"RunLoop",
                                            @"网络编程",
                                            @"地图",
                                            nil];
    [_dataArray addObjectsFromArray:arr];
    

 
}

//行数：
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}


//返回行高：
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}



//加载的Cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    
    if (cell == nil) {
        //副标题样式
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text=_dataArray[indexPath.row];
    
    
    return  cell;
}



//点击Cell


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        //数据存储
        dataStorageViewController *vc=[dataStorageViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){
        //View的故事
        OneViewController *vc=[[OneViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 2){
        //View的拖拽
        DragandDropViewController *vc=[DragandDropViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 3){
        
    }else if(indexPath.row == 4){
        //Quartz 2D
        QuartzViewController *vc=[QuartzViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 5){
        //选择图片
        GetPhotoViewController *vc=[GetPhotoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 6){
        //WMT
        MyOneViewController *vc=[MyOneViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 7){
        //CALayer
        CALayerViewController *vc=[CALayerViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 8){
        //weibo
        WeiboAnimationViewController *vc = [WeiboAnimationViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 9){
        //多线程
        MultithreadingController *vc = [MultithreadingController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 10){
        //单例
        singletonModeController *vc = [singletonModeController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 11){
        //多图下载
        multiImageController *vc = [[multiImageController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 12){
        //runloop
        myRunLoopController *vc = [[myRunLoopController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 13){
        //网络编程
        internetController *vc = [[internetController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 14){
        //地图
        MapViewController *vc = [[MapViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
  
 
    
    
}


@end
