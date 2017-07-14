//
//  WTWeatherDetailViewController.m
//  inrtest
//
//  Created by zt on 2017/5/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "WTWeatherDetailViewController.h"
#import "WTWeatherHeaderView.h"
#import "WTMainModel.h"
#import "WTWeatherModel.h"
#import "WTWeahterDetailTableViewCell.h"
#import "WTTempModel.h"

@interface WTWeatherDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *weatheModel;

@end

@implementation WTWeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
//    self
    [self getInfos];
    // Do any additional setup after loading the view.
}

- (NSMutableArray *)weatheModel{
    if (!_weatheModel) {
        _weatheModel = [NSMutableArray array];
    }
    return _weatheModel;
}

- (void)createViews {
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
//    imageView.image = [UIImage imageNamed:@"img_9"];
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    [self.view addSubview:imageView];
//    
//    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
//    toolbar.barStyle = UIBarStyleDefault;
//    [imageView addSubview:toolbar];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 24, screen_width, screen_height - 64)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    WTWeatherHeaderView *headerView = [[WTWeatherHeaderView alloc]initWithFrame:CGRectMake(0, 0, screen_width, scaleWithSize(336))];
    headerView.dic = _dic;
    tableView.tableHeaderView = headerView;
    
    
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, screen_height - 40, screen_width,40)];
    
    [self.view addSubview:bottomView];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, bottomView.frame.size.width, bottomView.frame.size.height)];
    toolbar.barStyle = UIBarStyleDefault;
    [bottomView addSubview:toolbar];
    
    UIButton *jiantouBtn = [[UIButton alloc]init];
    jiantouBtn.frame = CGRectMake((screen_width - 40) / 2, 4, 32, 32);
    [jiantouBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [jiantouBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:jiantouBtn];
    
}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
//    [UIView animateWithDuration:0.2 animations:^{
//        self.view.frame = CGRectMake(0, screen_height, screen_width, screen_height);
//    }];
}

- (void)getInfos{
    NSString *urlStr = @"http://api.openweathermap.org/data/2.5/forecast/daily";
    NSDictionary *parame = @{
                             @"id": _ID,
                             @"cnt": @(6),
                             @"appid": @"af53e50a495e04fa75e3d1e6d6e00fb3"
                             };
//    __weak typeof(self) weakSelf = self;
    [[CPNetWorkRequest sharedClient]get:urlStr parame:parame success:^(id object) {
        NSArray *arr = object[@"list"];
        NSMutableArray *arr1 = [NSMutableArray array];
        NSDate *date = [NSDate new];
        NSString *week = [self weekdayStringFromDate:date];
        NSArray *weekdays = [NSArray arrayWithObjects: @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", nil];
        NSInteger weekIndex  = [weekdays indexOfObject:week];
        for (int i = 0; i < arr.count; i++) {
            WTTempModel *model = [WTTempModel mj_objectWithKeyValues:arr[i][@"temp"]];
            WTWeatherModel *WModel = [WTWeatherModel mj_objectWithKeyValues:arr[i][@"weather"][0]];
            
            NSDictionary *dict;
//            NSDictionary *dict = @{
//                                   @"temp": model,
//                                   @"weather": WModel,
////                                   @"time": arr[i][@"dt_txt"]
//                                   };
            if (i == 0) {
                dict = @{
                           @"temp": model,
                           @"weather": WModel,
                           @"weekday": week
                           };
                weekIndex = weekIndex +1;
            }else{
                if (weekIndex == 7) {
                    weekIndex = 0;
                    dict = @{
                               @"temp": model,
                               @"weather": WModel,
                               @"weekday": weekdays[weekIndex]
                               };
                    
                    weekIndex = weekIndex +1;
                }else{
                    dict = @{
                               @"temp": model,
                               @"weather": WModel,
                               @"weekday": weekdays[weekIndex]
                               };
                    weekIndex = weekIndex +1;
                }
            }
            [arr1 addObject:dict];

        }
        
        
        [self.weatheModel addObjectsFromArray:arr1];
        [self.tableView reloadData];
        
    } failure:^(NSError *err) {
        
    }];
}

- (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday - 1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weatheModel.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(50);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WTWeahterDetailTableViewCell *cell = [WTWeahterDetailTableViewCell cellWithTableView:tableView];
    if (self.weatheModel.count != 0) {
        cell.dic = self.weatheModel[indexPath.row];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.userInteractionEnabled = NO;
    return  cell;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

//- (void)

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
