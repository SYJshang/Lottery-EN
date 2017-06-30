//
//  INRMapViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/4/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "INRMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

@interface INRMapViewController ()<CLLocationManagerDelegate, MKMapViewDelegate>

//位置管理器
@property (nonatomic, strong)CLLocationManager *manager;
@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation INRMapViewController

-(CLLocationManager *)manager{
    if (_manager==nil) {
        
        _manager=[[CLLocationManager alloc]init];
        
    }
    return _manager;
}

- (MKMapView *)mapView{
    if (_mapView == nil) {
        _mapView = [[MKMapView alloc]init];
    }
    return _mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Location";
    [self createViews];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    _mapView.delegate = self;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    
    _mapView.delegate = nil;
    
}
- (void)createViews {
    
    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeStandard;
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    [_mapView setRegion:MKCoordinateRegionMakeWithDistance(_coorDinate, 1000, 1000) animated:YES];
    [self.view addSubview:_mapView];
    
    MyAnnotation *annotation = [[MyAnnotation alloc] init];
    annotation.title = self.nameStr;
    annotation.subtitle = self.address;
    annotation.coordinate = _coorDinate;
    
    [_mapView addAnnotation:annotation];
    [_mapView setCenterCoordinate:annotation.coordinate animated:YES];
    [_mapView selectAnnotation:annotation animated:YES];
    
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation

{
    
    static NSString *ID = @"anno";
    
    MKPinAnnotationView *annoView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    
    if (annoView == nil) {
        
        annoView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ID];
        
        // 显示气泡
        
        annoView.canShowCallout = YES;
        
        // 设置绿色
        
        annoView.pinColor = MKPinAnnotationColorGreen;
        
    }
    
    return annoView;
    
}

//#pragma mark mapView Delegate 地图 添加标注时 回调
//- (MKAnnotationView *) mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>) annotation {
//    // 获得地图标注对象
//    MKPinAnnotationView * annotationView = (MKPinAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:@"PIN_ANNOTATION"];
//    if (annotationView == nil) {
//        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"PIN_ANNOTATION"];
//    }
//    // 设置大头针标注视图为紫色
//    annotationView.pinColor = MKPinAnnotationColorPurple ;
//    // 标注地图时 是否以动画的效果形式显示在地图上
//    annotationView.animatesDrop = YES ;
//    // 用于标注点上的一些附加信息
//    annotationView.canShowCallout = YES ;
//    
//    return annotationView;
//    
//}
//

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
//    CLLocationCoordinate2D loc = [userLocation coordinate];
    //放大地图到自身的经纬度位置。
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_coorDinate, 250, 250);
//    [self.mapView setRegion:region animated:YES];
}


- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated{
    
}

//#pragma mark 定位
//- (void)locationView{
//    self.manager.delegate = self;
//    self.manager.distanceFilter = 1000;
//    //判断用户是否开启定位服务
//    if ([CLLocationManager locationServicesEnabled]) {
//        
//        [self.manager requestAlwaysAuthorization];
//        //用户使用时授权
//        [self.manager requestWhenInUseAuthorization];
//        //开启定位
//        [self.manager startUpdatingLocation];
//        //每隔多少米定位一次（这里的设置为任何的移动）
//        self.manager.distanceFilter = kCLHeadingFilterNone;
//        //设置定位精度,这里设置最高精度
//        self.manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
//        
//    }else{
//        //不能定位用户的位置
//        //1.提醒用户检查当前的网络状况
//        //2.提醒用户打开定位开关
//    }
//    
//}
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//    CLLocation *loc = [locations firstObject];
//    NSString *longitude = [NSString stringWithFormat:@"%f", loc.coordinate.longitude];
//    NSString *latitude = [NSString stringWithFormat:@"%f", loc.coordinate.latitude];
////    self.longitude = longitude;
////    self.latitude = latitude;
//    [manager stopUpdatingLocation];
//    
//}
//
//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
//    if ([error code] == kCLErrorDenied)
//    {
//        //访问被拒绝
//        NSLog(@"访问被拒绝");
//    }
//    if ([error code] == kCLErrorLocationUnknown) {
//        //无法获取位置信息
//        NSLog(@"无法获取位置信息");
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
