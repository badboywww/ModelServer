//
//  QuartzViewController.h
//  project
//
//  Created by Bad on 2018/10/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneView.h"
#import "pieView.h"
#import "UIKitDrawingViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface QuartzViewController : UIViewController<UITextFieldDelegate>


@property(nonatomic , strong)  UISlider *slider;

@property (nonatomic , strong) OneView *myView;

@property (nonatomic , strong) pieView *PieVc;

@end

NS_ASSUME_NONNULL_END
