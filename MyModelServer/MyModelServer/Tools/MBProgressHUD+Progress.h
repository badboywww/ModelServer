//
//  MBProgressHUD+Progress.h
//  LotteryTicket
//
//  Created by Bad on 2018/11/14.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MBProgressHUD.h"
#import "Macro.h"
NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (Progress)

/**
 *  显示MBProgressHUD透明层遮盖
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showHUDtoView:(UIView *)view;

/**
 *  显示小菊花MBProgressHUD
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showHUDAndMessage:(NSString *)message toView:(UIView *)view;

/**
 *  显示Toast。MBProgressHUD
 *
 *  @param message 信息内容
 *  @param places  0 居中    1 居底部
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showToastAndMessage:(NSString *)message places:(NSInteger)places toView:(nullable UIView *)view;

/**
 *  显示Toast。MBProgressHUD
 *
 *  @param message 信息内容
 *  @param places  0 居中    1 居底部
 *  @param delay   消失的时间
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showToastAndMessage:(NSString *)message places:(NSInteger)places afterDelay:(NSTimeInterval)delay toView:(UIView *)view;

/**
 *  关闭小菊花MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
