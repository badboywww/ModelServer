//
//  MyImgeView.h
//  project
//
//  Created by Bad on 2018/10/13.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyImgeView : UIView

@property (nonatomic , strong)UIImage *image;


-(instancetype)initWithImage:(UIImage *)image;


@end

NS_ASSUME_NONNULL_END
