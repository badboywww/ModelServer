//
//  HRRequestTools.h
//  HRKJ
//
//  Created by Bad on 2018/3/6.
//  Copyright © 2018年 Mr.GBLW. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MyBasicBlock)(id result);
typedef void (^FailedBlock)(NSString *result);
typedef void (^SuccessBlock)(NSDictionary *result);
typedef void (^ProgressBlock)(NSProgress *progress);


@interface HRRequestTools : NSObject

@property(nonatomic,copy)MyBasicBlock responseBlock;
@property(nonatomic,copy)MyBasicBlock errorBlock;
@property(nonatomic,copy)ProgressBlock Progress;

//方法:

//1.自动登录;
//+ (void)autoLogin:(NSDictionary *)dic Success:(SuccessBlock)success failed:(FailedBlock)faild;

//2.创建单例：
+ (id)shareInstance;

//3.网络请求:

/**
 带加载框的请求
 URL:请求URL
 Method:请求方式
 Params:请求参数
 Message:加载框提示信息
 Success:成功回调Block
 Failed:失败回调Block
 */
+ (void)RequestWithURL:(NSString *)url Method:(NSString *)method Params:(id)params Message:(NSString *)message Success:(SuccessBlock)success Failed:(FailedBlock)failed;

/**
 普通请求
 URL:请求URL
 Method:请求方式
 Params:请求参数
 Success:成功回调Block
 Failed:失败回调Block
 */
+ (void)RequestWithURL:(NSString *)url Method:(NSString *)method Params:(id)params Success:(SuccessBlock)success Failed:(FailedBlock)failed;

+ (void)HttpWithURL:(NSString *)url Method:(NSString *)method Params:(id)params Success:(SuccessBlock)success Failed:(FailedBlock)failed;

+(void)BaseWithURL:(NSString *)url Opt:(NSString *)shoveOpt userId:(NSString *)userId infoDict:(NSDictionary *)infoDict Success:(SuccessBlock)success Failed:(FailedBlock)failed;

/**
 上传图片
 URL:请求URL
 image   图片
 photos  图片数组
 Params:请求参数
 Success:成功回调Block
 Failed:失败回调Block
 */

//单张
+ (void)RequestImageWithURL:(NSString *)url image:(UIImage *)image params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailedBlock)failure;
//多张：
+ (void)RequestImageWithURL:(NSString *)url photos:(NSArray *)photos params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailedBlock)failure;

+ (void)RequestFile:(UIImage *)image andParams:(NSDictionary *)dic andUrl:(NSString *)Url Progress:(ProgressBlock)progress Success:(SuccessBlock)success failed:(FailedBlock)faild;


/**
 上传视频（有进度条）
 URL:请求URL
 Params:请求参数
 Data:请求数据
 Progress:季度条
 Success:成功回调Block
 Failed:失败回调Block
 */
+(void)RequestUpLoadVideoWithParams:(NSDictionary *)params URL:(NSString *)url  Data:(NSData *)data Success:(SuccessBlock)success Failed:(FailedBlock)faild Progress:(ProgressBlock)progress;


+(void)NewGetRequsestWithURL:(NSString *)url Success:(SuccessBlock)success Failed:(FailedBlock)failed;

/**
 上传文件
 Url:上传地址
 LocalFiles:本地文件地址
**/
+(void)RequestFileUrl:(NSString *)Url LocalFiles:(NSString *)localfiles Progress:(ProgressBlock)progress Success:(SuccessBlock)success failed:(FailedBlock)faild;
@end
