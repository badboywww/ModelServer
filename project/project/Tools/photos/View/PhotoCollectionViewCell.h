//
//  PhotoCollectionViewCell.h
//  NIM
//
//  Created by apple on 2017/10/13.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic , strong) UIImageView* imageView;
@property (nonatomic , strong) UIButton* btn;
@property (nonatomic , assign) PhotoModel*  model;

@end 
