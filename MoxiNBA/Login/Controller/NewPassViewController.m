//
//  NewPassViewController.m
//  Domino
//
//  Created by jack.wang on 16/7/18.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "NewPassViewController.h"

@interface NewPassViewController ()

@property (nonatomic ,strong)   NSString    *mobileStr;
@property (nonatomic ,strong)   NSString    *validcode;

@end

@implementation NewPassViewController

- (id)initWithMobile:(NSString *)mobile ValidCode:(NSString *)valid
{
    self = [super init];
    if (self) {
        self.mobileStr = mobile;
        self.validcode = valid;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createHeaderViewWithBackButton:@"忘记密码"];
    [self addSubViews];
    
    // Do any additional setup after loading the view.
}

- (void)addSubViews{
    for (int i=0; i<3; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, K_FRAME_NAVIGATION_BAR_HEIGHT+K_FRAME_HEAD_HEIGHT+20+50*i, K_FRAME_BASE_WIDTH, 1)];
        [lineView setBackgroundColor:[UIColor lightGrayColor]];
        [lineView setAlpha:0.2f];
        [self.view addSubview:lineView];
    }
    
    pwdField1 = [[UITextField alloc] init];
    [pwdField1 setFrame:CGRectMake(20, K_FRAME_NAVIGATION_BAR_HEIGHT+K_FRAME_HEAD_HEIGHT+20, K_FRAME_BASE_WIDTH-40, 50)];
    [pwdField1 setPlaceholder:@"新密码"];
    [pwdField1 setDelegate:self];
    [pwdField1 setSecureTextEntry:YES];
    [pwdField1 setReturnKeyType:UIReturnKeyDone];
    [self.view addSubview:pwdField1];
    
    pwdField2 = [[UITextField alloc] init];
    [pwdField2 setFrame:CGRectMake(20, K_FRAME_NAVIGATION_BAR_HEIGHT+K_FRAME_HEAD_HEIGHT+70, K_FRAME_BASE_WIDTH-40, 50)];
    [pwdField2 setPlaceholder:@"确认验证码"];
    [pwdField2 setDelegate:self];
    [pwdField2 setSecureTextEntry:YES];
    [pwdField2 setReturnKeyType:UIReturnKeyDone];
    [self.view addSubview:pwdField2];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sureBtn setFrame:CGRectMake(0, K_FRAME_BASE_HEIGHT/2, K_FRAME_BASE_WIDTH, 40)];
    [sureBtn setBackgroundColor:K_COLOR_DAMINO_RED];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn setTitle:@"确认提交" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];

}

#pragma mark -
#pragma mark button action

- (void)sureBtnAction:(id)sender{
    if ([pwdField1.text isEqual:pwdField2.text]) {
        [SVProgressHUD showWithStatus:@"正在修改"];
//        [[HttpRequestClient sharedClient] forgetLoginPassword:self.validcode mobile:self.mobileStr newPwd:pwdField2.text request:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//            [self hideHud];
//            if (resultCode == 0) {
//                [self showHint:@"修改成功，请重新登陆！"];
//                LoginViewController *loginController = [[LoginViewController alloc]init];
//                [self.navigationController popToViewController:loginController animated:YES];
//            } else {
//                [self showHint:resultMsg];
//            }
//        }];
    } else {
        [SVProgressHUD showWithStatus:@"两次输入新密码不一致，请重新输入！"];
    }
}

#pragma mark -
#pragma mark textfield

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark menory

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
