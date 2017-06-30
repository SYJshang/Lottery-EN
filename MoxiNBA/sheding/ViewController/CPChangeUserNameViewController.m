//
//  CPChangeUserNameViewController.m
//  inrtest
//
//  Created by zt on 2017/5/23.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPChangeUserNameViewController.h"

@interface CPChangeUserNameViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *userText;

@end

@implementation CPChangeUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor grayColor] title:@"Change UserName" font:18];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(20, 0, scaleWithSize(16), scaleWithSize(16));
    [leftBtn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = fontSize(scaleWithSize(16));
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    [self createViews];
    // Do any additional setup after loading the view.
}

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)createViews {
    
    UILabel *nickName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, scaleWithSize(100), scaleWithSize(30))];
    nickName.textAlignment = NSTextAlignmentCenter;
    nickName.backgroundColor = Color(200, 199, 204, 1);
    nickName.text = @"NickName";
    
    UITextField *userText = [[UITextField alloc]init];
    userText.font = fontSize(scaleWithSize(16));
    userText.leftViewMode = UITextFieldViewModeAlways;
    userText.leftView = nickName;
    userText.delegate = self;
    userText.layer.borderWidth = 0.5f;
    userText.layer.borderColor = Color(200, 199, 204, 1).CGColor;
    [self.view addSubview:userText];
    self.userText = userText;
    
    [userText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(scaleWithSize(70));
        make.width.mas_equalTo(screen_width);
        make.height.mas_equalTo(scaleWithSize(30));
    }];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.frame = CGRectMake(0, 0, scaleWithSize(60), scaleWithSize(16));
    [confirmBtn setTitle:@"Confirm" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.titleLabel.font = fontSize(scaleWithSize(14));
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:confirmBtn];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.userText resignFirstResponder];
}

- (void)confirmClick {
    
//    user/updateUserName.htmls
    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
    NSString *url = [NSString stringWithFormat:@"https://www.h1055.com/ozsuser/updateUserName.htmls?phonenumber=%@&username=%@", phoneNum, self.userText.text ];
    
    [[CPNetWorkRequest sharedClient] post:url parame:nil success:^(id object) {
        if (object[@"errorcode"] == 0) {
            [SVProgressHUD showSuccessWithStatus:@"error"];
        }else{
            [SVProgressHUD showSuccessWithStatus:@"success"];
  
        }
        
    } failure:^(NSError *err) {
        
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"USERNAME_NOTI" object:self.userText.text];
    [self.navigationController popViewControllerAnimated:YES];
    
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
