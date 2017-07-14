//
//  ITInfoViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITInfoViewController.h"
#import "ITInfoTableViewCell.h"
#import "ITTeamInfoModel.h"

@interface ITInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ITInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creaViews];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [self getTeamInfo];
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)creaViews {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height-100)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"积分";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(scaleWithSize(16), 0, screen_width - scaleWithSize(32), 40)];
    headerView.backgroundColor = Color(213, 213, 213, 1);
    
    UILabel *rankLab = [[UILabel alloc]init];
    rankLab.textAlignment = NSTextAlignmentCenter;
    rankLab.font = fontSize(scaleWithSize(16));
    rankLab.text = @"rank";
    [headerView addSubview:rankLab];
    
    UILabel *namelab = [[UILabel alloc]init];
    namelab.textAlignment = NSTextAlignmentCenter;
    namelab.font = fontSize(scaleWithSize(16));
    namelab.text = @"team";
    [headerView addSubview:namelab];
    
    UILabel *matchesPlayedLab = [[UILabel alloc]init];
    matchesPlayedLab.textAlignment = NSTextAlignmentCenter;
    matchesPlayedLab.font = fontSize(scaleWithSize(16));
    matchesPlayedLab.text = @"Have Match";
    [headerView addSubview:matchesPlayedLab];
    
    UILabel *winsLab = [[UILabel alloc]init];
    winsLab.textAlignment = NSTextAlignmentCenter;
    winsLab.font = fontSize(scaleWithSize(16));
    winsLab.text = @"Win";
    [headerView addSubview:winsLab];
    
    UILabel *drawsLab = [[UILabel alloc]init];
    drawsLab.textAlignment = NSTextAlignmentCenter;
    drawsLab.font = fontSize(scaleWithSize(16));
    drawsLab.text = @"Draw";
    [headerView addSubview:drawsLab];
    
    UILabel *lossesLab = [[UILabel alloc]init];
    lossesLab.textAlignment = NSTextAlignmentCenter;
    lossesLab.font = fontSize(scaleWithSize(16));
    lossesLab.text = @"Lose";
    [headerView addSubview:lossesLab];
    
    UILabel *points = [[UILabel alloc]init];
    points.textAlignment = NSTextAlignmentCenter;
    points.font = fontSize(scaleWithSize(16));
    points.text = @"Integration";
    [headerView addSubview:points];
    
    [rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.centerY.equalTo(headerView.mas_centerY);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [namelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(rankLab.mas_right);
        make.top.equalTo(rankLab.mas_top);
        make.width.mas_equalTo(scaleWithSize(100));
    }];
    
    [matchesPlayedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(namelab.mas_right);
        make.top.equalTo(rankLab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [winsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(matchesPlayedLab.mas_right);
        make.top.equalTo(rankLab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [drawsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(winsLab.mas_right);
        make.top.equalTo(rankLab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [lossesLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(drawsLab.mas_right);
        make.top.equalTo(rankLab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [points mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lossesLab.mas_right);
        make.top.equalTo(rankLab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(60);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ITInfoTableViewCell *cell = [ITInfoTableViewCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
    return cell;
}

- (void)getTeamInfo {
    NSString *url = @"";
    switch (_row) {
        case 0:
            url = @"http://zx.caipiao.163.com/libraryapi/league_matchRank.html?leagueId=7&product=caipiao_client&mobileType=iphone&ver=4.32&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=C70F3605-A233-4EDE-B6BA-DE00386793BD";
            break;
        case 1:
            url = @"http://zx.caipiao.163.com/libraryapi/league_matchRank.html?leagueId=9&product=caipiao_client&mobileType=iphone&ver=4.32&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=C70F3605-A233-4EDE-B6BA-DE00386793BD";
            break;
        case 2:
            url = @"http://zx.caipiao.163.com/libraryapi/league_matchRank.html?leagueId=8&product=caipiao_client&mobileType=iphone&ver=4.32&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=C70F3605-A233-4EDE-B6BA-DE00386793BD";
            break;
        default:
            break;
    }
    
    __weak typeof(self)  weakSelf = self;
    [[CPNetWorkRequest sharedClient] get:url parame:nil success:^(id object) {
        NSArray *arr1 = object[@"standings"][0][@"teamInfo"];
        NSMutableArray *arr2 = [NSMutableArray arrayWithCapacity:arr1.count];
        for (int i = 0; i < arr1.count; i++) {
            ITTeamInfoModel *model = [ITTeamInfoModel mj_objectWithKeyValues:arr1[i]];
            [arr2 addObject:model];
        }
        [weakSelf.dataArr addObjectsFromArray:arr2];
        [weakSelf.tableView reloadData];
    } failure:^(NSError *err) {
        
    }];
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
