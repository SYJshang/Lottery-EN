//
//  SYJNBAPlayDetailVC.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/16.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJNBAPlayDetailVC.h"
#import "SYJPlayerCell.h"
#import "SYJPlayerModel.h"
#import "SYJSeasonDataController.h"

@interface SYJNBAPlayDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *listArr;

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation SYJNBAPlayDetailVC

- (NSMutableArray *)listArr{
    
    if (_listArr == nil) {
        _listArr = [NSMutableArray array];
    }
    
    return _listArr;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"team Detail" font:18.0];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationController.navigationBar.tintColor = TextColor;
    
    
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[SYJPlayerCell class] forCellReuseIdentifier:@"cell"];

    self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelColor = [UIColor whiteColor];
    self.hud.color = [UIColor blackColor];
    self.hud.labelText = NSLocalizedString(@"loading", @"HUD message title");
    [self getHomeNetWorkData];
    
    // Do any additional setup after loading the view.
}

- (void)getHomeNetWorkData{
    
    
    [SYJHttpHelper GET:[NSString stringWithFormat:@"http://api.suredbits.com/nba/v0/players/%@",self.teamID] parameters:nil success:^(id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        self.listArr = [SYJPlayerModel mj_objectArrayWithKeyValuesArray:dict];
        
        [self.hud hideAnimated:YES];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}


#pragma mark - table view dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    SYJPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (indexPath.row == 0) {
        cell.nameLab.text = @"name";
//        cell.teamLab.text = @"team";
//        cell.positionLab.text = @"position";
        cell.statusLab.text = @"status";
        cell.uniformNumberLab.text = @"uniformNumber";
        cell.birthDateLab.text = @"birthDate";
        cell.heightLab.text = @"height";
        cell.weightLab.text = @"weight";
        cell.rookieYearLab.text = @"rookieYear";
//        cell.lastYearLab.text = @"lastYear";

    }else{
        
        if (!NULLArray(self.listArr)) {
            SYJPlayerModel *model = self.listArr[indexPath.row - 1];
            cell.model = model;
        }
    }
    
    
    
    
    return cell;
}



#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row > 0) {
        SYJSeasonDataController *vc = [[SYJSeasonDataController alloc]init];
        SYJPlayerModel *model = self.listArr[indexPath.row - 1];
        vc.playerID = model;
        [self.navigationController pushViewController:vc animated:YES];
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
