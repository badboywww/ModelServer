//
//  UIKitDrawingViewController.h
//  project
//
//  Created by Bad on 2018/10/13.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoView.h"
#import "MyImgeView.h"
#import "DrawView.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIKitDrawingViewController : UIViewController

@property(nonatomic , strong)TwoView *twoVc;

@property(nonatomic , strong)DrawView *drawVc;

@end

NS_ASSUME_NONNULL_END
