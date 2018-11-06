//
//  WheelView.h
//  MyModelServer
//
//  Created by Bad on 2018/11/6.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WheelButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface WheelView : UIView<CAAnimationDelegate>

//快速创建一个WheelView
+(instancetype)wheelsView;

//开始旋转
-(void)start;
//暂停旋转
-(void)stop;


@end

NS_ASSUME_NONNULL_END
