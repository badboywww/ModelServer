//
//  BaseViewController.h
//  MyModelServer
//
//  Created by Bad on 2018/11/30.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

//属性
@property (nonatomic, strong) UIButton * button;

/** tableview */
@property (nonatomic, strong) UITableView * tableview;


/**
 是否隐藏button YES:隐藏 NO:显示

 @param hidden 是否隐藏 YES 隐藏  NO 显示
 @param frame frame
 @param title buttonLabel
 @param action buttonAction
 */
- (void)setHiddenBtn:(BOOL)hidden withbtnFrame:(CGRect)frame andbuttonTitle:(NSString *)title Action:(SEL)action;


/**
 是否需要tableview YES:隐藏 NO:显示

 @param hidden 是否隐藏
 @param frame frames
 
 */
- (void)setHiddenTableView:(BOOL)hidden withTableViewFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
