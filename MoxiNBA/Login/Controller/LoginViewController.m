//
//  LoginViewController.m
//  Domino
//
//  Created by jack.wang on 16/6/27.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "RegisterWebViewController.h"
#import "ForgetViewController.h"
//#import "ForgotWebViewController.h"
#import "testViewController.h"
#import "WSLoginView.h"


@class AppDelegate;
static int num = 60;

@interface LoginViewController ()

@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *password;

@end

@implementation LoginViewController

@synthesize showPswBtn;

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    [self createHeaderViewWithBackButton:@"登陆"];
//    [self addSubviews];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self createViews];
//    [self getImageData];
    
    
    WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:CGRectMake(0, 0,KSceenW, KSceenH)];
    wsLoginV.titleLabel.text = @"登录";
    wsLoginV.titleLabel.textColor = [UIColor grayColor];
    wsLoginV.hideEyesType = NOEyesHide;
    [self.view addSubview:wsLoginV];
    
    [wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {
        
        textField1Text = @"18638508802";
        textField2Text = @"Qwer";
        
        if (textField1Text.length < 1 || textField2Text.length < 1) {
            [SVProgressHUD showErrorWithStatus:@"帐户或密码不能为空。输入后请再试一次!"];
            return ;
        }
        
        [SVProgressHUD showWithStatus:@"loading..."];
        
        
        
//        NSDictionary *parame = @{
//                                 @"phoneNumber": textField1Text,
//                                 @"password":textField2Text
//                                 };
        
        
        
        NSString *url = @"https://www.h1055.com/ozsuser/login.htmls";
        NSDictionary *parame = @{
                                 @"phonenumber": textField1Text,
                                 @"userpwd":textField2Text
                                 };
        [[CPNetWorkRequest sharedClient]get:url parame:parame success:^(id object) {
            
            if (![[object objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
                NSString *errStr = [object objectForKey:@"error"];
                [SVProgressHUD dismiss];
                [SVProgressHUD showErrorWithStatus:errStr];
                
            }else{
                [SVProgressHUD dismiss];
                [[gobalConfig getInstance] setUserName: object[@"result"][@"username"]];
                [[gobalConfig getInstance] setPhonenumber:object[@"result"][@"phonenumber"]];
                [[gobalConfig getInstance]setIsLogin:YES];
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    //                [self.navigationController popToRootViewControllerAnimated:YES];
                    [self switchToRootViewController:0];
                });
                
            }
            NSLog(@"%@",object);
            
            
            //        [[gobalConfig getInstance] setUserName: object[@"result"][@"username"]];
            //        [[gobalConfig getInstance] setPhonenumber:object[@"result"][@"phonenumber"]];
            //        [[gobalConfig getInstance]setIsLogin:YES];
            //        dispatch_async(dispatch_get_main_queue(), ^{
            //
            //            [self.navigationController popToRootViewControllerAnimated:YES];
            //
            //        });
            
        } failure:^(NSError *err) {
            NSString *errStr = [NSString stringWithFormat:@"%@", err];
            [SVProgressHUD showErrorWithStatus:errStr];
            //            [SVProgressHUD dismiss];
            
        }];

        
        
        
//        [SYJHttpHelper Post:[NSString stringWithFormat:@"http://www.h1055.com:9032/user/login.do"] parameters:parame success:^(id responseObject) {
//            
//            [SVProgressHUD dismiss];
//
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//            NSLog(@"%@",dict);
//            
//            if (![[dict objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
//                NSString *errStr = [dict objectForKey:@"error"];
//                [SVProgressHUD dismiss];
//                [SVProgressHUD showErrorWithStatus:errStr];
//                
//            }else{
//                [SVProgressHUD dismiss];
//                [[gobalConfig getInstance] setUserName: dict[@"result"][@"username"]];
//                [[gobalConfig getInstance] setPhonenumber:dict[@"result"][@"phonenumber"]];
//                [[gobalConfig getInstance]setIsLogin:YES];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    
//                    [self switchToRootViewController:0];
//                });
//            }
//            
//            
//        } failure:^(NSError *error) {
//            
//            [SVProgressHUD showErrorWithStatus:@"登陆失败"];
//
//            
//        }];
        
    }];
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [forgetBtn setTitle:@"登录有问题? 点这!" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:TextColor forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetPassBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [wsLoginV addSubview:forgetBtn];
    forgetBtn.sd_layout.centerXEqualToView(wsLoginV).bottomSpaceToView(wsLoginV, 160).heightIs(15).widthIs(240);
    
    UIButton *joinUs = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [joinUs setTitle:@"Join us?" forState:UIControlStateNormal];
    [joinUs setTitleColor:TextColor forState:UIControlStateNormal];
    [joinUs addTarget:self action:@selector(registerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    joinUs.titleLabel.font = [UIFont systemFontOfSize:24];
    [wsLoginV addSubview:joinUs];
    joinUs.sd_layout.centerXEqualToView(wsLoginV).bottomSpaceToView(wsLoginV, 30).heightIs(80).widthIs(150);


    
    

    
}


- (AppDelegate *)sharedAPPDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)switchToRootViewController: (NSInteger)index {
    AppDelegate *appDelegate = [self sharedAPPDelegate];
    [appDelegate switchIndexPage:index];
    
}

- (void)registerBtnAction:(id)sender{
    RegisterViewController *registerController = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerController animated:YES];

}

- (void)forgetPassBtnAction:(id)sender{
    ForgetViewController  *forgotViewController = [[ForgetViewController alloc] init] ;
    [self.navigationController pushViewController:forgotViewController animated:YES];
}


-(void)backBtnAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark view animation

-( CABasicAnimation *)moveX:( float )time X:( NSNumber *)x
{
    NSLog(@"X:%@",x);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath : @"transform.translation.x" ]; ///.y 的话就向下移动。
    animation. toValue = x;
    animation. duration = time;
    animation. removedOnCompletion = NO ; //yes 的话，又返回原位置了。
    animation. repeatCount = 0 ;
    animation. fillMode = kCAFillModeForwards;
    
    return animation;
}

#pragma mark -
#pragma mark textfield
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    [self changeViewHeightForkeyBoardWillShow:self.view];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark memory
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
