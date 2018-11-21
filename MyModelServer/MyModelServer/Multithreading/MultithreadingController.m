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




@end

@implementation MultithreadingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
}


- (void)setNav {
    
    self.title = @"多线程";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
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


- (void)BtnClick:(UIButton *)sender{
    
   
//    [self pthread];
    
    [self NsThread];
    
    
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
    
   
    //第一种创建线程的方式
//    [self threadOne];
    
    //第二种创建线程的方式
//    [self threadTwo];
    
    //第二种创建线程的方式
//    [self threadThree];
    
    //线程的状态
//    [self threadstatus];
    
    //线程间通讯
//    [self threadcommunication];
    
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


@end
