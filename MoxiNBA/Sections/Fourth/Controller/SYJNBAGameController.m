//
//  SYJNBAGameController.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/29.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJNBAGameController.h"
#import "SYJNBAGameCell.h"
#import "SYJGameModel.h"
#import "SYJNBAGameDetailVC.h"

@interface SYJNBAGameController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *postArr;
@property (nonatomic, strong) NSMutableArray *finalArr;

@end

@implementation SYJNBAGameController

- (NSMutableArray *)postArr{
    
    if (_postArr == nil) {
        _postArr = [NSMutableArray array];
    }
    
    return _postArr;
    
}

- (NSMutableArray *)finalArr{
    
    if (_finalArr == nil) {
        _finalArr = [NSMutableArray array];
    }
    
    return _finalArr;
    
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    
    
    self.navigationController.navigationBar.hidden = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 20, 20, 20);
    //    [self.chageButton setBackgroundColor:[UIColor redColor]];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    // 处理耗时操作的代码块...
    //        [self getAllData];
    //通知主线程刷新
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            //回调或者说是通知主线程刷新，
    //        });
    
    //    });
    
    
    NSDictionary *dict = @{@"老鹰": @"ATL",
                           @"凯尔特人"  :@"BOS",
                           @"篮网"  : @"BKN",
                           @"公牛"  : @"CHI",
                           @"骑士"  : @"CLE",
                           @"小牛"  : @"DAL",
                           @"掘金"  : @"DEN",
                           @"活塞"  : @"DET",
                           @"勇士"  : @"GSW",
                           @"火箭" : @"HOU",
                           @"步行者" : @"IND",
                           @"快船" : @"LAC",
                           @"湖人" : @"LAL",
                           @"热火" : @"MIA",
                           @"雄鹿" : @"MIL",
                           @"森林狼" : @"MIN",
                           @"尼克斯" : @"NYK",
                           @"76人" : @"PHI",
                           @"太阳" : @"PHX",
                           @"猛龙" : @"TOR",
                           @"爵士" : @"UTA",
                           @"国王" : @"SAC",
                           @"马刺" : @"SAS",
                           @"奇才" : @"WAS",
                           @"开拓者" : @"POR",
                           @"雷霆" : @"OKC",
                           @"鹈鹕" : @"NOP",
                           @"魔术" : @"ORL",
                           @"黄蜂" : @"CHA",
                           @"灰熊" : @"MEM"};
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dict forKey:@"NBALogo"];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"NBA Season 2016-2107" font:18.0];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];

    
    [self.tableView registerClass:[SYJNBAGameCell class] forCellReuseIdentifier:@"cell2"];

    [self getHttpData];
    [self getPosData];
    
    [SVProgressHUD showWithStatus:@"loading..."];
    
    // Do any additional setup after loading the view.
}

//获取赛程信息
- (void)getHttpData{
    
    [SYJHttpHelper GET:[NSString stringWithFormat:@"%@/2017/6",URL] parameters:nil success:^(id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        SYJLog(@"%@",dict);
        
        self.finalArr = [SYJGameModel mj_objectArrayWithKeyValuesArray:dict];
        
        [self.finalArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            SYJGameModel *model = (SYJGameModel *)obj;
            if (model.homeTeam.finalScore == 0) {
                [self.finalArr removeObject:model];
            }
            
        }];
        
        SYJLog(@"%lu",(unsigned long)self.finalArr.count);
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

//获取赛程信息
- (void)getPosData{
    
    [SYJHttpHelper GET:[NSString stringWithFormat:@"%@/post/2016",URL] parameters:nil success:^(id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        SYJLog(@"%@",dict);
        
        self.postArr = [SYJGameModel mj_objectArrayWithKeyValuesArray:dict];
        
        [self.postArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            SYJGameModel *model = (SYJGameModel *)obj;
            if (model.homeTeam.finalScore == 0 && model.awayTeam.finalScore == 0) {
                [self.postArr removeObject:model];
            }
            
        }];
        
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - table view dataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return @"Final Game";
    }else if (section == 1){
        
        return @"Postseason Game";
    }else{
        
        return @"All Game";
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0;
    }else{
        return 30.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        
        return 70.0;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if  (section == 0){
        
        if (self.finalArr.count > 0) {
            return self.finalArr.count;
        }else{
            return 0;
        }
    }else if (section == 1){
        
        if (self.finalArr.count > 0) {
            return self.postArr.count;
        }else{
            return 0;
        }
        
    }else{
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
        SYJNBAGameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (indexPath.section == 0) {
            
            if (!NULLArray(self.finalArr)) {
                SYJGameModel *model = self.finalArr[indexPath.row];
                cell.model = model;
            }
            
            
            
        }else if (indexPath.section == 1){
            
            if (!NULLArray(self.postArr)) {
                SYJGameModel *model = self.postArr[indexPath.row];
                cell.model = model;
            }
            
        }
        return cell;
    
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SYJNBAGameDetailVC *vc = [[SYJNBAGameDetailVC alloc]init];
        SYJGameModel *model = self.finalArr[indexPath.row];
        vc.model = model;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1){
        
        SYJNBAGameDetailVC *vc = [[SYJNBAGameDetailVC alloc]init];
        SYJGameModel *model = self.postArr[indexPath.row];
        vc.model = model;
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
