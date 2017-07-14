//
//  ITBaoGaoViewController.m
//  inrtest
//
//  Created by 张涛 on 16/4/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "ITBaoGaoViewController.h"
#import "CPHallHeaderView.h"
#import "ITKaiJiangViewController.h"
#import "ITSelectNumViewController.h"
#import "ITNewsViewController.h"
#import "ITZhongJiangViewController.h"
#import "ITZhiShiViewController.h"
#import "ITTeamInfoViewController.h"
#import "ITInfoViewController.h"
#import "ITBaoGaoViewCell.h"
#import "BaseDetailViewController.h"
#import "ITNewsModel.h"
#import "ITNewsTableViewCell.h"
#import "ITNewsDetailViewController.h"

@interface ITBaoGaoViewController ()<UITableViewDelegate, UITableViewDataSource, CPHallHeaderViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CPHallHeaderView *headerView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ITBaoGaoViewController

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    
    [self createViews];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(click) name:@"segmentView" object:nil];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [self getInfoData];
}

- (void)createViews {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height- scaleWithSize(44))];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = scaleWithSize(140);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    CPHallHeaderView *headerView = [[CPHallHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, screen_height + scaleWithSize(200))];//328
    headerView.delegate = self;
    headerView.imageURLStringsGroup = @[@"banner1", @"banner2", @"banner3"];
    tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
}

-(void)getInfoData{
    __weak typeof(self) weakSelf = self;
    [[CPNetWorkRequest sharedClient]get:@"https://www.h1055.com/interface/getAllNews.htmls?page=list" parame:nil success:^(id object) {
        if (![[object objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
            NSString *errStr = [object objectForKey:@"msg"];
            //           [self showHint:errStr];
            
        }else{
            
            [weakSelf.tableView.mj_header endRefreshing];
            NSArray *arr = [object objectForKey:@"result"];
            NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:arr.count];
            for (int i = 0; i < arr.count; i++) {
                ITNewsModel *model = [ITNewsModel mj_objectWithKeyValues:arr[i]];
                [arr1 addObject:model];
            }
            [weakSelf.datas addObjectsFromArray:arr1];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
            
////            [self.tableview.mj_header endRefreshing];
//            NSArray *arr = [object objectForKey:@"result"];
//            _dataArr = [arr subarrayWithRange:NSMakeRange(0, 3)];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.tableView reloadData];
//            });
        }
        
    } failure:^(NSError *err) {
        
    }];
    
}

#pragma mark 点击button
- (void)didButtonItemClick:(UIButton *)button{
    
    if (button.tag == 0) {
        ITKaiJiangViewController *vc = [[ITKaiJiangViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (button.tag == 1){
        ITTeamInfoViewController *vc = [[ITTeamInfoViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (button.tag == 2){
        ITNewsViewController *vc = [[ITNewsViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (button.tag == 3){
        ITZhiShiViewController *vc = [[ITZhiShiViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (button.tag == 4){
        
    }else{
        
    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"新闻资讯";
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 30;
//}
//
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    ITNewsTableViewCell *cell = [ITNewsTableViewCell cellWithTableView:tableView];
//    cell.model = _datas[indexPath.row];
//    cell.selectionStyle= UITableViewCellSelectionStyleNone;
//    
//    return cell;
//}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    ITNewsDetailViewController *vc = [[ITNewsDetailViewController alloc]init];
//    vc.model = _datas[indexPath.row];
//    [self.navigationController pushViewController:vc animated:YES];
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
