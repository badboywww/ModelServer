//
//  MenuItemModel.m
//  MyModelServer
//
//  Created by Bad on 2018/11/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MenuItemModel.h"

@implementation MenuItemModel


+(instancetype)itemWithTitle:(NSString *)title Image:(UIImage *)image{
    
 MenuItemModel *item = [[self alloc]init];
    item.Itemtitle = title;
    item.Itemimage = image;
    return item;
    
}


@end
