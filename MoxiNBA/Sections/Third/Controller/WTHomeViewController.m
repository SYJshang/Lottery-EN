//
//  WTHomeViewController.m
//  inrtest
//
//  Created by zt on 2017/5/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "WTHomeViewController.h"
#import "WTHomeTableViewCell.h"
#import "WTSearchCityViewController.h"
#import "WTMainModel.h"
#import "WTWeatherModel.h"
#import "WTWeatherDetailViewController.h"
#import "AppDelegate.h"

@class AppDelegate;
@interface WTHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *nameArr;
@property (nonatomic, strong) NSMutableArray *weatheModel;

@end

@implementation WTHomeViewController

- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (NSMutableArray *)weatheModel{
    if (!_weatheModel) {
        _weatheModel = [NSMutableArray array];
    }
    return _weatheModel;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = YES;

    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"天气" font:17.0];

    [self getDatas];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];

    // Do any additional setup after loading the view.
}

- (void)createViews{
    
//    NSUserDefaults *userDatas = [NSUserDefaults standardUserDefaults];
//    NSMutableArray *arr = [NSMutableArray array];
//    [userDatas setObject:arr forKey:@"weather"];
//    [userDatas synchronize];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)getDatas {
//    __weak typeof(self)  weakSelf = self;
    [self.datas removeAllObjects];
    [self.weatheModel removeAllObjects];
    NSUserDefaults *userDatas = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [userDatas objectForKey:@"weather"];
    self.nameArr = arr;
//    for (NSDictionary *dic in arr){
//        
//        
//    }
    
    for (int i = 0; i < arr.count; i++) {
        NSDictionary *dic = arr[i];
        NSString *urlStr = @"http://api.openweathermap.org/data/2.5/weather";
        NSDictionary *parame = @{
                                 @"id": dic[@"id"],
                                 @"appid": @"af53e50a495e04fa75e3d1e6d6e00fb3"
                                 };
        __weak typeof(self) weakSelf = self;
        [[CPNetWorkRequest sharedClient]get:urlStr parame:parame success:^(id object) {
            
            WTMainModel *model = [WTMainModel mj_objectWithKeyValues:object[@"main"]];
            NSDictionary *dic = object[@"weather"][0];
            WTWeatherModel *WModel = [WTWeatherModel mj_objectWithKeyValues: dic];
            
            NSDictionary *dict = @{
                                   @"main": model,
                                   @"weather": WModel,
                                   @"city": object[@"name"]
                                   };
            
            [weakSelf.datas addObject:model];
            [weakSelf.weatheModel addObject:dict];
            [weakSelf.tableView reloadData];
        } failure:^(NSError *err) {
            
        }];
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    // 删除模型
    [self.datas removeObjectAtIndex:indexPath.row];
    
    // 刷新
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Delete";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(50);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row != self.datas.count) {
        
//        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        WTWeatherDetailViewController *vc = [[WTWeatherDetailViewController alloc]init];
        vc.ID = self.nameArr[indexPath.row][@"id"];
        vc.dic = self.weatheModel[indexPath.row];
//        [self.navigationController pushViewController:vc animated:YES];
        vc.view.frame = CGRectMake(0, screen_height, screen_width, screen_height);
        [self.navigationController pushViewController:vc animated:YES];
//        [UIView animateWithDuration:0.2 animations:^{
//            vc.view.frame = CGRectMake(0, 0, screen_width, screen_height);
//            [self.view addSubview:vc.view];
//        }];

        
    }else{
        
        WTSearchCityViewController *vc = [[WTSearchCityViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row != self.datas.count) {
        WTHomeTableViewCell *cell = [[WTHomeTableViewCell alloc]init];
        if (!NULLArray(self.nameArr)) {
            cell.name = self.nameArr[indexPath.row][@"name"];
        }
        if (self.datas.count != 0) {
            cell.model= self.datas[indexPath.row];
        }
        
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        
        UILabel *lab = [[UILabel alloc]init];
        lab.text = @"°F";
        lab.font = fontSize(scaleWithSize(20));
        lab.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(25));
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
        }];
        
        UIImageView *addImg = [[UIImageView alloc]init];
        addImg.image = [UIImage imageNamed:@"weatherAdd"];
        addImg.contentMode = UIViewContentModeScaleToFill;
        [cell.contentView addSubview:addImg];
        
        [addImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(scaleWithSize(-30));
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
        
        cell.backgroundColor = Color(1, 1, 1, 0.4);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    
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
