//
//  mapLocation.h
//  MyModelServer
//
//  Created by Bad on 2018/12/2.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^ResultBlock)(CLLocation *__nullable location,CLPlacemark * __nullable pleaceMark,NSString * __nullable errorMsg);


@interface mapLocation : NSObject

@property (nonatomic , assign) BOOL isStopLocation;

singleH(mapLocation);


/**
 用户获取当前定位信息 YES:是  NO:否

 @param block  物理定位信息
 @param stop 是否单次定位 YES:是  NO:否
 */
- (void)getCurrentLocation:(ResultBlock)block StopLocation:(BOOL)stop;


@end

NS_ASSUME_NONNULL_END
