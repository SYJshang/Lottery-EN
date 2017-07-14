//
//  SYJPickDetailVC.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/28.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJPickDetailVC.h"
#import "SYJDetailPowerModel.h"
#import "SYJPickMiddleCell.h"
#import "SYJMatchModel.h"
#import "SYJDetailVC.h"


@interface SYJPickDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArr;

@end

@implementation SYJPickDetailVC

- (NSMutableArray  *)listArr{
    
    if (_listArr == nil) {
        _listArr = [NSMutableArray array];
    }
    
    return _listArr;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor lightGrayColor] title:self.gameName font:scaleWithSize(24)];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];

    [SVProgressHUD showWithStatus:@"loading..."];
    //添加刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getHttpResqust];
    }];
    
    
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    // Do any additional setup after loading the view.
}

-(void)leftBtn{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - httpRequst

- (void)getHttpResqust{
    
    [SYJHttpHelper Post:[NSString stringWithFormat:@"http://yourwears.com/lottery/gamepage.php?gameId=%@",self.gameID] parameters:nil success:^(id responseObject) {
        
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        //        SYJLog(@"%@",data);
        
        self.listArr = [SYJDetailPowerModel mj_objectArrayWithKeyValuesArray:data];
        SYJLog(@"%@",self.listArr);
        SYJMatchModel *model = [self.listArr.firstObject payouts].firstObject;
        SYJLog(@"%@",model.match);
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"Error!"];
        [SVProgressHUD dismiss];

    }];
    
}


#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 130;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SYJPickMiddleCell *cell = [SYJPickMiddleCell cellWithTableView:tableView];
    SYJDetailPowerModel *model = self.listArr[indexPath.row];
    cell.model = model;
    
    return cell;
    
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SYJDetailPowerModel *model = self.listArr[indexPath.row];
    SYJDetailVC *vc = [[SYJDetailVC alloc]init];
    vc.gameID = self.gameID;
    vc.time = model.date;
    vc.name = @"Odds";
    [self.navigationController pushViewController:vc animated:YES];
    
    //    kTipAlert(@"<%ld> selected...", indexPath.row);
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
