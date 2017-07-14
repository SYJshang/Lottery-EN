//
//  SYJDetailVC.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJDetailVC.h"
#import "SYJMatchModel.h"
#import "SYJDetailCell.h"


@interface SYJDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SYJDetailVC


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor lightGrayColor] title:@"详情" font:scaleWithSize(24)];
    
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
    
//    [self getHttpResqust];
    
    // Do any additional setup after loading the view.
}

-(void)leftBtn{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - httpRequst

- (void)getHttpResqust{
    
    [SYJHttpHelper Post:[NSString stringWithFormat:@"http://yourwears.com/lottery/payouts.php?gameId=%@&date=%@",self.gameID,self.time] parameters:nil success:^(id responseObject) {
        
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        [SVProgressHUD dismiss];
        
        SYJLog(@"%@",str);
        if (data == nil) {
            NSRange range = [str rangeOfString:@"null"];
            NSString *subStr = [str substringToIndex:range.location];
            SYJLog(@"%@",subStr);
//            self.listArr = [SYJMatchModel mj_object];
            
            if (!NULLString(subStr)) {
                NSData *JSONData = [subStr dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
                self.listArr = [SYJMatchModel mj_objectArrayWithKeyValuesArray:responseJSON];
            }else{
                
                [SVProgressHUD showSuccessWithStatus:@"NO MORE DATA"];
            }
            
            

        }else{
            self.listArr = [SYJMatchModel mj_objectArrayWithKeyValuesArray:data];
        }
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"Error!"];
//        [SVProgressHUD dismiss];

    }];
    
}

#pragma mark - table view dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = TextColor;
    view.frame = CGRectMake(0, 0, KSceenW, 40);
    
    UILabel *name = [[UILabel alloc]init];
    [view addSubview:name];
    name.font = [UIFont fontWithName:@"Georgia-Italic" size:12];
    name.textColor = [UIColor whiteColor];
    name.text = @"Match";
    name.textAlignment = NSTextAlignmentCenter;
    name.frame = CGRectMake(0, 0, (KSceenW / 3), 40);
    
    UILabel *name2 = [[UILabel alloc]init];
    [view addSubview:name2];
    name2.text = @"Prize";
    name2.font = [UIFont fontWithName:@"Georgia-Italic" size:12];
    name2.textColor = [UIColor whiteColor];
    name2.textAlignment = NSTextAlignmentCenter;
    name2.frame = CGRectMake((KSceenW / 3), 0, (KSceenW / 3), 40);

    
    UILabel *name3 = [[UILabel alloc]init];
    [view addSubview:name3];
    name3.text = self.name;
    name3.font = [UIFont fontWithName:@"Georgia-Italic" size:12];
    name3.textColor = [UIColor whiteColor];
    name3.textAlignment = NSTextAlignmentCenter;
    name3.frame = CGRectMake(2 * (KSceenW / 3), 0, (KSceenW / 3), 40);

    return view;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SYJDetailCell *cell = [SYJDetailCell cellWithTableView:tableView];
    SYJMatchModel *model = self.listArr[indexPath.row];
    cell.model = model;
    
    return cell;
    
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
