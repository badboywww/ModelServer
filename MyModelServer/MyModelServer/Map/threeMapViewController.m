//
//  threeMapViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/12/3.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "threeMapViewController.h"

@interface threeMapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

/** CLLocationManager */
@property (nonatomic, strong) CLLocationManager * locationM;



@end

@implementation threeMapViewController


#pragma mark - 懒加载
/** CLLocationManager */
- (CLLocationManager *)locationM
{
    if( !_locationM) {
        _locationM = [[CLLocationManager alloc] init];
        _locationM.delegate = self;
        
        [_locationM requestAlwaysAuthorization];
    }
    
    return _locationM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"地图";
    
    [self mapView];
}

/* mapView */
- (void)mapView
{
    
    self.myMapVc.delegate = self;
    
    //设置地图的类型
    self.myMapVc.mapType = MKMapTypeStandard;
    
    //设置地图的控制
    self.myMapVc.scrollEnabled = YES; //滚动
    self.myMapVc.rotateEnabled = YES; //旋转
    self.myMapVc.zoomEnabled = YES;   //放大
    
    //设置地图的显示项目
    self.myMapVc.showsBuildings = YES; //建筑物
    self.myMapVc.showsCompass = YES;   //指南针
    self.myMapVc.showsPointsOfInterest = YES; //兴趣点
    self.myMapVc.showsScale = YES;     //比例尺
    self.myMapVc.showsTraffic = YES;   //交通
    
    //显示自己的位置
    [self.locationM startUpdatingLocation];
    self.myMapVc.showsUserLocation = YES;
    
    //设置追踪模式
    self.myMapVc.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    
    
}




/**
 当获取到位置信息之后

 @param mapView 地图
 @param userLocation “大头针数据模型”
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    
    //MKUserLocation 大头针数据模型
    
    userLocation.title = @"wwy";
    userLocation.subtitle = @"在这里";
    
    //地图跟着用户移动
    [mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
   
    //放大的范围
    /**
     center : 中心点 span:跨度
     经度跨度:地图中视觉的宽，所占据的经度
     纬度跨度:地图的高，所占据的纬度
     经纬度跨度越小，所看见的地图越详细
     */
    CLLocationCoordinate2D center = userLocation.location.coordinate;

    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.002);

    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);

    [mapView setRegion:region animated:YES];

}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
    //获取合适的跨度信息
    
    
}


@end
