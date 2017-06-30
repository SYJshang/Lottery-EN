//
//  CPChangeUserInfoViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/22.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPChangeUserInfoViewController.h"
#import "CPChangeUserNameViewController.h"
#import "AppDelegate.h"

@class  AppDelegate;
@interface CPChangeUserInfoViewController ()<UITableViewDelegate, UITableViewDataSource, TZImagePickerControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) UIImage *portrait;

@end

@implementation CPChangeUserInfoViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self createViews];
    [self getUserInfo];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UserInfo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
}

- (void)createViews {
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(20, 0, scaleWithSize(16), scaleWithSize(16));
    [leftBtn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = fontSize(scaleWithSize(16));
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];

    
    UIButton *releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    releaseBtn.frame = CGRectMake(20, 0, scaleWithSize(60), scaleWithSize(16));
    [releaseBtn setTitle:@"Release" forState:UIControlStateNormal];
    [releaseBtn addTarget:self action:@selector(releaseInfo) forControlEvents:UIControlEventTouchUpInside];
    [releaseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    releaseBtn.titleLabel.font = fontSize(scaleWithSize(16));
    
    UIButton *exitBtn =[[UIButton alloc]initWithFrame:CGRectMake(scaleWithSize(20), screen_height - scaleWithSize(200), SCREEN_SIZE.width - scaleWithSize(40), scaleWithSize(40))];
    exitBtn.backgroundColor = [UIColor blackColor];
    [exitBtn setTitle:@"Logout" forState:UIControlStateNormal];
    exitBtn.layer.cornerRadius = 5;
    [exitBtn addTarget:self action:@selector(exitBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitBtn];
    
//    UIBarButtonItem *rightBarBtn = ;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:releaseBtn];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setNoti:) name:@"USERNAME_NOTI" object:nil];
}

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (AppDelegate *)sharedAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
-(void)exitBtnAction{
    [[gobalConfig getInstance]setIsLogin:NO];
    [[gobalConfig getInstance]setPhonenumber:@""];
    
    AppDelegate *appDelegate = [self sharedAppDelegate];
    [appDelegate switchToRootVc];
    
    
}

- (void)setNoti: (NSNotification *)noti{
    
    id username = noti.object;
    self.username = username;
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        TZImagePickerController *imagePicker = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
        [imagePicker setDidFinishPickingPhotosHandle:^(NSArray *imageArray, NSArray *array, BOOL isSelectOriginalPhoto){
            
            UIImage *image = [imageArray firstObject];
            self.portrait = image;
            [self.tableView reloadData];
            
        }];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else{
        
        CPChangeUserNameViewController *vc = [[CPChangeUserNameViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return scaleWithSize(16);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return scaleWithSize(70);
    }else{
        return scaleWithSize(50);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.section == 0) {
        
        cell.textLabel.text = @"Portrait";
        
        UIImageView *pic = [[UIImageView alloc]init];
        
        if (self.portrait == nil) {
            [pic sd_setImageWithURL:[NSURL URLWithString:_model.imgpath] placeholderImage:[UIImage imageNamed:@"头像"]];
        }else{
            pic.image = self.portrait;
        }
        
        pic.layer.cornerRadius = scaleWithSize(22.5);
        pic.layer.masksToBounds = YES;
        pic.contentMode = UIViewContentModeScaleToFill;
        [cell.contentView addSubview:pic];
        
        [pic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(scaleWithSize(-16));
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(scaleWithSize(45), scaleWithSize(45)));
        }];
    }else{
        
        cell.textLabel.text = @"Nickname";
        
        UILabel *detailLab = [[UILabel alloc]init];
        detailLab.font = fontSize(scaleWithSize(16));
        detailLab.text = _model.username;
        [cell.contentView addSubview:detailLab];
        
        [detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(scaleWithSize(-16));
            make.centerY.mas_equalTo(cell.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
    }
    return cell;
}

- (void)releaseInfo {
    
    [SVProgressHUD showErrorWithStatus:@"Error"];
    
//    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
//    
//    NSData *data = UIImageJPEGRepresentation(self.portrait, 1.0f);
//    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    
////    NSDictionary *parame = @{
////                             @"file": encodedImageStr,
////                             @"phonenumber": phoneNum
////                             };
//    NSDictionary *parame = [NSDictionary dictionary];
//    [parame setValue:encodedImageStr forKey:@"file"];
//    [parame setValue:phoneNum forKey:@"phonenumber"];
//
//    
//    NSString *url = [NSString stringWithFormat:@"https://h1055.com/ozsuser/uploadFile.htmls"];
//    NSString *utf = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    [[CPNetWorkRequest sharedClient] post:utf parame:parame success:^(id object) {
//        if (object[@"errorcode"] == 0) {
//            [SVProgressHUD showSuccessWithStatus:@"error"];
//        }else{
//            [SVProgressHUD showSuccessWithStatus:@"Success"];
//        }
//    } failure:^(NSError *err) {
//        [SVProgressHUD showSuccessWithStatus:@"error"];
// 
//    }];
    
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
