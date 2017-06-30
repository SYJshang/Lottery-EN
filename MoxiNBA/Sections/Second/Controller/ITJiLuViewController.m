//
//  ITJiLuViewController.m
//  inrtest
//
//  Created by 张涛 on 16/4/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "ITJiLuViewController.h"
#import "Config.h"
#import "CPArenaTableViewCell.h"
#import "releaseViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "math.h"

#import "LoginViewController.h"
#import "ITTieziDetailViewController.h"

#define self_Width CGRectGetWidth([UIScreen mainScreen].bounds)
#define self_Height CGRectGetHeight([UIScreen mainScreen].bounds)


@interface ITJiLuViewController ()<UITableViewDataSource,UITableViewDelegate>
//@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ITJiLuViewController

-(void)viewWillAppear:(BOOL)animated{
    
    if ([[gobalConfig getInstance] IsLogin] ==NO) {
        
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        _dataArr = [NSMutableArray array];
        [self.tableview reloadData];
    }else{
        [self getData];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRightBtn];
    self.navigationController.navigationBarHidden = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor grayColor] title:@"Forum" font:scaleWithSize(24)];
    
    [self addSubViews];
    [SVProgressHUD showWithStatus:@"loading..."];

    //    [self createRightBtn];
    // Do any additional setup after loading the view.
}
- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(void)getData{
//    dataArr = [NSMutableArray array];
    
    NSString *url = [NSString stringWithFormat:@"https://h1055.com/user/getAllForum.htmls?phonenumber=%@", [[gobalConfig getInstance]phonenumber]];
    [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
        
        if (object[@"errcode"] ==0) {

            _dataArr  = [object objectForKey:@"result"];
            //success
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [SVProgressHUD dismiss];
                [self.tableview reloadData];
                //                [self showHint:[dic objectForKey:@"error"]];
            });
        }else{
            //fail
            dispatch_async(dispatch_get_main_queue(), ^{
                //                [tableview reloadData];
                [SVProgressHUD showErrorWithStatus:@"error"];
            });
        }
    } failure:^(NSError *err) {
        
    }];
//    [[HttpRequestClient sharedClient]getKaijiangNewsWithUrl:url request:^(int resultCode, NSString *resultMsg, NSArray *dataList, NSError *error) {
//        NSLog(@"%@",dataList);
//        NSDictionary *dic = (NSDictionary *)dataList;
//        if (resultCode ==0) {
//            
//            _dataArr  = [dic objectForKey:@"result"];
//            //success
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [tableview reloadData];
//                //                [self showHint:[dic objectForKey:@"error"]];
//            });
//        }else{
//            //fail
//            dispatch_async(dispatch_get_main_queue(), ^{
//                //                [tableview reloadData];
//                [SVProgressHUD showWithStatus:@"error"];
//            });
//            
//            
//        }
//    }];
}
-(void)addSubViews{
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height - scaleWithSize(46))];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableview = tableview;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ITTieziDetailViewController *vc = [[ITTieziDetailViewController alloc]init];
    vc.dic = @{
                          @"phonenumber":_dataArr[indexPath.row][@"phonenumber"],
                          @"id": _dataArr[indexPath.row][@"id"]
                          };
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPArenaTableViewCell *cell = [CPArenaTableViewCell cellWithTableView:tableView];
    cell.backgroundColor = [UIColor clearColor];
    if (_dataArr.count) {
        cell.title.text= [_dataArr[indexPath.row] objectForKey:@"title"];
        cell.dateLabel.text = [_dataArr[indexPath.row] objectForKey:@"strcreatetime"];
        cell.authorLabel.text = [_dataArr[indexPath.row] objectForKey:@"username"];
        cell.contentLab.text = [_dataArr[indexPath.row] objectForKey:@"content"];
        [cell.commentBtn setTitle:[NSString stringWithFormat:@"%@", [_dataArr[indexPath.row] objectForKey:@"commentCount"]] forState:UIControlStateNormal];
        if ([[_dataArr[indexPath.row] objectForKey:@"imgPath"] isEqual:[NSNull null]]) {
            cell.pic.image = [UIImage imageNamed:@"头像"];
        }else{
            [cell.pic sd_setImageWithURL:[NSURL URLWithString:[_dataArr[indexPath.row] objectForKey:@"imgPath"]] placeholderImage:[UIImage imageNamed:@"头像"]];
        }
        
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(120);
}

- (void)createRightBtn {
    UIButton *confirmBtn = [[UIButton alloc]init];
    confirmBtn.frame = CGRectMake(0, 0, scaleWithSize(20), scaleWithSize(20));
//    [confirmBtn setTitle:@"发帖" forState:UIControlStateNormal];
    [confirmBtn setImage:[UIImage imageNamed:@"tieziComment"] forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = fontSize(scaleWithSize(18));
    [confirmBtn addTarget:self action:@selector(releaseClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:confirmBtn];
}

- (void)releaseClick {
    if ([[gobalConfig getInstance] IsLogin] ==NO) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        LoginViewController *login = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }else{
        releaseViewController *vc = [[releaseViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
