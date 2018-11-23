//
//  MultithreadingController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/21.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MultithreadingController.h"
#import <pthread.h>
@interface MultithreadingController ()

@property (nonatomic , strong) UIButton *Mybutton;
@property (nonatomic , strong) UIImageView *imageView;

//售票员1
@property (nonatomic , strong) NSThread *thread01;
//售票员2
@property (nonatomic , strong) NSThread *thread02;
//售票员3
@property (nonatomic , strong) NSThread *thread03;

//票的总数
@property (nonatomic , assign) NSUInteger totalticket;

@property (nonatomic , strong) UIImage *image1;
@property (nonatomic , strong) UIImage *image2;

@property (nonatomic , strong) NSOperationQueue *queue;


@end
@implementation MultithreadingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
}

/* Nav */
- (void)setNav {
    
    self.title = @"多线程";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

/* 返回 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

/* UI */
- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UITextView *textVc = [[UITextView alloc]initWithFrame:CGRectMake((Swidth-300)/2, 100, 300, 150)];
    textVc.text = @"人类长期只有口语传递信息，用文字记事传递信息形成的书面语历史较短。系统的语言成为人和禽兽分离的重要工具，文字使人类能进入有历史记录的文明社会。把时空的影像变化转码成视觉可见的符号系统，使后人能通过间接的文字想象出画面，了解历史和学习技术经验。使文字成为文化的主要载体。文字突破口语受到时间和空间的限制，是人类可以在书面语的基础上完整地传承人类的智慧和精神财富，使人类能够完善教育体系，提高自己的智慧，发展科学技术，进入文明社会。普通文字是用简单图形形成，早期更加接近图画，更加接近几何线条。例如拉丁字母是简单的直线、弧线和点构成。汉字主要是由直线构成，所以叫做“方块汉字”。古代的甲骨文汉字，埃及象形文字和玛雅文字等古老文字图画性比较强。由于特殊人群视觉能力的局限，还可以发明变异的视觉符号或者触觉符号来代替普通文字。盲文是为了适应没有视觉能力的盲人发明的触觉符号。手语是为了适应没有语音能力的聋哑人发明的用手舞动的动态视觉符号。旗语是为了适应航海等远距离听觉和视觉局限发明的用旗子舞动的动态视觉符号。这些代码文字，一般建立在表音文字或者表意文字的拼音方案的基础上，目前传统汉字尚且没有这种代码的解决方案。在电子信息传输的初期，人们还采用阿拉伯数字代替汉字传输书面语。这种数字代码可以给任何文字编码。但是汉字因为数量多，需要专门的代码翻译人员才能使用。有人把文字分成线性文字和非线性文字。这样有一定道理，但无论是普通文字还是代码文字都有线条和点等视觉元素。";
    textVc.font = [UIFont systemFontOfSize:16];
    textVc.backgroundColor = [UIColor redColor];
    [self.view addSubview:textVc];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"Button" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    btn.frame = CGRectMake(CGRectGetMinX(textVc.frame), CGRectGetMaxY(textVc.frame)+50, 100, 50);
    [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _Mybutton = btn;
    [self.view addSubview:btn];
    
    
   
}

/* 点击事件 */
- (void)BtnClick:(UIButton *)sender{
    
   
//pthread     [self pthread];
    
//NSThread    [self NsThread];
    
//GCD         [self GCDAction];
    
       [self NSOperationAction];
    
}

#pragma mark pthread

- (void)pthread {
    
    
    //创建线程
    
    pthread_t thread;
    
    /*
     第一个参数:线程对象
     第二个参数:线程属性
     第三个参数:void * _Nullable (* _Nonnull)(void * _Nullable) 指向函数的指针
     第四个参数:函数的参数
    */
    
    pthread_create(&thread, NULL,run, NULL);
   
    
}
void *run (void *param) {
    
    NSLog(@"-----%@",[NSThread currentThread]);
    
    return NULL;
}

#pragma mark NSThread

-(void)NsThread {
    
//    NSLog(@"%@",[NSThread currentThread]); //当前线程
//    NSLog(@"%@",[NSThread mainThread]);    //主线程
    
   
    //第一种创建线程的方式  [self threadOne];
    
    //第二种创建线程的方式  [self threadTwo];
    
    //第二种创建线程的方式  [self threadThree];
    
    //线程的状态          [self threadstatus];
    
    //线程间通讯          [self threadcommunication];
    
    //线程安全
    //假设有100张票
    self.totalticket = 100;
    [self threadSafety];
    [self threadSafetyClick];
    
   
}

/* 第一种创建线程的方式  需要 strat 方式开启线程 */
- (void)threadOne {
    //创建线程
    /*
     Target:目标对象
     selector:活动
     object:前面方法传递的参数
     */
    //    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    //
    //    //设置基本属性
    //    thread1.name = @"线程1";
    //
    //    //线程优先级 cpu调用概率越大 0.0 ~ 1.0 默认0.5
    //    [thread1 setThreadPriority:1.0];
    //
    //
    //    //开启线程
    //    [thread1 start];
    //
    //    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    //    thread2.name = @"线程2";
    //    [thread2 setThreadPriority:0.1];
    //
    //    //开启线程
    //    [thread2 start];
    
    myThread *thread3 = [[myThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    thread3.name = @"线程3";
    
    //开启线程
    [thread3 start];
}
-(void)run {
    NSLog(@"%@",[NSThread currentThread]);
}

/* 第二种创建线程的方式  默认开启线程 */
- (void)threadTwo {
    
    /*
     Target:选择器，调用的方法
     selector:目标对象
     object:前面方法传递的参数
     */
    
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"WWY"];
}
- (void)run:(NSString *)str {
    
        NSLog(@"--run----%@--%@",[NSThread currentThread].name,str);

    
}

/* 第三种创建线程的方式  默认开启线程 开启后台线程 */
- (void)threadThree {
    
    /*
     selector:目标对象
     object:前面方法传递的参数
     */
    [self performSelectorInBackground:@selector(run:) withObject:@"后台线程"];
    
}

/* 线程的状态 */
- (void)threadstatus {
    
    
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(runstatus2) object:nil];
    
    [thread start];
    
    
}
- (void)runstatus2 {
    
    for (int i=0; i<100; i++) {
        NSLog(@"%@--%d",[NSThread currentThread],i);
        if (i == 50) {
//            [NSThread exit]; //杀死线程 死亡状态
            return ;
        }
    }
    
}
- (void)runstatus {
    
    NSLog(@"\n-----");
    
    //阻塞线程 distantFuture 未来 distantPast 过去
    
//    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
//    [NSThread sleepForTimeInterval:3.0];
   
    
    NSLog(@"\n+++++");
}

/* 线程间通讯 */
- (void)threadcommunication {
    
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_Mybutton.frame), CGRectGetMaxY(_Mybutton.frame)+20, 300, 300)];
    imageVc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _imageView = imageVc;
    [self.view addSubview:imageVc];
    

    //开启子线程，下载图片
    [NSThread detachNewThreadSelector:@selector(downloadimage) toTarget:self withObject:nil];
    
}
- (void)downloadimage2 {
    
    //加载图片地址
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542799499895&di=b947a343c4f9241a8da68d56c3db49ec&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F11%2F20150111083239_dwyET.jpeg"];
    //转换成Data
    NSDate *start = [NSDate date];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDate *end = [NSDate date];
    
    NSLog(@"----%f",[end timeIntervalSinceDate:start]);
    
    //把二进制数据转化生成图片
    UIImage *image = [UIImage imageWithData:data];
    
    //回到主线程刷新UI waitUntilDone:要不要等当前方法执行完后在往下执行
    //    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
    
    //    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES]; //快捷方式
    
    [self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES]; //方法三

    
}
- (void)downloadimage {
    //加载图片地址
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542799499895&di=b947a343c4f9241a8da68d56c3db49ec&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F11%2F20150111083239_dwyET.jpeg"];
    //转换成Data
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    NSData *data = [NSData dataWithContentsOfURL:url];
    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"----%f",end - start); //代码运行时间
    //把二进制数据转化生成图片
    UIImage *image = [UIImage imageWithData:data];
    
    //回到主线程刷新UI waitUntilDone:要不要等当前方法执行完后在往下执行
//    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
    
//    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES]; //快捷方式
    
    [self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES]; //方法三

}
- (void)showImage:(UIImage *)image {
    
    self.imageView.image = image;
}

/* 线程安全 */
- (void)threadSafety {
    
    //创建线程
  self.thread01 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread01.name = @"售票员01";
    
  self.thread02 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread02.name = @"售票员02";
    
  self.thread03 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread03.name = @"售票员03";
}
- (void)threadSafetyClick{
    //启动线程
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
}
- (void)saleTicket {
    
    while (1) {
        
        //2.加互斥锁
        @synchronized (self) {
            
           [NSThread sleepForTimeInterval:0.01];
            
            //1.先查看余票数
            NSInteger count = self.totalticket;
            
            if (count > 0) {
                
                self.totalticket = count - 1;
                
                NSLog(@"%@ 卖出一张票,还有剩票%zd张",[NSThread currentThread].name,self.totalticket);
                
            }else{
                NSLog(@"%@发现当前票已经卖完了",[NSThread currentThread].name);
                break;
            }
        }
        
   
    }
    
}

#pragma mark GCD

- (void)GCDAction {
    
    //GCD基本使用  [self GCDBasicuse];
    
    //CGD线程间通讯 [self GCDcommunication];
    
    //GCD常用函数
    [self GCDCommonmethod];
}

/* GCD 的基本使用 */
- (void)GCDBasicuse{
    //    dispatch_sync(dispatch_queue_t  _Nonnull queue, <#^(void)block#>) 同步方式
    //    dispatch_async(dispatch_queue_t  _Nonnull queue, <#^(void)block#>)  异步方式
    
    
    /*
     1.创建并发队列
     第一个参数:C语言的字符串,是一个标签 逆向书写
     第二个参数:
     DISPATCH_QUEUE_CONCURRENT 并发队列
     DISPATCH_QUEUE_SERIAL     串行队列
     */
    
    //    dispatch_queue_t queue1 = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_CONCURRENT);
    //    dispatch_queue_t queue2 = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_SERIAL);
    
    /*
     获取全局并发队列
     第一个参数:队列的优先级  DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     第二个参数:永远传 0
     */
    //    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
    
    
    //异步函数+并发队列  [self asyncCONCURRENT];
    
    //异步函数+串行队列  [self asyncSERIAL];
    
    //异步函数+并发队列  [self syncCONCURRENT];
    
    //同步函数+串行队列  [self syncSERIAL];
    
    //异步函数+主队列    [self asyncMain];
    
    //同步函数+主队列    [self syncMain];
}

/* 异步函数+并发队列: 开若干条线程,任务是并发执行的 */
- (void)asyncCONCURRENT{
    
     dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*
     2.异步函数
     第一个参数：队列
     第二个参数：block,在里面封装任务
     */
    dispatch_async(queue, ^{
        NSLog(@"--download1--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download2--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download3--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download4--%@",[NSThread currentThread]);
    });
}

/* 异步函数+串行队列: 开一条线程,任务是串行执行的 */
- (void)asyncSERIAL {
    
    dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_SERIAL);
    /*
     2.异步函数
     第一个参数：队列
     第二个参数：block,在里面封装任务
     */
    dispatch_async(queue, ^{
        NSLog(@"--download1--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download2--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download3--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download4--%@",[NSThread currentThread]);
    });
    
}

/* 同步函数+并发队列: 不会开线程,任务是串行执行的 */
- (void)syncCONCURRENT{
 
     dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*
     2.同步函数
     第一个参数：队列
     第二个参数：block,在里面封装任务
     */
    dispatch_sync(queue, ^{
        NSLog(@"--download1--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download2--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download3--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download4--%@",[NSThread currentThread]);
    });

}

/* 同步函数+串行队列: 不会开线程,任务是串行执行的 */
- (void)syncSERIAL{

    dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_SERIAL);
    /*
     2.同步函数
     第一个参数：队列
     第二个参数：block,在里面封装任务
     */
    dispatch_sync(queue, ^{
        NSLog(@"--download1--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download2--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download3--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download4--%@",[NSThread currentThread]);
    });

}

/* 异步函数+主队列: 不会开线程,任务是串行执行的 */
- (void)asyncMain{
    
    // 1.获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    /*
     2.异步函数
     第一个参数：队列
     第二个参数：block,在里面封装任务
     */
    dispatch_async(queue, ^{
        NSLog(@"--download1--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download2--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download3--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"--download4--%@",[NSThread currentThread]);
    });
    
    
}

/* 同步函数+主队列: 会卡死 同步函数要立刻马上执行 需要放在子线程*/
- (void)syncMain {
    
    // 1.获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    /*
     2.异步函数
     第一个参数：队列
     第二个参数：block,在里面封装任务
     */
    dispatch_sync(queue, ^{
        NSLog(@"--download1--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download2--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download3--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"--download4--%@",[NSThread currentThread]);
    });
    
    
}

/* GCD 线程间通讯 */
- (void)GCDcommunication {
    
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_Mybutton.frame), CGRectGetMaxY(_Mybutton.frame)+20, 300, 300)];
    imageVc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _imageView = imageVc;
    [self.view addSubview:imageVc];
    
    //1.开子线程 下载图片
    //2.异步函数
    //创建队列
    dispatch_queue_t quque = dispatch_get_global_queue(0, 0);
    
    dispatch_async(quque, ^{
        //加载图片地址
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542799499895&di=b947a343c4f9241a8da68d56c3db49ec&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F11%2F20150111083239_dwyET.jpeg"];
        //转换成Data
        NSData *data = [NSData dataWithContentsOfURL:url];
       
        //把二进制数据转化生成图片
        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"---%@",[NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            NSLog(@"+++%@",[NSThread currentThread]);
        });
        
    });
    
}

/* GCD 常用函数 */
- (void)GCDCommonmethod {
    
    //栅栏函数 用来控制并发队列执行顺序 [self fenceMethod];
    
    //延迟执行 [self delay];
    
    //一次性代码 [self once];
    
    //快速迭代 [self apply];
    
    //文件剪切 [self moveFile];
    
    //队列组   [self group];
}

/* GCD 栅栏函数 */
- (void)fenceMethod{
    
    //创建队列 (并发队列)
    dispatch_queue_t queue = dispatch_queue_create("com.downloadqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 10; i++) {
            NSLog(@"%d--download1--%@",i,[NSThread currentThread]);
        }
        
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 10; i++) {
            NSLog(@"%d--download2--%@",i,[NSThread currentThread]);
        }
        
    });
    
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"我是一个栅栏");
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 10; i++) {
            NSLog(@"%d--download3--%@",i,[NSThread currentThread]);
        }
        
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 10; i++) {
            NSLog(@"%d--download4--%@",i,[NSThread currentThread]);
        }
        
    });
    
    
}

/* GCD 延迟执行 */
- (void)delay {

   NSLog(@"----");
    
    
    //第一种方法 2.0s后调用    [self performSelector:@selector(rungcd) withObject:nil afterDelay:2.0];
    
   //第二种方法  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(rungcd) userInfo:nil repeats:YES];

   /*
    第三种方法
    第一个参数：延迟时间
    第二个参数：执行事件
    */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"++++%@",[NSThread currentThread]);
    });

}
- (void)rungcd {
    NSLog(@"++++");
}

/* GCD 一次性代码 */
- (void)once {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"+++++");
    });
    
}

/* GCD 快速迭代 */
- (void)apply {
    
    /*
     1.迭代
    for (int i = 0; i < 10; i++) {
        NSLog(@"%d---%@",i,[NSThread currentThread]);
    }
    */
    
    
    dispatch_queue_t queue = dispatch_queue_create("com.downloadqueue", DISPATCH_QUEUE_CONCURRENT);
    /*
     快速迭代
     第一个参数: 迭代的次数
     第二个参数: 在那个队列中执行 并发队列
     第三个参数: 执行的代码
    */
    dispatch_apply(10, queue, ^(size_t index) {
         NSLog(@"%zd---%@",index,[NSThread currentThread]);
    });
    
    
}

/* GCD 快速迭代的应用:文件剪切 */
- (void)moveFile {
    
    //1.原路径 /Users/badwwy/Desktop/IOS Project/test/form
    //2.目标地址   /Users/badwwy/Desktop/IOS Project/test/to
    
    
    /*
     1.用for 实现
     NSString *form = @"/Users/badwwy/Desktop/IOS Project/test/form";
     NSString *to   = @"/Users/badwwy/Desktop/IOS Project/test/to";
     
     //文件管理
     NSFileManager *manager = [NSFileManager defaultManager];
     NSArray *subpathsPath = [manager subpathsAtPath:form]; //获取文件夹下所有子路径
     NSLog(@"%@",subpathsPath);
     NSInteger count = [subpathsPath count];
   
      for(NSInteger i = 0; i< count; i++) {
        //拼接文件全路径
        NSString *fullPath = [form stringByAppendingPathComponent:subpathsPath[i]];
        
        //拼接目标文件夹全路径
        NSString *fileName = [to stringByAppendingPathComponent:subpathsPath[i]];
        
        //剪切操作
        //第一个参数: 原路径 第二个参数: 目标路径
        [manager moveItemAtPath:fullPath toPath:fileName error:nil];
        
        NSLog(@"%@----%@",fullPath,fileName);
    }
    */
    
    //2.快速迭代
    dispatch_queue_t queue = dispatch_queue_create("com.downloadqueue", DISPATCH_QUEUE_CONCURRENT);
    NSString *form = @"/Users/badwwy/Desktop/IOS Project/test/form";
    NSString *to   = @"/Users/badwwy/Desktop/IOS Project/test/to";
    
    //文件管理
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subpathsPath = [manager subpathsAtPath:form]; //获取文件夹下所有文件
    
    NSInteger count = [subpathsPath count];

    dispatch_apply(count, queue, ^(size_t index) {
        //拼接文件全路径
        NSString *fullPath = [form stringByAppendingPathComponent:subpathsPath[index]];

        //拼接目标文件夹全路径
        NSString *fileName = [to stringByAppendingPathComponent:subpathsPath[index]];

        //剪切操作
        //第一个参数: 原路径 第二个参数: 目标路径
        [manager moveItemAtPath:fullPath toPath:fileName error:nil];

        NSLog(@"%@",[NSThread currentThread]);
    });
    
    
    //补充内容:
//    NSDirectoryEnumerator *enumer = [manager enumeratorAtPath:to];
//    for (NSDirectoryEnumerator *en in enumer) {
//        NSLog(@"%@",en);
//    }
    
    
}

/* GCD 队列组  下载两张图片，合成一张图片*/
- (void)group {
    
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_Mybutton.frame), CGRectGetMaxY(_Mybutton.frame)+20, 300, 300)];
    imageVc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _imageView = imageVc;
    [self.view addSubview:imageVc];
    
    
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    //下载图片1
    dispatch_queue_t quque = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, quque, ^{
        //加载图片地址
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542799499895&di=b947a343c4f9241a8da68d56c3db49ec&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F11%2F20150111083239_dwyET.jpeg"];
        //转换成Data
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //把二进制数据转化生成图片
        self.image1 = [UIImage imageWithData:data];
        NSLog(@"---%@",[NSThread currentThread]);
    });
  
    //下载图片2
    dispatch_group_async(group, quque, ^{
        //加载图片地址
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542891369993&di=765e488640ebc144f7e020d9e2d6cd23&imgtype=jpg&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F03087bf40ad162d989e0c90e1ddfa9ec8a13cd92.jpg"];
        //转换成Data
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //把二进制数据转化生成图片
        self.image2 = [UIImage imageWithData:data];
        NSLog(@"---%@",[NSThread currentThread]);
    });
    
    //合成图片
    dispatch_group_notify(group, quque, ^{
        
        //合成图片 开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(300, 300));
        
        //图片1
        [self.image1 drawInRect:CGRectMake(0, 0, 300, 150)];
        
        //图片2
        [self.image2 drawInRect:CGRectMake(0, 150, 300, 150)];
        
        //根据图形上下文拿到图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭图形上下文
        UIGraphicsEndImageContext();
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            
            NSLog(@"刷新UI--%@",[NSThread currentThread]);
        });
        
        
    });
}


#pragma mark NSOperation

- (void)NSOperationAction {
    
   //NSOperation      基本使用 [self NSOperationBasicuse];
    
   //nsoperationqueue 基本操作 [self nsoperationqueueBasicuse];
    
   //nsoperation      其他用法 [self nsoperationqueueOther];
    
    //操作依赖和监听            [self nsoperationqueueClick];
    
    //线程间通信               [self nsoperationqueueCommunication];
    
    //两张图片合成一张          [self nsoperationqueueGroup];
}

/* NSOperation 的基本使用 */
- (void)NSOperationBasicuse {
    
    /*
     1.NSInvocationOperation 方法   主线程调用
     第一个参数:目标对象
     第二个参数:选择器，要调用的方法
     第三个参数:方法要传递的参数
     */
//    [self NSInvocationOperation];


    /*
     2.NSBlockOperation 方法
     block 完成操作
     */
//    [self NSBlockOperation];


    /*
     3.NSOperation 封装操作
     */
//    [self MyNSOperation];
}

/* NSInvocationOperation 方法创建线程 */
- (void)NSInvocationOperation {
    //    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download) object:nil];
    //    //启动
    //    [op start];
}

/* NSBlockOperation 方法创建线程 */
- (void)NSBlockOperation {
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            //主线程执行
            NSLog(@"op1----%@",[NSThread currentThread]);
        }];
        [op1 start];
    
        NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"op2-----%@",[NSThread currentThread]);
        }];
    
        //追加操作
        [op2 addExecutionBlock:^{
            //子线程执行
             NSLog(@"op3-----%@",[NSThread currentThread]);
        }];
        [op2 addExecutionBlock:^{
            NSLog(@"op4-----%@",[NSThread currentThread]);
        }];
        [op2 addExecutionBlock:^{
            NSLog(@"op5-----%@",[NSThread currentThread]);
        }];
    
        [op2 start];
}

/* MyNSOperation 自定义封装方法创建线程 */
- (void)MyNSOperation {
    MynsOperation *op1 = [[MynsOperation alloc]init];
    [op1 start];
    MynsOperation *op2 = [[MynsOperation alloc]init];
    [op2 start];
}

- (void)download {
    NSLog(@"%@",[NSThread currentThread]);
}

/* nsoperationqueue 的基本使用 */
- (void)nsoperationqueueBasicuse {
    
    /*
     并发队列:全局并发队列,自己创建(concurrent)
     串行队列:主队列，自己创建（serial）
    */
    
  /*  NSOperationQueue */
    
    /*
     主队列: 凡是放在主队列的任务，都在主线程执行 [NSOperationQueue mainQueue]
     非主队列: alloc,int ,同时具备了并发和串行的功能。默认是并发队列
    */
    
    
    
    
    //2.封装操作
    
    // 2.1 NSInvocationOperation [self NSInvocationOperations];
    
    
    
    // 2.2 NSBlockOperation      [self NSBlockOperations];

    
    // 2.3 自定义nsOperations     [self MynsOperations]

    
    /* 2.4 快捷方式 */
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        NSLog(@"download7---%@",[NSThread currentThread]);
    }];
   
}

/* 2.1 NSInvocationOperation + NSOperationQueue   */
- (void)NSInvocationOperations {
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //2.封装操作
    
    /* 2.1 NSInvocationOperation  */
    
        NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(Operationdownload1) object:nil];
    
        NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(Operationdownload2) object:nil];
    
        NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(Operationdownload3) object:nil];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
}

/* 2.2 NSBlockOperation  + NSOperationQueue   */
- (void)NSBlockOperations {
    
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //2.封装操作
    
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"download1---%@",[NSThread currentThread]);
        }];
    
        NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"download2---%@",[NSThread currentThread]);
        }];
    
        NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"download3---%@",[NSThread currentThread]);
        }];
    
        [op3 addExecutionBlock:^{
             NSLog(@"download4---%@",[NSThread currentThread]);
        }];
        [op3 addExecutionBlock:^{
            NSLog(@"download5---%@",[NSThread currentThread]);
        }];
        [op3 addExecutionBlock:^{
            NSLog(@"download6---%@",[NSThread currentThread]);
        }];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
}

/* 2.3 自定义nsOperations  + NSOperationQueue   */
- (void)MynsOperations {
    
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
     MynsOperation *op1 = [[MynsOperation alloc]init];
     MynsOperation *op2 = [[MynsOperation alloc]init];
    
     [queue addOperation:op1];
     [queue addOperation:op2];
}

- (void)Operationdownload1 {
    NSLog(@"download1---%@",[NSThread currentThread]);
}
- (void)Operationdownload2 {
    NSLog(@"download2---%@",[NSThread currentThread]);
}
- (void)Operationdownload3 {
    NSLog(@"download3---%@",[NSThread currentThread]);
}

/* nsoperation其他用法 */
- (void)nsoperationqueueOther {
    
    //最大并发数 [self maxConcurrentOperationCount];
    
    //暂停队列 恢复队列 self.queue.suspended = YES;
    
    //取消队列里所有运行方法,不可逆 [self.queue cancelAllOperations];
    
    //自定义操作，是否可以暂停
    [self nsOperations];
    
}

/* 最大并发数用法 */
- (void)maxConcurrentOperationCount {
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    _queue = queue;
    //2.封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"1---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"2---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"3---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"4---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"5---%@",[NSThread currentThread]);
    }];
    
    //最大并发数 默认是并发队列。 如果大于1 就是并发队列。等于1 就是串行队列
    queue.maxConcurrentOperationCount = 1;
    
    //3.添加队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
    [queue addOperation:op5];
}

/* 自定义操作 */
- (void)nsOperations {
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    MynsOperation *op1 = [[MynsOperation alloc]init];
    [queue addOperation:op1];
    self.queue = queue;
}

/* 操作依赖和监听 */
- (void)nsoperationqueueClick {
    
    //1. 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    NSOperationQueue *queue1 = [[NSOperationQueue alloc]init];
    
    //
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4---%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"5---%@",[NSThread currentThread]);
    }];
    
    //监听操作
    op4.completionBlock = ^{
        NSLog(@"op4已经完成了");
    };

    //操作依赖 操作1 依赖 操作5 注意死循环
    [op1 addDependency:op5];
    [op1 addDependency:op4];
    
      [queue addOperation:op1];
      [queue addOperation:op2];
      [queue addOperation:op3];
      [queue addOperation:op4];
      [queue1 addOperation:op5];
    
}

/* nsoperation线程通信 */
- (void)nsoperationqueueCommunication {
    
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_Mybutton.frame), CGRectGetMaxY(_Mybutton.frame)+20, 300, 300)];
    imageVc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _imageView = imageVc;
    [self.view addSubview:imageVc];
    
    //开启队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //下载图片
    [queue addOperationWithBlock:^{
        //加载图片地址
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542799499895&di=b947a343c4f9241a8da68d56c3db49ec&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F11%2F20150111083239_dwyET.jpeg"];
        //转换成Data
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //把二进制数据转化生成图片
        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"---%@",[NSThread currentThread]);
        
        //回到主线程
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            self.imageView.image = image;
             NSLog(@"+++%@",[NSThread currentThread]);
            
        }];
    }];
    
}

- (void)nsoperationqueueGroup {
    
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_Mybutton.frame), CGRectGetMaxY(_Mybutton.frame)+20, 300, 300)];
    imageVc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _imageView = imageVc;
    [self.view addSubview:imageVc];
    
    //开启队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //下载图片1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        //加载图片地址
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542799499895&di=b947a343c4f9241a8da68d56c3db49ec&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F11%2F20150111083239_dwyET.jpeg"];
        //转换成Data
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //把二进制数据转化生成图片
        UIImage *image = [UIImage imageWithData:data];
        self.image1 = image;
        NSLog(@"---%@",[NSThread currentThread]);
        
    }];
    
    //下载图片2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        //加载图片地址
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542891369993&di=765e488640ebc144f7e020d9e2d6cd23&imgtype=jpg&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F03087bf40ad162d989e0c90e1ddfa9ec8a13cd92.jpg"];
        //转换成Data
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //把二进制数据转化生成图片
        UIImage *image = [UIImage imageWithData:data];
        self.image2 = image;
        NSLog(@"---%@",[NSThread currentThread]);
        
    }];


    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        //合成图片 开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(300, 300));
        
        //图片1
        [self.image1 drawInRect:CGRectMake(0, 0, 300, 150)];
        
        //图片2
        [self.image2 drawInRect:CGRectMake(0, 150, 300, 150)];
        
        //根据图形上下文拿到图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭图形上下文
        UIGraphicsEndImageContext();
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            
            NSLog(@"刷新UI--%@",[NSThread currentThread]);
        });
    }];
    
    [op3 addDependency:op1];
    [op3 addDependency:op2];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
}


@end
