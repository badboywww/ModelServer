//
//  mapLocation.m
//  MyModelServer
//
//  Created by Bad on 2018/12/2.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "mapLocation.h"

@interface mapLocation()<CLLocationManagerDelegate>

/** 记录要执行的代码块 */
@property (nonatomic, copy) ResultBlock block;

//属性 位置管理者
@property (nonatomic, strong) CLLocationManager * locationM;

//属性 地理位置管理器
@property (nonatomic, strong) CLGeocoder * geoC;

@end

@implementation mapLocation

singleM(mapLocation);


#pragma mark - 懒加载
/** 位置管理者 */
- (CLLocationManager *)locationM
{
    if( !_locationM) {
        _locationM = [[CLLocationManager  alloc] init];
        _locationM.delegate = self;
        
        // 设置定位精确度到米
        _locationM.desiredAccuracy = kCLLocationAccuracyBest;
        // 设置过滤器为无
        _locationM.distanceFilter = kCLDistanceFilterNone;
        
        //请求授权
        if (is_IOS(8.0)) {
            
            //获取info的文件
            NSDictionary *inDic = [[NSBundle mainBundle]infoDictionary];
            //获取授权
            NSString *always = inDic[@"NSLocationAlwaysUsageDescription"];
            NSString *whenInUse = inDic[@"NSLocationWhenInUseUsageDescription"];
            NSString *All = inDic[@"NSLocationAlwaysAndWhenInUseUsageDescription"];
            
            if ([always length] > 0 || [All length] > 0 ) {
                 [_locationM requestAlwaysAuthorization];
            }else if([whenInUse length] > 0){
                [_locationM requestWhenInUseAuthorization];
                
                NSArray *services = inDic[@"UIBackgroundModes"];
                
                if (![services containsObject:@"location"]) {
                    NSLog(@"当前状态是前台授权，如果想要在后台获取用户位置信息，必须勾选后台模式");
                }else {
                    
                    if (is_IOS(9.0)) {
                        _locationM.allowsBackgroundLocationUpdates = YES;
                    }
                    
                }
                
                
            }else{
                [MBProgressHUD showToastAndMessage:@"请开启定位服务 NSLocationWhenInUseUsageDescription 或 NSLocationAlwaysUsageDescription " places:0 toView:nil];
                
                NSLog(@"请开启定位服务 NSLocationWhenInUseUsageDescription 或 NSLocationAlwaysUsageDescription");
            }
            
        }
       
        
        
    }
    
    return _locationM;
}

/** 地理编码管理器 */
- (CLGeocoder *)geoC
{
    if( !_geoC) {
        _geoC = [[CLGeocoder alloc] init];
    }
    
    return _geoC;
}


/**
 代理转block

 @param block 地址信息
 */
- (void)getCurrentLocation:(ResultBlock)block StopLocation:(BOOL)stop{
    
    //是否是单次定位
    self.isStopLocation = stop;
    
    //先记录代码块，在合适位置调用
    self.block = block;
    
    //在此处,并不能直接获取当前用户位置,地标
    
    if ([CLLocationManager locationServicesEnabled]) {
         [self.locationM startUpdatingLocation];
    }else{
        self.block(nil, nil, @"定位服务没有开启");
    }

    
}


#pragma mark 关于 CLLocationManagerDelegate


/**
 @param manager 位置管理者
 @param locations 位置数组
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    //获取位置信息
    CLLocation *location = [locations lastObject];
    
    if (location.horizontalAccuracy < 0) {
        return ;
    }
    
    //获取反地理编码
    [self.geoC reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (error == nil) {
            
            //获取地标对象
            CLPlacemark *pl = [placemarks firstObject];
            
            self.block(location, pl, nil);
            
            
        }else{
            self.block(location, nil, error.localizedDescription);
        }

    }];
    
    
    if (self.isStopLocation) {
        //关闭定位服务
        [manager stopUpdatingLocation];
    }
    
    
}


@end
