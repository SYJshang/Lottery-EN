//
//  SYJNBAGameDetailVC.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/15.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJNBAGameDetailVC.h"
#import "SYJPlayerCell.h"
#import "SYJPlayerModel.h"
#import "SYJPlayerDataController.h"

@interface SYJNBAGameDetailVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UILabel *homeLab;
@property (nonatomic, strong) UILabel *awekLab;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArr;

@property (nonatomic, strong)  UISegmentedControl *seg;

@property (nonatomic, strong) MBProgressHUD *hud;



@end

@implementation SYJNBAGameDetailVC

- (NSMutableArray *)listArr{
    
    if (_listArr == nil) {
        _listArr = [NSMutableArray array];
    }
    
    return _listArr;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.seg = [[UISegmentedControl alloc] initWithItems:@[self.model.homeTeam.teamID,self.model.awayTeam.teamID]];
    self.seg.frame = CGRectMake(0, 15, 180, 30);
    [self.view addSubview:self.seg];
    self.navigationItem.titleView = self.seg;
    self.seg.selectedSegmentIndex = 0;
    
    [self.seg addTarget:self action:@selector(segmentValueChange:) forControlEvents:UIControlEventValueChanged];

//    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"Game Detail" font:18.0];
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
    
    
//    self.homeLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KSceenW, 20)];
//    [self.view addSubview:self.homeLab];
//    self.homeLab.textAlignment = NSTextAlignmentCenter;
//    self.homeLab.font = [UIFont systemFontOfSize:14];
//    self.homeLab.backgroundColor = Gray;
//    self.homeLab.textColor = TextColor;
//    self.homeLab.text = self.model.homeTeam.teamID;
//    
//    
//    self.awekLab = [[UILabel alloc]initWithFrame:CGRectMake(0, (KSceenH / 2 - 20), KSceenW, 20)];
//    [self.view addSubview:self.awekLab];
//    self.awekLab.textAlignment = NSTextAlignmentCenter;
//    self.awekLab.font = [UIFont systemFontOfSize:14];
//    self.awekLab.backgroundColor = Gray;
//    self.awekLab.textColor = TextColor;
//    self.awekLab.text = self.model.awayTeam.teamID;
//
    
    self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelColor = [UIColor whiteColor];
    self.hud.color = [UIColor blackColor];
    self.hud.labelText = NSLocalizedString(@"loading", @"HUD message title");
    

    
    [self getHomeNetWorkData:self.model.homeTeam.teamID];
    
    // Do any additional setup after loading the view.
}

- (void)segmentValueChange:(UISegmentedControl  *)segcontol{
    
    if (segcontol.selectedSegmentIndex == 0) {
        [self getHomeNetWorkData:self.model.homeTeam.teamID];
    }else{
        [self getHomeNetWorkData:self.model.awayTeam.teamID];

    }
    
}

- (void)getHomeNetWorkData:(NSString *)teamID{
    
    
    [SYJHttpHelper GET:[NSString stringWithFormat:@"http://api.suredbits.com/nba/v0/players/%@",teamID] parameters:nil success:^(id responseObject) {
        
        [self.listArr removeAllObjects];
        
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
        
        SYJPlayerModel *model = self.listArr[indexPath.row - 1];
        SYJPlayerDataController *vc = [[SYJPlayerDataController alloc]init];
        vc.playerID = model;
        vc.model = self.model;
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
