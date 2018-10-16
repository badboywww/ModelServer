//
//  PhotoSelectorView.h
//  NIM
//
//  Created by apple on 2017/10/13.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotoView;

@protocol PhotoViewDelegate<NSObject>

- (void)postImages:(NSArray *)imageArray;


@end

@interface PhotoSelectorView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic , weak) id<PhotoViewDelegate> delegate;

@end
