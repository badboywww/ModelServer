//
//  ViewController.h
//  MyModelServer
//
//  Created by Bad on 2018/10/16.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneViewController.h"
#import "viewGroup/DragandDropViewController.h"
#import "Quartz2D/QuartzViewController.h"
#import "Tools/photos/View/GetPhotoViewController.h"
#import "WMT/MyOneViewController.h"
#import "dataStorageViewController.h"
#import "CALayer/CALayerViewController.h"
#import "Weibo/WeiboAnimationViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic , strong) UITableView *tableVc;
@property(nonatomic , strong) NSMutableArray *dataArray;

@end

