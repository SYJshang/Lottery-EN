//
//  SYJFirstController.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJFirstController.h"
#import "SYJAllModel.h"
#import "SYJPowerballCell.h"
#import "SYJHotLottoCell.h"
#import "SYJTwoByTwoCell.h"
#import "SYJPickCell.h"
#import "SYJPowerballController.h"
#import "SYJHotDetailController.h"
#import "SYJTwoByController.h"
#import "SYJPickDetailVC.h"

@interface SYJFirstController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArr;

@end

@implementation SYJFirstController

- (NSMutableArray  *)listArr{
    
    if (_listArr == nil) {
        _listArr = [NSMutableArray array];
    }
    
    return _listArr;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor grayColor] title:@"Kansas" font:scaleWithSize(24)];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 108) style:UITableViewStylePlain];
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
    //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


#pragma mark - httpRequst

- (void)getHttpResqust{
    
    [SYJHttpHelper Post:@"http://yourwears.com/lottery/xmltojson.php" parameters:nil success:^(id responseObject) {
       
        NSArray *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        SYJLog(@"%@",data);
        
        self.listArr = [SYJAllModel mj_objectArrayWithKeyValuesArray:data[13][@"game"]];
        SYJLog(@"%@",self.listArr);

        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"Error!"];
        [SVProgressHUD dismiss];
        [self.tableView.mj_header endRefreshing];

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
    
    if (indexPath.row < 5) {
        return 200;

    }else{
        
        return 180;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row < 2) {
        SYJPowerballCell *cell = [SYJPowerballCell cellWithTableView:tableView];
        SYJAllModel *model = self.listArr[indexPath.row];
        cell.model = model;
        return cell;
    }else if (indexPath.row >= 2 && indexPath.row < 5){
        
        SYJHotLottoCell *cell = [SYJHotLottoCell cellWithTableView:tableView];
        SYJAllModel *model = self.listArr[indexPath.row];
        cell.model = model;
        return cell;
    }else if (indexPath.row == 5){
        
        SYJTwoByTwoCell *cell = [SYJTwoByTwoCell cellWithTableView:tableView];
        SYJAllModel *model = self.listArr[indexPath.row];
        cell.model = model;
        return cell;
    }else{
        
        SYJPickCell *cell = [SYJPickCell cellWithTableView:tableView];
        SYJAllModel *model = self.listArr[indexPath.row];
        cell.model = model;
        return cell;
    }
    
//    static NSString *cellIdentifier = @"MTCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    
//    if(cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row];
//    
//    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SYJAllModel *model = self.listArr[indexPath.row];
    
    switch (indexPath.row) {
        case 0:{
            SYJPowerballController *vc = [[SYJPowerballController alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 1:{
            SYJPowerballController *vc = [[SYJPowerballController alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 2:{
            SYJHotDetailController *vc = [[SYJHotDetailController alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 3:{
            SYJHotDetailController *vc = [[SYJHotDetailController alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 4:{
            SYJHotDetailController *vc = [[SYJHotDetailController alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 5:{
            SYJTwoByController *vc = [[SYJTwoByController alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:{
            SYJPickDetailVC *vc = [[SYJPickDetailVC alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:{
            SYJPickDetailVC *vc = [[SYJPickDetailVC alloc]init];
            vc.gameID = model.name.game_id;
            vc.gameName = model.name.game_name;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
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
