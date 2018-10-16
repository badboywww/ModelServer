//
//  GetPhotoViewController.h
//  NIM
//
//  Created by Bad on 2018/5/30.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoSelectorView.h"

@class GetPhotoViewController;

@protocol GetPhotoViewDelegate<NSObject>

- (void)postImages:(NSArray *)imageArray;

@end


@interface GetPhotoViewController : UIViewController<PhotoViewDelegate>

@property(nonatomic,weak) id<GetPhotoViewDelegate> delegate;

@end
