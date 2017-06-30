//
//  ITJiLuViewController.m
//  inrtest
//
//  Created by 张涛 on 16/4/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "ITZhiShiViewController.h"
#import "ITJiLuTableViewCell.h"
#import "INRMapViewController.h"

@interface ITZhiShiViewController ()<UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

//@property (nonatomic, strong) BMKPoiSearch *searcher;

//位置管理器
@property (nonatomic, strong)CLLocationManager *manager;

@property (nonatomic, strong) CLLocation *loc;

@property (nonatomic, assign) int index;

@end

@implementation ITZhiShiViewController

- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(CLLocationManager *)manager{
    if (_manager==nil) {
        _manager=[[CLLocationManager alloc]init];
    }
    return _manager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self locationView];
    //    [self createView];
    [self createViews];
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"LotteryShop" font:18];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 20, 20, 20);
    //    [self.chageButton setBackgroundColor:[UIColor redColor]];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    // Do any additional setup after loading the view.
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getFirstData {
    _index = 1;
    //    [self getMoreData];
}

//- (void)getMoreData{
//
//    //初始化检索对象
//    _searcher = [[BMKPoiSearch alloc]init];
//    _searcher.delegate = self;
//    //发期检索
//    BMKNearbySearchOption *option = [[BMKNearbySearchOption alloc]init];
//    option.location = CLLocationCoordinate2DMake(31.234498595186576, 121.44258300000001);
//    option.pageIndex = _index;
//    option.pageCapacity = 10;
//    option.keyword = @"彩票";
//    BOOL flag = [_searcher poiSearchNearBy:option];
//
//    if(flag)
//    {
//        NSLog(@"周边检索发送成功");
//    }
//    else
//    {
//        NSLog(@"周边检索发送失败");
//    }
//
//}

//实现PoiSearchDeleage处理回调结果
//- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPoiResult*)poiResultList errorCode:(BMKSearchErrorCode)error
//{
//    __weak typeof(self) weakSelf = self;
//    [self.tableView.mj_header endRefreshing];
//    [self.tableView.mj_footer endRefreshing];
//
//    if (error == BMK_SEARCH_NO_ERROR) {
//            [weakSelf.dataArr addObjectsFromArray:poiResultList.poiInfoList];
//            [weakSelf.tableView reloadData];
//            weakSelf.index++;
//
//        //在此处理正常结果
//    }
//    else if (error == BMK_SEARCH_AMBIGUOUS_KEYWORD){
//        //当在设置城市未找到结果，但在其他城市找到结果时，回调建议检索城市列表
//        // result.cityList;
//        NSLog(@"起始点有歧义");
//    } else {
//        [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
//    }
//}
//不使用时将delegate设置为 nil
-(void)viewWillDisappear:(BOOL)animated
{
    //    _searcher.delegate = nil;
}

- (void)createViews {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height - 64)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getArr)];
    self.tableView.mj_header = header;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    [header beginRefreshing];
}

- (void)getArr {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.loc.coordinate,100, 100);
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.region = region;
    request.naturalLanguageQuery = @"lottery";
    MKLocalSearch *localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    
    __weak typeof(self) weakSelf = self;
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        [weakSelf.tableView.mj_header endRefreshing];
        if (!error) {
            //do something.
            
            [weakSelf.dataArr addObjectsFromArray:response.mapItems];
            [weakSelf.tableView reloadData];
        }else{
            //do something.
            
            MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(setData)];
            weakSelf.tableView.mj_footer = footer;
            footer.refreshingTitleHidden = YES;
            [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }];
}

#pragma mark 定位
- (void)locationView{
    self.manager.delegate = self;
    self.manager.distanceFilter = 1000;
    //判断用户是否开启定位服务
    if ([CLLocationManager locationServicesEnabled]) {
        
        [self.manager requestAlwaysAuthorization];
        //用户使用时授权
        [self.manager requestWhenInUseAuthorization];
        //开启定位
        [self.manager startUpdatingLocation];
        //每隔多少米定位一次（这里的设置为任何的移动）
        self.manager.distanceFilter = kCLHeadingFilterNone;
        //设置定位精度,这里设置最高精度
        self.manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        
    }else{
        //不能定位用户的位置
        //1.提醒用户检查当前的网络状况
        //2.提醒用户打开定位开关
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *loc = [locations firstObject];
    self.loc = loc;
    
    [manager stopUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if ([error code] == kCLErrorDenied)
    {
        //访问被拒绝
        NSLog(@"访问被拒绝");
    }
    if ([error code] == kCLErrorLocationUnknown) {
        //无法获取位置信息
        NSLog(@"无法获取位置信息");
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MKMapItem *model = _dataArr[indexPath.row];
    INRMapViewController *vc = [[INRMapViewController alloc]init];
    vc.coorDinate = model.placemark.coordinate;
    vc.nameStr = model.name;
    vc.address = [NSString stringWithFormat:@"%@ %@,%@ %@,%@",
                            model.placemark.country,
                            model.placemark.administrativeArea,
                            model.placemark.locality,
                            model.placemark.subLocality,
                            model.placemark.thoroughfare];
    //    vc.longitude = [[dic objectForKey:@"longitude"] floatValue];
    //    vc.latitude = [[dic objectForKey:@"latitude"] floatValue];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(68);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ITJiLuTableViewCell *cell = [ITJiLuTableViewCell cellWithTableView:tableView];
    
    if (_dataArr.count != 0) {
        MKMapItem *item = _dataArr[indexPath.row];
        cell.item = item;
    }else{
        [self setData];
        NSDictionary *dic = _dataArr[indexPath.row];
        cell.dic = dic;
    }
    
    return cell;
}


- (void)setData{
    NSArray *arr =@[
                    @{
                        @"title": @"芙蓉广场世纪店",
                        @"address": @"中国湖南长沙芙蓉广场",
                        @"longitude": @"28.196993592631017",
                        @"latitude": @"112.98484",
                        },
                    @{
                        @"title": @"岳麓区广场实体店",
                        @"address": @"湖南省长沙市岳麓区银盆岭街道奥克斯广场商业国际公寓",
                        @"longitude": @"28.191295405504164",
                        @"latitude": @"112.97546",
                        },
                    @{
                        @"title": @"汉阳广场实体店",
                        @"address": @"武汉市江汉区解放大道686号武汉世界贸易大厦",
                        @"longitude": @"30.581127400757712",
                        @"latitude": @"114.26861000000002"
                        },
                    @{
                        @"title": @"正阳门实体店",
                        @"address": @"北京市东城区东交民巷44号",
                        @"longitude": @"38.6518",
                        @"latitude": @"104.07642"
                        },
                    @{
                        @"title": @"上海路潼实体店",
                        @"address": @"上海浦东新区潼港一村25号",
                        @"longitude": @"31.345585482875023",
                        @"latitude": @"121.57679",
                        },
                    @{
                        @"title": @"革新实体店",
                        @"address": @"广东省广州市珠海区革新路124号",
                        @"longitude": @"23.09666740812355",
                        @"latitude": @"113.25436999999998"
                        },
                    
                    ];
    
    [_dataArr addObjectsFromArray:arr];
}

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
