//
//  ITSheDingViewController.m
//  inrtest
//
//  Created by 张涛 on 16/4/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "ITSheDingViewController.h"
#import "CPChangeUserInfoViewController.h"
#import "ForgetViewController.h"
#import "CPInfoHeaderView.h"
#import "LoginViewController.h"
#import "CPCollectViewController.h"
#import "XCHelpTabController.h"
#import "AppDelegate.h"
#import "CPUserInfoModel.h"

@class AppDelegate;
@interface ITSheDingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)  UIImageView *MainimageView;
@property (strong, nonatomic)  UILabel *LabelName;
@property (strong, nonatomic)  UIButton *LoginBtn;

@property (strong, nonatomic) UITableView *tableview;
@property (nonatomic, strong) CPInfoHeaderView *headerView;
@property(nonatomic,strong)UIView *footView;
@property (nonatomic, strong) CPUserInfoModel *model;

@end



@implementation ITSheDingViewController
@synthesize tableview;
@synthesize footView;

- (void)createViews {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview = tableView;
    
    CPInfoHeaderView *headerView = [[CPInfoHeaderView alloc]initWithHeader:CGRectMake(0, 0, SCREEN_SIZE.width, scaleWithSize(100))];
//    headerView.userName = [[gobalConfig getInstance] userName];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeInfo)];
    [headerView addGestureRecognizer:tap];
    //    tableView.contentInset = UIEdgeInsetsMake(0, 0, scaleWithSize(44), 0);
    tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
    footView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, scaleWithSize(200))];
    UIButton *exitBtn =[[UIButton alloc]initWithFrame:CGRectMake(scaleWithSize(20), scaleWithSize(100), SCREEN_SIZE.width - scaleWithSize(40), scaleWithSize(40))];
    exitBtn.backgroundColor = [UIColor blackColor];
    [exitBtn setTitle:@"Logout" forState:UIControlStateNormal];
    exitBtn.layer.cornerRadius = 5;
    [exitBtn addTarget:self action:@selector(exitBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:exitBtn];
    tableView.tableFooterView =footView;
    [self.view addSubview:tableView];
    
}


- (void)getUserInfo {
    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
    NSString *url = [NSString stringWithFormat: @"https://h1055.com/user/userInfo.htmls?phonenumber=%@", phoneNum];
    [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
        if ([object[@"errorcode"] isEqualToString:@"0"]) {
            CPUserInfoModel *model = [CPUserInfoModel mj_objectWithKeyValues:object[@"result"]];
            self.headerView.model = model;
            self.model = model;
//            self.username = object[@"result"][@"username"];
//            [self.tableView reloadData];
            //            self.
        }
    } failure:^(NSError *err) {
        
    }];
}

- (void)changeInfo {
    CPChangeUserInfoViewController *vc = [[CPChangeUserInfoViewController alloc]init];
    vc.model = self.model;
    [self.navigationController pushViewController:vc animated:YES];
}

- (AppDelegate *)sharedAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark exitBtnAction

-(void)exitBtnAction{
    [[gobalConfig getInstance]setIsLogin:NO];
    [[gobalConfig getInstance]setPhonenumber:@""];
    
    AppDelegate *appDelegate = [self sharedAppDelegate];
    [appDelegate switchToRootVc];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(65);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.backgroundColor = [UIColor clearColor];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [cell.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(scaleWithSize(-16));
        make.centerY.mas_equalTo(cell.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(30), scaleWithSize(30)));
    }];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor blackColor];//Color(200, 199, 204, 1);
    [cell.contentView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cell.textLabel.mas_left);
        make.bottom.mas_equalTo(cell.contentView.mas_bottom);
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(scaleWithSize(-16));
    }];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Change Password";
        imageView.image = [UIImage imageNamed:@"密码修改"];
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"My Favorite";
        imageView.image = [UIImage imageNamed:@"shoucangicon"];
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Help";
        imageView.image = [UIImage imageNamed:@"baomingicon"];
    }
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        ForgetViewController *vc = [[ForgetViewController alloc]init];
        vc.isChangePwd = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if(indexPath.row == 1){
        
        if ([[gobalConfig getInstance]IsLogin]) {
            CPCollectViewController *vc = [[CPCollectViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            LoginViewController *loginView = [[LoginViewController alloc]init];
            [self.navigationController pushViewController:loginView animated:YES];
        }

    }else if (indexPath.row == 2){
        XCHelpTabController *vc = [[XCHelpTabController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Mine";
    [self createViews];
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [self getUserInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
