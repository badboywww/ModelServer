//
//  MenuItemModel.h
//  MyModelServer
//
//  Created by Bad on 2018/11/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuItemModel : NSObject

//图片
@property (nonatomic , strong) UIImage *Itemimage;
//标题
@property (nonatomic , strong) NSString *Itemtitle;

+(instancetype) itemWithTitle:(NSString *)title Image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
