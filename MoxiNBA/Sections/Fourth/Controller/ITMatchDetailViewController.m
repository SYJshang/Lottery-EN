//
//  ITMatchDetailViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITMatchDetailViewController.h"
#import "ITFootBallModel.h"
#import "ITBasketBallModel.h"
#import "ITMatchDetailTableViewCell.h"

@interface ITMatchDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ITMatchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"FootBall" font:18];
    
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


- (void)viewWillAppear:(BOOL)animated{
    [self getInfo];
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)createViews {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = scaleWithSize(120);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

- (void)getInfo {
    [_dataArr removeAllObjects];
    NSString *url = @"";
    if (_type == 0) {
        url = @"http://api.caipiao.163.com/jjc_live.html?gameEn=jczq&product=caipiao_client&mobileType=iphone&ver=4.32&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=C70F3605-A233-4EDE-B6BA-DE00386793BD";
    }else{
        url = @"http://api.caipiao.163.com/live_jclq.html?product=caipiao_client&mobileType=iphone&ver=4.32&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=C70F3605-A233-4EDE-B6BA-DE00386793BD";
    }
    
    __weak typeof(self) weakSelf = self;
    [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
        NSArray *arr = object[@"data"][0][@"matchInfo"];
        NSMutableArray *arr1 = [NSMutableArray arrayWithCapacity:arr.count];
        for (int i = 0; i < arr.count; i++) {
            if (_type == 0) {
                ITFootBallModel *model = [ITFootBallModel mj_objectWithKeyValues:arr[i]];
                [arr1 addObject:model];
            }else{
                ITBasketBallModel *model = [ITBasketBallModel mj_objectWithKeyValues:arr[i]];
                [arr1 addObject:model];
            }
        }
        [weakSelf.dataArr addObjectsFromArray:arr1];
        [weakSelf.tableView reloadData];
    } failure:^(NSError *err) {
        
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ITMatchDetailTableViewCell *cell = [ITMatchDetailTableViewCell cellWithTableView:tableView];
    if (_type == 0) {
        cell.model = _dataArr[indexPath.row];
    }else{
        cell.basketModel = _dataArr[indexPath.row];
    }
    return cell;
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
