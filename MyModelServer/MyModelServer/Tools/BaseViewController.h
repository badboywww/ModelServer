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

- (void)setHiddenBtn:(BOOL)hidden andbuttonTitle:(NSString *)title Action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
