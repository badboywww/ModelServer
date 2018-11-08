//
//  CALayerViewController.h
//  MyModelServer
//
//  Created by Bad on 2018/10/22.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCALayer.h"
#import "WheelView.h"
#import "MusicalvibrationVc.h"
#import "ReflectionVc.h"
#import "ReflectionCodeVc.h"
#import "DrawVc.h"
NS_ASSUME_NONNULL_BEGIN

@interface CALayerViewController : UIViewController

@property (nonatomic , strong)myCALayer *myCaLayerVc;

@property (nonatomic , strong)UIImageView *myImageVc;

@property (nonatomic , strong)UIView *myRedVc;

@property (nonatomic , weak)WheelView *wheels;

@property(nonatomic , strong)UIImageView *TopImageVc;
@property(nonatomic , strong)UIImageView *BottomImageVc;
@property(nonatomic , strong)UIView *backVc;
@property (nonatomic , weak)CAGradientLayer *gradient;

@end

NS_ASSUME_NONNULL_END
