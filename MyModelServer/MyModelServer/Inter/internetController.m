//
//  internetController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/27.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "internetController.h"

@interface internetController ()<NSURLConnectionDataDelegate,UIWebViewDelegate>

@property (nonatomic , strong) UIWebView *webVc;
@end

@implementation internetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setNav];
    [self setUI];
    
}



/* Nav */
- (void)setNav {
    
    self.title = @"网络编程";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

/* 返回 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"Button2" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor blueColor]];
    btn2.frame = CGRectMake(100, 150, 100, 50);
    [btn2 addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)BtnClick:(UIButton *)sender {
    
    //NSURLConnection [self NSURLConnection];
    
    //webView
    [self setwebView];
    
}

/*  webView  */
- (void)setwebView {
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"httpwebview.html" withExtension:nil];
    
    UIWebView *webVc = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, Swidth, Sheight-64)];
    
    [webVc loadRequest:[NSURLRequest requestWithURL:url]];
    webVc.scalesPageToFit = YES;
    webVc.delegate = self;
    //内边距
    webVc.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    webVc.dataDetectorTypes = UIDataDetectorTypeAll;
    
    self.webVc = webVc;
    
    [self.view addSubview:webVc];
    
}

/*  NSURLConnection  */
- (void)NSURLConnection {
    
    //1.请求路径
//    NSURL *url = [NSURL URLWithString:@"https://weibo.com/"];
    
    //2.确定请求对象
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.发送请求 发送同步请求
    /*
     第一个参数:  请求对象
     第二个参数: 请求头
     第三个参数: 错误信息
     注意点:会卡主主线程
     */
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
     /*
      第一个参数:请求对象
      第二个参数:队列
      第一个参数:当请求结束后会调用block
      response 响应头
      data   响应体
      connectionError 错误信息
      
    */
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//
//        if (connectionError) {
//            NSLog(@"请求失败");
//        }else {
//
//            NSString *res = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//
//            NSLog(@"%@",res);
//        }
//
//    }];
    
}

#pragma mark 关于 NSURLConnectionDataDelegate
/*
 1.当接收到服务器响应时调用
 */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
}
/*
 2.当接收到服务器返回数据时调用，会被调用多次
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
}
/*
 3.当请求结束时调用
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
}
/*
 4.当请求失败时调用
 */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}



#pragma mark 关于 webview
//每次加载请求时，先调用该方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"%@",request.URL.absoluteString);
    
    
    //JS 调用 OC
    NSString *requestUrl = request.URL.absoluteString;
    NSString *Strr = @"xmg://";
    
  
   
    if ([requestUrl hasPrefix:Strr]) {
        
//        return  [self oneOrZero:requestUrl Strr:Strr];
        
        NSLog(@"JS 调用方法");
        
        //1.把方法名称拿出来
        NSString *methedStr = [requestUrl substringFromIndex:Strr.length];
        NSLog(@"methedStr == %@",methedStr);
        
        //分割字符串
        NSArray *array = [methedStr componentsSeparatedByString:@"?"];
        
        //替换字符串 _ → ：
        methedStr = [[array firstObject]stringByReplacingOccurrencesOfString:@"_" withString:@":"];
        
        //处理参数
        NSString *parm =  [array lastObject];
        NSArray *paramArray = [parm componentsSeparatedByString:@"&"];
        
        NSString *param1 = [paramArray firstObject];
        NSString *param2 = [paramArray lastObject];
        
        
        SEL methedSEL =NSSelectorFromString(methedStr);
        
        //2.调用方法
        [self performSelector:methedSEL withObject:param1 withObject:param2];
        
        return NO;
        
        
    }
    
    
    return YES;
    
}


- (bool)oneOrZero:(NSString *)requestUrl Strr:(NSString *)Strr {
    
    NSLog(@"JS 调用方法");
    
    //1.把方法名称拿出来
    NSString *methedStr = [requestUrl substringFromIndex:Strr.length];
    NSLog(@"methedStr == %@",methedStr);
    
    //分割字符串
    NSArray *array = [methedStr componentsSeparatedByString:@"?"];
    
    //替换字符串 _ → ：
    methedStr = [[array firstObject]stringByReplacingOccurrencesOfString:@"_" withString:@":"];
    
    //处理参数
    NSString *parm =  [array lastObject];
    
    SEL methedSEL =NSSelectorFromString(methedStr);
    
    //2.调用方法
    [self performSelector:methedSEL withObject:parm];
    
    return NO;
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    //OC 调用 JS
 NSString *str =  [self.webVc stringByEvaluatingJavaScriptFromString:@"sum();"];
    
 NSLog(@"%d",[str intValue]);
    
    
}

- (void)call{
    NSLog(@"打电话给我");
}

- (void)callWithNumber:(NSString *)number{
    NSLog(@"打电话给%@",number);
}

- (void)callWithNumber:(NSString *)number andContext:(NSString *)text{
    NSLog(@"打电话给%@,告诉他:%@",number,text);
}

@end
