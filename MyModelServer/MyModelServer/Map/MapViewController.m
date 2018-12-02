//
//  MapViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/29.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MapViewController ()<CLLocationManagerDelegate,UIAlertViewDelegate,UITextViewDelegate,UITextFieldDelegate>
{
    CLLocation *_lastLocation;
}

@property (nonatomic , strong) CLLocationManager *locationManager;

//属性 地理编码
@property (nonatomic, strong) CLGeocoder * geoC;

//属性
@property (nonatomic, strong) UIButton * button;
//属性
@property (nonatomic, strong) UIImageView * imageView;

//属性
@property (nonatomic, strong) UITextView * textview;

//属性 纬度
@property (nonatomic, strong) UITextField * latitudetextField;

//属性 经度
@property (nonatomic, strong) UITextField * longitudeTextField;

//属性
@property (nonatomic, strong) UIButton * GeoBtn;

//属性
@property (nonatomic, strong) UIButton * AntigeoBtn;




@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    
    [self setUI];
    
    //地理编码和反地理编码 [self Geocoding];
   
}


- (CLGeocoder *)geoC {
    
    if (_geoC == nil) {
        _geoC = [[CLGeocoder alloc]init];
    }
    return _geoC;
}

- (CLLocationManager *)locationManager {
    
    if (_locationManager == nil) {
        // 初始化定位管理器
        _locationManager = [[CLLocationManager alloc] init];
        // 设置代理
        _locationManager.delegate = self;
        
        /*   ios 8.0 后    */
        
        // 设置定位精确度到米
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 设置过滤器为无
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        
        // 取得定位权限，有两个方法，取决于你的定位使用情况
        // 一个是requestAlwaysAuthorization，一个是requestWhenInUseAuthorization
        // 这句话ios8以上版本使用。
        [_locationManager requestAlwaysAuthorization];
        
        /*   ios 9.0 后    */
        
        //1.当前处于前台定位授权没那么在勾选后台模式，也不会获取用户位置
        
    }
    
    return _locationManager;
}

- (UIImageView *)imageView {
    
    if (_imageView == nil) {
        UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_button.frame), CGRectGetMaxY(_button.frame)+20, 250, 250)];
        imageVc.image = [UIImage imageNamed:@"compasspointer"];
        _imageView = imageVc;
    }
    return _imageView;
}

/* Nav */
- (void)setNav {
    
    self.title = @"地图";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

/* 返回 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.locationManager stopUpdatingLocation]; //停止物理位置调用
    [self.locationManager stopUpdatingHeading];  //停止设备朝向调用
}

- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 81, 50);
    [button setTitle:@"定位" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    _button = button;
    [self.view addSubview:button];
    
//    [self.view addSubview:self.imageView];
    
}

- (void)btnClick {
    
   //定位    [self Positioning];
    
  //指南针   [self compass];
    
  //区域监听  [self areaMonitoring];
    
  //第三方框架 [self threeclass];
    
    //代理转block
    [self mapMode];

}

/* 定位  */
- (void)Positioning {
    //2.使用管理者，开始更新用户位置
    [self.locationManager startUpdatingLocation]; //开始更新用户信息 ，一旦调用，就会在后台常驻。
    
    /*
     1.按照精确度从低到高，逐个定位
     2.在有效时间内，定位到，精确度最高的定位，直接告诉用户
     3.如果当前还没有到最高精确度，但超时，这时会吧最高精确度返回给用户
     4.定位失败，返回失败方法
     5.不能与 startUpdatingLocation 共用
     extern const CLLocationAccuracy kCLLocationAccuracyBestForNavigation
     extern const CLLocationAccuracy kCLLocationAccuracyBest;
     extern const CLLocationAccuracy kCLLocationAccuracyNearestTenMeters;
     extern const CLLocationAccuracy kCLLocationAccuracyHundredMeters;
     extern const CLLocationAccuracy kCLLocationAccuracyKilometer;
     extern const CLLocationAccuracy kCLLocationAccuracyThreeKilometers;
     */
   //单次定位 9.0 后 [self.locationManager requestLocation];
}

/* 定位的基本信息 */
- (void)setpositionAction:(NSArray<CLLocation *> *)locations {
    
    
    //按时间排序，拿到最新位置，直接取最后一个
    CLLocation *location = [locations lastObject];
    
    /*
     
     负值不可用
     
     coordinate         经纬度
     latitude           纬度
     longitude          经度
     horizontalAccuracy 水平精确度
     verticalAccuracy   垂直精确度（海拔）
     course             航向 0.0 ~ 359.9
     speed              速度
     timestamp          时间
     floor              楼层
     
     distanceFromLocation : 计算两个点的物理距离
     
     */
    
    /*演示场景: 用户的行走方向，偏离角度以及对应的物理直线行走距离  例如：北偏东 30° 方向移动了 8m */
    
    //1.确定当前航向  方向:当前航向 / 90 度 来判断方向
    
    NSInteger index = (int)location.course / 90;
    
    NSArray *courseArray = @[@"北偏东",@"东偏南",@"南偏西",@"西偏北"];
    
    NSString *courseStr = courseArray[index];
    
    //2.确定偏离角度  角度: 当前航向 % 90 度 取余判断角度
    NSInteger angle = (int)location.course % 90;
    
    //正方向
    if (angle == 0) {
        courseStr = [@"正" stringByAppendingString:[courseStr substringToIndex:1] ] ;
    }
    
    //3.确定行走距离
    CGFloat distance = 0;
    
    if (_lastLocation) {
        distance = [location distanceFromLocation:_lastLocation];
    }
    
    _lastLocation = location;
    
    //4.打印
    NSString *nowLocationStr;
    if (angle != 0) {
        nowLocationStr = [NSString stringWithFormat:@"%@ %zd° 方向,移动了 %fm",courseStr,angle,distance];
    }else{
        nowLocationStr = [NSString stringWithFormat:@"%@ 方向,移动了 %fm",courseStr,distance];
    }
    
    
    NSLog(@"定位到了:%@",nowLocationStr);
}

/* 指南针 */
- (void)compass {
    
    //1.获取当前设备的朝向("磁力计传感器")
    [self.locationManager startUpdatingHeading];
    
}

/* 区域监听 */
- (void)areaMonitoring {
    
    //判断当前区域是否可以被监听
    if (![CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        return ;
    }
    
    
    if ([CLLocationManager locationServicesEnabled]) {
        //0.创建区域中心和区域半径
        
        CLLocationCoordinate2D center;
        
        center.latitude = 20.2113;
        center.longitude = 120.360;
        
        CLLocationDirection distance = 1000.0;
        
        if(distance > self.locationManager.maximumRegionMonitoringDistance)
        {
            distance = self.locationManager.maximumRegionMonitoringDistance;
        }
        
        //1.创建区域
        /*
         
         第一个参数:区域中心
         第二个参数:区域半径
         第三个参数:
         
         */
        
        CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:center radius:distance identifier:@"XX"];
        
        //2.监听区域 只有移动才能被监听 [self.locationManager startMonitoringForRegion:region];
        
        //请求某个区域状态，不止可以获取指定区域状态，当状态发生变化也能调用对应代理方法
        [self.locationManager requestStateForRegion:region];
        
        
    }else{
        [[[UIAlertView alloc] initWithTitle:@"当前无定位功能" message:@"开启定位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
    
    }
    
    
    
    
}

/*地理编码和反地理编码*/
- (void)Geocoding {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(Swidth/2 - 40, 70, 100, 30)];
    text.text = @"详细地址";
    text.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:text];
    
    self.textview = [[UITextView alloc]initWithFrame:CGRectMake(Swidth/2 - 150, CGRectGetMaxY(text.frame)+10, 300, 185.4)];
    
    self.textview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.textview.delegate = self;
    
    [self.view addSubview:self.textview];
    
    //经度
    self.longitudeTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(text.frame)-25, CGRectGetMaxY(self.textview.frame)+20, 150, 30)];
    self.longitudeTextField.placeholder = @"经度";
    self.longitudeTextField.delegate = self;
    self.longitudeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.longitudeTextField];
    
    //纬度
    self.latitudetextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(text.frame)-25, CGRectGetMaxY(self.longitudeTextField.frame)+20, 150, 30)];
    self.latitudetextField.placeholder = @"纬度";
    self.latitudetextField.delegate = self;
    self.latitudetextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.latitudetextField];
    
    
    self.GeoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.GeoBtn setTitle:@"地理编码" forState:UIControlStateNormal];
    self.GeoBtn.frame = CGRectMake(CGRectGetMinX(self.textview.frame), CGRectGetMaxY(self.latitudetextField.frame)+20, 100, 30);
    [self.GeoBtn addTarget:self action:@selector(GeoBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.GeoBtn];
    
    self.AntigeoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.AntigeoBtn setTitle:@"反地理编码" forState:UIControlStateNormal];
    self.AntigeoBtn.frame = CGRectMake(CGRectGetMaxX(self.GeoBtn.frame)+100, CGRectGetMaxY(self.latitudetextField.frame)+20, 100, 30);
    [self.AntigeoBtn addTarget:self action:@selector(AntigeoBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.AntigeoBtn];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [self.view endEditing:YES];
    
}

//地理编码
- (void)GeoBtnAction {
    
    NSString *address = self.textview.text;
    
    if ([address length] == 0) {
        return ;
    }
    
    
    [self.geoC geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        /*
         
         CLPlacemark 地标对象
         location    对应的位置对象
         name        地址全称
         loacality
         按照相关性进行排序
         */
        
        CLPlacemark *pl = [placemarks firstObject];
        
        if (error == nil) {
            
            NSLog(@"纬度:%f---经度:%f",pl.location.coordinate.latitude,pl.location.coordinate.longitude);
            
            NSLog(@"%@",pl.name);
            
            self.latitudetextField.text = @(pl.location.coordinate.latitude).stringValue;
            self.longitudeTextField.text = @(pl.location.coordinate.longitude).stringValue;
            
        }
        
        
    }];
    
}

//反地理编码
- (void)AntigeoBtnAction {
    
    
    double latitude = [self.latitudetextField.text doubleValue];
    double longitude = [self.longitudeTextField.text doubleValue];
    
    CLLocation *location = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    
    
    [self.geoC reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        
        CLPlacemark *pl = [placemarks firstObject];
        
        if (error == nil) {
            
            NSLog(@"纬度:%f---经度:%f",pl.location.coordinate.latitude,pl.location.coordinate.longitude);
            
            NSLog(@"%@",pl.name);
            
            self.textview.text = pl.name;
            self.latitudetextField.text = @(pl.location.coordinate.latitude).stringValue;
            self.longitudeTextField.text = @(pl.location.coordinate.longitude).stringValue;
            
            
        }
        
        
        
    }];
    
}


/* 第三方框架 */
- (void)threeclass
{
    twoMapViewController *vc = [[twoMapViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


/* 代理转block */
- (void)mapMode
{
    [[mapLocation sharemapLocation]getCurrentLocation:^(CLLocation * _Nullable location, CLPlacemark * _Nullable pleaceMark, NSString * _Nullable errorMsg) {
        
        if (errorMsg.length > 0) {
            [MBProgressHUD showToastAndMessage:errorMsg places:0 toView:nil];
            
            return;
        }
        
                NSLog(@"%@--%@",pleaceMark.name,location);
        
        
    }StopLocation:NO];
}


#pragma mark 关于 CLLocationManagerDelegate

//当用户取到位置信息时，调用
/**
 定位之后进入该方法
 manager   位置管理者
 locations 位置数组
*/
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    //定位的基本信息
    [self setpositionAction:locations];
    
    
}

//获取用户设备朝向时调用
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    
    
    /* 指南针的基本信息 */
    /*
     CLHeading
     magneticHeading   距离磁北方向的角度
     trueHeading       距离真北方向的角度
     headingAccuracy   该值为负，角度不可用
     x
     y
     z
     timestamp         时间
     
     
     */
    
    if (newHeading.headingAccuracy < 0) {
        return ;
    }
    
    //1.获取设备朝向
    CLLocationDirection angle = newHeading.magneticHeading;
    
    //2.反方向旋转指南针图片(弧度)
    float radius = angle / 180.0 * M_PI;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.imageView.transform = CGAffineTransformMakeRotation(radius);
        NSLog(@"设备朝向:%@",newHeading);

    }];
}

//用户监听区域时调用 进入区域
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    
     NSLog(@"进入区域--%@",region.identifier);
}
//用户监听区域时调用 离开区域
- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    
    NSLog(@"离开区域--%@",region.identifier);
}

/**
 *  请求某个区域的状态是调用
 *
 *  @param manager 位置管理者
 *  @param state   状态
 *  @param region  区域
 */
-(void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    //    CLRegionStateUnknown,   未知状态
    //    CLRegionStateInside, // 在区域内部
    //    CLRegionStateOutside // 区域外面
    if(state == CLRegionStateInside)
    {
        NSLog(@"在区域内部");
    }else if (state == CLRegionStateOutside)
    {
        NSLog(@"在区域外部");
    }else if(state == CLRegionStateUnknown){
        NSLog(@"未知状态");
    }
}

/**
 *  监听区域失败时调用
 *
 *  @param manager 位置管理者
 *  @param region  区域
 *  @param error   错误
 */
-(void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    // 经验: 一般在这里, 做移除最远的区域
    //    [manager stopMonitoringForRegion:最远区域]
}

/* 定位授权状态 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        {
            NSLog(@"当前用户未决定");
        }
            break;
            
            //系统预留字段
        case kCLAuthorizationStatusRestricted:
        {
            NSLog(@"受限制");
        }
            break;
            
        case kCLAuthorizationStatusDenied:
        {
           
            //判断当前设备是否支持定位，定位服务是否开启
            if ([CLLocationManager locationServicesEnabled]) {
                NSLog(@"真正被拒绝");
            }else{
                NSLog(@"定位权限被关闭");
                // 给APP 授权
                //8.0 之前 截图提示用户 ，8.0后，方法调用
//                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                if ([[UIApplication sharedApplication]canOpenURL:url]) {
//                   [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
//                }
                
            }
            
        }
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
        {
            NSLog(@"前后台均有授权");
        }
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            NSLog(@"前台定位授权");
        }
            break;
            
        default:
            break;
    }
    
}

/* 定位失败时调用 */
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    NSLog(@"定位失败==%@",error);
    
}

@end





