//
//  HRRequestTools.m
//  HRKJ
//
//  Created by Bad on 2018/3/6.
//  Copyright © 2018年 Mr.GBLW. All rights reserved.
//

#import "HRRequestTools.h"

@implementation HRRequestTools




#pragma mark 普通：
+(void)RequestWithURL:(NSString *)url Method:(NSString *)method Params:(id)params Success:(SuccessBlock)success Failed:(FailedBlock)failed{

    Reachability *reach=[Reachability reachabilityForInternetConnection];
    NetworkStatus status=[reach currentReachabilityStatus];
    
    if (status == NotReachable) {
//        [MBProgressHUD showToastAndMessage:@"没有网络，请检查您的网络" places:0 toView:nil];
        return;
    }
    
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];

    
    //请求：
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
   manager.requestSerializer=[AFJSONRequestSerializer serializer];
   manager.responseSerializer=[AFJSONResponseSerializer serializer];
    
    manager.securityPolicy=[AFSecurityPolicy defaultPolicy];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
    manager.securityPolicy.allowInvalidCertificates=YES;
    manager.securityPolicy.validatesDomainName=NO;
    
    //超时时间：
    manager.requestSerializer.timeoutInterval=60;
    
    if ([method isEqualToString:@"get"]||[method isEqualToString:@"GET"]) {
        
        [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
             NSLog(@"error==%@",error.localizedFailureReason);
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }];

    }else if([method isEqualToString:@"post"]||[method isEqualToString:@"POST"]){
        [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
            NSLog(@"upload=%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            [MBProgressHUD hideHUDForView:nil];
            
            NSLog(@"error==%@",error.localizedFailureReason);
            
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
             NSLog(@"error==%@",error.localizedFailureReason);
           failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
            
        }];
    }else if ([method isEqualToString:@"put"] || [method isEqualToString:@"PUT"]){
        [manager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            [MBProgressHUD hideHUDForView:nil];
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            [MBProgressHUD hideHUDForView:nil];
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }];
    }else if([method isEqualToString:@"delete"] || [method isEqualToString:@"DELETE"]){
        manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];
        [manager DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            [MBProgressHUD hideHUDForView:nil];
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            [MBProgressHUD hideHUDForView:nil];
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }];
        
    }
    
}


+(void)HttpWithURL:(NSString *)url Method:(NSString *)method Params:(id)params  Success:(SuccessBlock)success Failed:(FailedBlock)failed{
    

    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    
    
    //请求：
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    // 设置请求头
    
    // 设置接收的Content-Type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//返回格式 JSON
    //设置返回C的ontent-type
    manager.responseSerializer.acceptableContentTypes=[[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    //超时时间：
    manager.requestSerializer.timeoutInterval=60;
    
    if ([method isEqualToString:@"get"]||[method isEqualToString:@"GET"]) {
        
        [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSLog(@"error==%@",error.localizedFailureReason);
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }];
        
    }else if([method isEqualToString:@"post"]||[method isEqualToString:@"POST"]){
        
        [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
            NSLog(@"upload=%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
           
            NSLog(@"error==%@",error.localizedFailureReason);
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
           // failed([NSString stringWithFormat:@"error.code==%lu---statusCode=%ld",(long)error.code,(long)statusCode]);
            
        }];
    }
}

#pragma mark 普通带框：
+ (void)RequestWithURL:(NSString *)url Method:(NSString *)method Params:(id)params Message:(NSString *)message Success:(SuccessBlock)success Failed:(FailedBlock)failed{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    if (status == NotReachable) {
//        [MBProgressHUD showToastAndMessage:@"没有网络,请检查你的网络!" places:0 toView:nil];
        return;
    }
    //显示加载框
//    [MBProgressHUD showHUDAndMessage:message toView:nil];
    //请求
    AFHTTPSessionManager *maneger =[AFHTTPSessionManager manager];
    maneger.requestSerializer = [AFJSONRequestSerializer serializer];
    //超时时间
    maneger.requestSerializer.timeoutInterval = 10;
    
  //  [maneger.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    maneger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    
    //    maneger.responseSerializer = [AFJSONResponseSerializer serializer];
    maneger.securityPolicy = [AFSecurityPolicy defaultPolicy];
    maneger.securityPolicy.allowInvalidCertificates = YES;
    maneger.securityPolicy.validatesDomainName = NO;
    
    if ([method isEqualToString:@"get"] || [method isEqualToString:@"GET"]) {
        
        [maneger GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
//            [MBProgressHUD hideHUDForView:nil];
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            [MBProgressHUD hideHUDForView:nil];
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }];
    }else if ([method isEqualToString:@"post"] || [method isEqualToString:@"POST"]){
        [maneger POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            [MBProgressHUD hideHUDForView:nil];
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            [MBProgressHUD hideHUDForView:nil];
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }];
    }else if ([method isEqualToString:@"put"] || [method isEqualToString:@"PUT"]){
        [maneger PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            [MBProgressHUD hideHUDForView:nil];
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            [MBProgressHUD hideHUDForView:nil];
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }];
    }else if([method isEqualToString:@"delete"] || [method isEqualToString:@"DELETE"]){
        [maneger DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
//            [MBProgressHUD hideHUDForView:nil];
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
//            [MBProgressHUD hideHUDForView:nil];
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
            
        }];
        
    }
}

#pragma mark 图片--单张：
+ (void)RequestImageWithURL:(NSString *)url image:(UIImage *)image params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailedBlock)failure{
    NSArray *array = [NSArray arrayWithObject:image];
    [self RequestImageWithURL:url photos:array params:params success:success failure:failure];
}
#pragma mark 图片--多张：
+ (void)RequestImageWithURL:(NSString *)url photos:(NSArray *)photos params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailedBlock)failure{
    
    Reachability *reach=[Reachability reachabilityForInternetConnection];
    NetworkStatus status=[reach currentReachabilityStatus];
    
    if (status == NotReachable) {
//        [MBProgressHUD showToastAndMessage:@"没有网络，请检查您的网络" places:0 toView:nil];
        return;
    }
    
    //请求：
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    manager.securityPolicy=[AFSecurityPolicy defaultPolicy];
    [manager.requestSerializer setValue:@"mobile" forHTTPHeaderField:@"User-Agent"];
    //接收类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    manager.securityPolicy.allowInvalidCertificates=YES;
    manager.securityPolicy.validatesDomainName=NO;
    
    //超时时间：
    manager.requestSerializer.timeoutInterval=30;
    
    [SVProgressHUD showProgress:-1 status:@"正在上传,请稍等."];
   
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i=0; i<photos.count; i++) {
            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            formatter.dateFormat=@"yyyyMMddHHmmss";
            NSString *str=[formatter stringFromDate:[NSDate date]];
            NSString *fileName=[NSString stringWithFormat:@"%@.jpg",str];
            UIImage *image=photos[i];
            NSData *imageData=UIImageJPEGRepresentation(image, 0.3);
            
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"upload%d",i+1] fileName:fileName mimeType:@"image/jpeg"];
        }
        
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress is %lld,总字节 is %lld",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        NSLog(@"进度%f",uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *resultCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"result_code"]];
        NSString *resultInfo = [responseObject objectForKey:@"result_info"];
       NSLog(@"resultInfo is %@",resultInfo);
        if ([resultCode isEqualToString:@"1"]) {
            [SVProgressHUD showSuccessWithStatus:@"上传成功"];
            if (success == nil) return ;
            success(responseObject);
        }else {
            [SVProgressHUD showErrorWithStatus:resultInfo];
            if (failure == nil) return ;
            NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
            //通讯协议状态码
            NSInteger statusCode = response.statusCode;
            NSLog(@"statusCode=%ld",(long)statusCode);
            failure([NSString stringWithFormat:@"%ld",(long)statusCode]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"上传失败"];
        if (failure == nil) return ;
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        //通讯协议状态码
        NSInteger statusCode = response.statusCode;
        NSLog(@"statusCode=%ld",(long)statusCode);
        failure([NSString stringWithFormat:@"%ld",(long)statusCode]);
    }];
    
    
}

#pragma mark 视频;
+(void)RequestUpLoadVideoWithParams:(NSDictionary *)params URL:(NSString *)url  Data:(NSData *)data Success:(SuccessBlock)success Failed:(FailedBlock)faild Progress:(ProgressBlock)progress{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    
    //超时时间：
    manager.requestSerializer.timeoutInterval=30;
    
    [manager.requestSerializer setValue:@"mobile" forHTTPHeaderField:@"User-Agent"];

    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat =@"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSLog(@"str:%@",str);
        
        NSString *fileName = [NSString stringWithFormat:@"%@.mp4", str];
        
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"video/quicktime"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     //   [MBProgressHUD hideHUDForView:nil];
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      //  [MBProgressHUD hideHUDForView:nil];
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        //通讯协议状态码
        NSInteger statusCode = response.statusCode;
        NSLog(@"statusCode=%ld",(long)statusCode);
        faild([NSString stringWithFormat:@"%ld",(long)statusCode]);
    }];
}

+ (void)RequestFile:(UIImage *)image andParams:(NSDictionary *)dic andUrl:(NSString *)Url Progress:(ProgressBlock)progress Success:(SuccessBlock)success failed:(FailedBlock)faild{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    
    [manager.requestSerializer setValue:@"mobile" forHTTPHeaderField:@"User-Agent"];
   
    //接收类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         //                                                         @"video/mp4",
                                                         //                                                         @"video/mov",
                                                         //                                                         @"video/avi",
                                                         nil];
    [manager POST:Url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        
        NSData *imageData =UIImageJPEGRepresentation(image,1);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat =@"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSLog(@"str:%@",str);
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/jpeg"];
    } progress:^(NSProgress *_Nonnull uploadProgress) {
        progress(uploadProgress);
        NSLog(@"%f",uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError * _Nonnull error) {
        //通讯协议状态码
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        NSInteger statusCode = response.statusCode;
        faild([NSString stringWithFormat:@"%ld",(long)statusCode]);
    }];
    
}


+(void)RequestFileUrl:(NSString *)Url LocalFiles:(NSString *)localfiles Progress:(ProgressBlock)progress Success:(SuccessBlock)success failed:(FailedBlock)faild{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    
    [manager.requestSerializer setValue:@"mobile" forHTTPHeaderField:@"User-Agent"];
    
    //接收类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         @"text/plain",
                                                         //                                                         @"video/mp4",
                                                         //                                                         @"video/mov",
                                                         //                                                         @"video/avi",
                                                         nil];
    
 
    
    [manager POST:Url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSURL *fileUrl = [NSURL fileURLWithPath:localfiles];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat =@"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSLog(@"str:%@",str);
        
        NSString *fileName = [NSString stringWithFormat:@"%@_ios.txt", str];
        
        //上传的参数(上传图片，以文件流的格式)
        /**
         NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
         formatter.dateFormat =@"yyyyMMddHHmmss";
         NSString *str = [formatter stringFromDate:[NSDate date]];
         NSLog(@"str:%@",str);
         
         NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
         //上传的参数(上传图片，以文件流的格式)
         [formData appendPartWithFileData:imageData
         name:@"file"
         fileName:fileName
         mimeType:@"image/jpeg"];
        **/
        
        NSLog(@"fileUrl:%@--fileName:%@",fileUrl,fileName);

        [formData appendPartWithFileURL:fileUrl
                                   name:@"file"
                               fileName:fileName
                               mimeType:@"text/plain"
                                  error:nil];
        
//       [formData appendPartWithFileURL:fileUrl name:@"file" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"请求进度---%@",uploadProgress);
        progress(uploadProgress);
        NSLog(@"%f",uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"请求成功---%@",responseObject);
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败--%@",error);
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        NSInteger statusCode = response.statusCode;
        faild([NSString stringWithFormat:@"%ld",(long)statusCode]);
        
    }];
    
    
    
    
    
}



#pragma mark  新网络请求

+(void)NewGetRequsestWithURL:(NSString *)url Success:(SuccessBlock)success Failed:(FailedBlock)failed{
    
    Reachability *reach=[Reachability reachabilityForInternetConnection];
    NetworkStatus status=[reach currentReachabilityStatus];
    
    if (status == NotReachable) {
        //        [MBProgressHUD showToastAndMessage:@"没有网络，请检查您的网络" places:0 toView:nil];
        return;
    }
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    manager.securityPolicy=[AFSecurityPolicy defaultPolicy];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
    manager.securityPolicy.allowInvalidCertificates=YES;
    manager.securityPolicy.validatesDomainName=NO;
    //超时时间：
    manager.requestSerializer.timeoutInterval=30;
    
    
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        //通讯协议状态码
        NSInteger statusCode = response.statusCode;
        NSLog(@"statusCode=%ld",(long)statusCode);
        failed([NSString stringWithFormat:@"%ld",(long)statusCode]);
    }];
}



+ (void)RequestDownloadFileUrl:(NSString *)url ViewController:(UIViewController *)view{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLRequest *requset = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
   
    
    
  NSURLSessionDownloadTask *downloadTask =  [manager downloadTaskWithRequest:requset progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSLog(@"targetPath:%@",targetPath);
      NSURL *url = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:response.suggestedFilename]];
        
        return url;
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
       
        
        NSLog(@"filePath%@",filePath);
        
    }];
    
    
    [downloadTask resume];
    
}




@end
