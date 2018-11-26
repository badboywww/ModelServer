//
//  multiImageController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/25.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "multiImageController.h"

#import "multilImagemodel.h"
@interface multiImageController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableview;
@property (nonatomic , strong) NSArray *apps;

@property (nonatomic , strong) NSOperationQueue *queue;
@property (nonatomic , strong) NSMutableDictionary *images; //内存缓存


@property (nonatomic , strong) NSMutableDictionary *Operations; //内存缓存
@end

@implementation multiImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
}


/* Nav */
- (void)setNav {
    
    self.title = @"多图下载";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

/* 返回 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableview];
    
    
}


- (NSMutableDictionary *)images {
    
    if (_images == nil) {
        _images = [NSMutableDictionary dictionary];
    }
    
    return _images;
}

- (NSOperationQueue *)queue {
    
    if (_queue == nil) {
        
        _queue = [[NSOperationQueue alloc]init];
        _queue.maxConcurrentOperationCount = 5;
    
    }
    return _queue;
    
}

- (UITableView *)tableview {
    

    if (_tableview == nil) {
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Swidth, Sheight-64) style:UITableViewStylePlain];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.showsVerticalScrollIndicator=NO;
        tableview.contentInset = UIEdgeInsetsMake(0, 0, 105, 0);
        tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableview = tableview;
    }
    return _tableview;
    
}

- (NSArray *)apps {
    
    if (_apps == nil) {
        
        //加载数据
        NSArray *arrayM = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"icon" ofType:@"plist"]];
        
        //字典转模型
        NSMutableArray *appArrayM = [NSMutableArray arrayWithCapacity:arrayM.count];
        
        for (NSDictionary *dic in arrayM) {
            [appArrayM addObject:[multilImagemodel appWithDict:dic]];
        }
        _apps = appArrayM;
    }
    
    return _apps;
    
}

- (NSMutableDictionary *)Operations {
    
    if (_Operations == nil) {
        _Operations = [NSMutableDictionary dictionary];
    }
    return _Operations;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.apps.count;
}

// 先搜索内存缓存，是否有数据。有的话直接用，没有的话，检查沙盒缓存，如果有直接用，没有的话再下载数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"app";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    multilImagemodel *model = self.apps [indexPath.row];
    
    //设置标题:
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.download;
    
   // [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"DMM"]];
    
    /*
     
     第一个参数:要下载的图片地址
     第二个参数:备选图
     第三个参数:下载图片的策略
     第四个参数:progress 一个监听下载进度
               receivedSize:已经下载的大小 expectedSize:图片的大小
      第五个参数:下载完之后要做的事
     
    */
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"DMM"] options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        NSLog(@"%.2f",1.0 * receivedSize / expectedSize);
        
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"已经完成了");
    }];
   
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}

/* SDWImage 底层实现原理
 UIImage *img = [self.images objectForKey:model.icon];
 
 if (img) {
 
 cell.imageView.image = img;
 
 }else{
 
 //沙盒缓存文件
 NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
 NSString *filename = [model.icon lastPathComponent];
 NSString *fullPath = [caches stringByAppendingPathComponent:filename];
 
 //从沙盒获取数据
 NSData *fulldata = [NSData dataWithContentsOfFile:fullPath];
 
 if (fulldata) {
 
 UIImage *image = [UIImage imageWithData:fulldata];
 cell.imageView.image = image;
 
 //保存内存缓存
 [self.images setValue:image forKey:model.icon];
 
 }else{
 
 cell.imageView.image = [UIImage imageNamed:@"QQ"];
 
 NSBlockOperation *op = self.Operations[model.icon];
 
 if (op == nil) {
 
 NSBlockOperation *download = [NSBlockOperation blockOperationWithBlock:^{
 
 NSURL *url = [NSURL URLWithString:model.icon];
 NSData *data = [NSData dataWithContentsOfURL:url];
 
 if (data == nil) {
 
 [self.Operations removeObjectForKey:model.icon];
 return ;
 }
 
 
 UIImage *image = [UIImage imageWithData:data];
 
 //保存内存缓存
 [self.images setValue:image forKey:model.icon];
 
 //保存到沙盒
 [data writeToFile:fullPath atomically:YES];
 
 [[NSOperationQueue mainQueue]addOperationWithBlock:^{
 [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
 }];
 }];
 
 [self.queue addOperation:download];
 //添加操作缓存
 self.Operations[model.icon] = download;
 
 }
 
 }
 }
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)didReceiveMemoryWarning {
    
    self.images = nil;
    self.Operations = nil;
    [self.queue cancelAllOperations];
    
    
    
}

@end
