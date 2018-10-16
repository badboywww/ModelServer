//
//  MyOneViewController.h
//  project
//
//  Created by Bad on 2018/10/15.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface MyOneViewController : UIViewController<UICollectionViewDelegateFlowLayout,
                                                  UICollectionViewDelegate,
                                                  UICollectionViewDataSource,
                                                  UIImagePickerControllerDelegate,
                                                  UINavigationControllerDelegate>
@property (nonatomic , strong) UIView *headerView;
@end

NS_ASSUME_NONNULL_END
