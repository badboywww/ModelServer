//
//  myRunLoopController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/27.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "myRunLoopController.h"

@interface myRunLoopController ()

@property (nonatomic , strong) NSThread *thread;

@property (nonatomic , strong) dispatch_source_t timer;

@property (nonatomic , strong) UIImageView *imageView;

@property (nonatomic , strong) UIButton *button;

@end

@implementation myRunLoopController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
    
    NSLog(@"%@",[NSRunLoop currentRunLoop]);
}

/* Nav */
- (void)setNav {
    
    self.title = @"RunLoop";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

/* 返回 */
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
    [btn setTitle:@"Button1" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    btn.frame = CGRectMake(CGRectGetMinX(textVc.frame), CGRectGetMaxY(textVc.frame)+50, 100, 50);
    [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _button = btn;
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"Button2" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor blueColor]];
    btn2.frame = CGRectMake(CGRectGetMaxX(btn.frame)+50, CGRectGetMaxY(textVc.frame)+50, 100, 50);
    [btn2 addTarget:self action:@selector(Btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_button.frame), CGRectGetMaxY(_button.frame)+20, 300, 300)];
    imageVc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _imageView = imageVc;
    [self.view addSubview:imageVc];
    
}
- (void)BtnClick :(UIButton *)sender {
    
    //runloop基本信息  [self runLoop];
    
    //子线程的runloop  [self runLoop2];
    
    //runloop的相关类  [self runloop3];
    
    //GCD的RunLoop    [self gcdRunloop];
    
    //runloopsource   [self runloopsource];
    
    //runloopobserver [self runloopobserver];
    
    //runloop的应用
    [self runloopN];
    
    
    
}
- (void)Btn2Click:(UIButton *)sender {
    
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:YES];
    
}

- (void)test {
    NSLog(@"test---%@",[NSThread currentThread]);
}

/* runloop基本信息 */
- (void)runLoop {
    
    // 1.获取当前线程的runloop
    NSRunLoop *currentrunloop = [NSRunLoop currentRunLoop];
    CFRunLoopRef runloop1 = CFRunLoopGetCurrent();
    
    //2.获取主线程的runloop
    NSRunLoop *mainrunloop = [NSRunLoop mainRunLoop];
    CFRunLoopRef runloop2 = CFRunLoopGetMain();
    
    NSLog(@"%p---%p---%p---%p",mainrunloop,currentrunloop,runloop1,runloop2);
  
}

/* 子线程的runloop */
- (void)runLoop2 {
    
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(show) object:nil];
    thread.name = @"子线程1";
    _thread = thread;
    [thread start];
}
- (void)show{
    
    //获得当前线程的runloop
    [NSRunLoop currentRunLoop];
    
    
}

/* runloop的相关类 */
- (void)runloop3 {
    
  //1.  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runloopAction) userInfo:nil repeats:YES];
    
   
    // 2.创建 NSTimer
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(runloopAction) userInfo:nil repeats:YES];
    
    //添加到当前runloop 并选择默认的运行模式  [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    
   
    //当 UITrackingRunLoopMode 时 ，需要拖拽界面时，才工作 [[NSRunLoop currentRunLoop]addTimer:timer forMode:UITrackingRunLoopMode];
    
   
    //当 NSRunLoopCommonModes 标记时
    /*
     0 : <CFString 0x110a3dbe0 [0x105c26b68]>{contents = "UITrackingRunLoopMode"}
     2 : <CFString 0x105c3c168 [0x105c26b68]>{contents = "kCFRunLoopDefaultMode"}
     */
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    
    NSLog(@"%@",[NSRunLoop currentRunLoop]);
    
}
- (void)runloopAction {
    NSLog(@"----%@",[NSRunLoop currentRunLoop]);
    
}

/* GCD的RunLoop */
- (void)gcdRunloop {
    
    //提高程序性能
    
    //0.创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    /* 1.创建GCD 定时器
     第一个参数:表用创建的是个定时器
     第四个参数:队列
     */
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    self.timer = timer;
    
    /* 2.设置定时器的开始时间，间隔时间，精准度
     第一个参数:定时器对象
     第二个参数:开始时间
     第三个参数:间隔时间
     第四个参数:精准度 一般为零
     GCD 单位是 纳秒
     */
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    //3.定时器执行的事件
    dispatch_source_set_event_handler(timer, ^{
        
        NSLog(@"----");
        
    });
    
    //4.启动定时器
    dispatch_resume(timer);
    
}

/* runloopsource */
- (void)runloopsource {
    
    //source0 非基于port,用于用户主动触发事件
    //source1 基于port,通过内核和其他线程相互发送信息
    
    NSLog(@"%s",__func__);
    
}

/* runloopobserver */
- (void)runloopobserver {
    
    /*
     kCFRunLoopEntry = (1UL << 0),
     kCFRunLoopBeforeTimers = (1UL << 1),
     kCFRunLoopBeforeSources = (1UL << 2),
     kCFRunLoopBeforeWaiting = (1UL << 5),
     kCFRunLoopAfterWaiting = (1UL << 6),
     kCFRunLoopExit = (1UL << 7),
     */
    
    /* 1.创建一个监听对象
     第一个参数:分配存储空间
     第二个参数:要监听的一个状态 kCFRunLoopAllActivities 所有状态
     第三个参数:是否需要持续监听 YES 是的 NO 不是
     第四个参数:优先级
     第五个参数:block 回调
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {

        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"RunLoop 进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"RunLoop 要去处理timer");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"RunLoop 要去处理Sources");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"RunLoop 等待");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"RunLoop 唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"RunLoop 退出");
                break;
            default:
                break;
        }
        
    });
    
    
    /* 2.给runloop 添加监听者
     第一个参数:要监听的runloop
     第二个参数:监听者
     第三个参数:要监听runloop在哪种运行模式状态
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
 
    //CF需要释放的
    CFRelease(observer);
}

/* runloop的应用 */
- (void)runloopN {
   
    //默认是在 Default 模式下运行
 //   [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"lyer"] afterDelay:2.0];
//
//    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"lyer"] afterDelay:2.0 inModes:@[NSDefaultRunLoopMode,UITrackingRunLoopMode]];
    
    //常驻线程:
    runLoopThread *thread = [[runLoopThread alloc]initWithTarget:self selector:@selector(runlooprun) object:nil];
    _thread = thread;
    [thread start];
    
    //自动释放池
    /*
     _wrapRunLoopWithAutoreleasePoolHandler activities = 0x1   1
     _wrapRunLoopWithAutoreleasePoolHandler activities = 0xa0   160
     
     自动释放池在什么时候创建，什么时候释放
     第一次创建:第一次进入runloop的时候
     最后一次释放:runloop 退出的时候
     其他情况:runloop 将要休眠的时候，然后再创建一个新的
      kCFRunLoopExit + kCFRunLoopBeforeWaiting = 160
     */
    
}

/* 常驻线程 */
- (void)runlooprun {
    
    NSLog(@"show---");
    
    /*
     1.子线程的runloop需要手动创建
     2.需要手动开启
     3.runloop 里面至少要有一个source 或者 timer, obderver是不行的
    */
    
    //1.添加source
    
//    [[NSRunLoop currentRunLoop]addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop]run];
    
    //2.添加Timer
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]run];
}

@end
