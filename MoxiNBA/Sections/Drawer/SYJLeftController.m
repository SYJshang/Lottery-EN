//
//  SYJLeftController.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJLeftController.h"
#import "SYJHeaderCell.h"
#import "SYJTitleCell.h"
#import "SYJPowerballController.h"
#import "SYJHotDetailController.h"
#import "SYJTwoByController.h"
#import "SYJPickDetailVC.h"
#import "SYJNavitionController.h"
#import "SYJTabBarController.h"
#import "CPChangeUserInfoViewController.h"
#import "CPUserInfoModel.h"
#import "ForgetViewController.h"
#import "SYJSettingController.h"
#import "SYJFavoriteController.h"



@interface SYJLeftController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *arrTitle;
    NSArray *img;
    NSArray *nameArr;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CPUserInfoModel *model;

@end

@implementation SYJLeftController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];

    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self getUserInfo];

}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = Gray;
    [self.view addSubview:self.tableView];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    arrTitle = @[@"Powerball",@"MEGA Millions",@"Hot Lotto",@"Super Cash",@"2 by 2",@"Pick 3 Midday",@"Pick 3 Evening"];
    nameArr = @[@"UserInfo",@"ChangePassword",@"Collection",@"Setting"];
    img = @[@"信息",@"密码",@"收藏",@"设置"];
    
    
    // Do any additional setup after loading the view.
}

- (void)getUserInfo {
    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
    NSString *url = [NSString stringWithFormat: @"https://h1055.com/user/userInfo.htmls?phonenumber=%@", phoneNum];
    [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
        if ([object[@"errorcode"] isEqualToString:@"0"]) {
            CPUserInfoModel *model = [CPUserInfoModel mj_objectWithKeyValues:object[@"result"]];
            self.model = model;
            //            self.username = object[@"result"][@"username"];
            //            [self.tableView reloadData];
            //            self.
            [self.tableView reloadData];
        }
    } failure:^(NSError *err) {
        
    }];
}


#pragma mark - table view dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        return 30;
    }
    
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 80;
    }else{
        
        return 50;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 8;
    }
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            SYJHeaderCell *cell = [SYJHeaderCell cellWithTableView:tableView];
            cell.userName.text = self.model.username;
            [cell.iconImg sd_setImageWithURL:[NSURL URLWithString:self.model.imgpath] placeholderImage:[UIImage imageNamed:@"头像"]];
            return cell;
        }else{
            
            SYJTitleCell *cell = [SYJTitleCell cellWithTableView:tableView];
            
            cell.icon.image = [UIImage imageNamed:@"美元"];
            cell.nameLab.text = arrTitle[indexPath.row - 1];
//            cell.userName.text = @"UserName";
            return cell;
        }
        
        
    }else{
        
        SYJTitleCell *cell = [SYJTitleCell cellWithTableView:tableView];
        
        cell.icon.image = [UIImage imageNamed:img[indexPath.row]];
        cell.nameLab.text = nameArr[indexPath.row];
        //            cell.userName.text = @"UserName";
        return cell;

        
    }
    
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //拿到我们的LitterLCenterViewController，让它去push
    SYJTabBarController *tab  = (SYJTabBarController*)self.mm_drawerController.centerViewController;
    SYJNavitionController *nav = tab.viewControllers[0];
    
//    SYJPowerballController *vc = [[SYJPowerballController alloc]init];
//    vc.gameID = @"113";
//    vc.gameName = @"Mega Millions";
//    [vcs pushViewController:vc animated:YES];

    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
        case 0:{
        CPChangeUserInfoViewController *vc = [[CPChangeUserInfoViewController alloc]init];
//            vc.gameID = @"101";
//            vc.gameName = @"PowerBall";
        [nav pushViewController:vc animated:NO];

        }
        break;
        case 1:{
            SYJPowerballController *vc = [[SYJPowerballController alloc]init];
            vc.gameID = @"101";
            vc.gameName = @"PowerBall";
            [nav pushViewController:vc animated:NO];
        }
            
            break;
        case 2:{
            SYJPowerballController *vc = [[SYJPowerballController alloc]init];
            vc.gameID = @"113";
            vc.gameName = @"Mega Millions";
            [nav pushViewController:vc animated:YES];
        }
            
            break;
        case 3:{
            SYJHotDetailController *vc = [[SYJHotDetailController alloc]init];
            vc.gameID = @"112";
            vc.gameName = @"Hot Lotto";
            [nav pushViewController:vc animated:YES];
        }
            
            break;
        case 4:{
            SYJHotDetailController *vc = [[SYJHotDetailController alloc]init];
            vc.gameID = @"KS3";
            vc.gameName = @"Super Cash";
            [nav pushViewController:vc animated:YES];
        }
            
            break;
        case 5:{
            SYJTwoByController *vc = [[SYJTwoByController alloc]init];
            vc.gameID = @"114";
            vc.gameName = @"2 By 2";
            [nav pushViewController:vc animated:YES];
        }
            
            break;
        case 6:{
            SYJPickDetailVC *vc = [[SYJPickDetailVC alloc]init];
            vc.gameID = @"KSB";
            vc.gameName = @"Pick 3 Midday";
            [nav pushViewController:vc animated:YES];
        }
            break;
        case 7:{
            SYJPickDetailVC *vc = [[SYJPickDetailVC alloc]init];
            vc.gameID = @"KSA";
            vc.gameName = @"Pick 3 Eveing";
            [nav pushViewController:vc animated:YES];
        }
            break;
              default:
            break;
    }
    }else{
        
        
        switch (indexPath.row) {
            case 0:{
                
                CPChangeUserInfoViewController *vc = [[CPChangeUserInfoViewController alloc]init];
                //            vc.gameID = @"101";
                //            vc.gameName = @"PowerBall";
                [nav pushViewController:vc animated:NO];
            }
                break;
                
            case 1:{
                ForgetViewController *vc = [[ForgetViewController alloc]init];
                [nav pushViewController:vc animated:YES];

            }
                
                break;
                
            case 2:{
                SYJFavoriteController *vc = [[SYJFavoriteController alloc]init];
                [nav pushViewController:vc animated:YES];
            }
                
                break;
            case 3:{
                SYJSettingController *vc = [[SYJSettingController alloc]init];
                [nav pushViewController:vc animated:YES];
            }
                
                break;
                
            default:
                break;
        }
        
    }
    
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
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
