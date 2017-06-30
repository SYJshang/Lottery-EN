//
//  RegisterViewController.m
//  Domino
//
//  Created by jack.wang on 16/7/17.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "AgreeViewController.h"


static int num = 60;

#define registerFeildHeight K_FRAME_BASE_HEIGHT/13
@interface RegisterViewController (){
    NSTimer *time;

}

@property (nonatomic, strong)   UITextField     *mobile;
@property (nonatomic, retain)   UIButton        *codeBtn;
@property (nonatomic, retain)   UIButton        *agree;
@property (nonatomic, retain)   UIButton        *enjoy;
@property(nonatomic,retain)      UIButton        *showPswBtn;
@property (nonatomic, strong)   UITextField     *PswField;

@end

@implementation RegisterViewController

@synthesize codeBtn;

@synthesize showPswBtn;

@synthesize strTime;

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    [self createHeaderViewWithBackButton:@"用户注册"];
    
    [self addSubViews];
    
    self.title=@"Register";
    self.navigationController.navigationBarHidden=NO;
    
//    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
//    [self.navigationController.navigationBar setBarTintColor:[Utils colorFromHexRGB:@"d91d36"]];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
   // [(AppDelegate*)[[UIApplication sharedApplication]delegate] hideTabbar];
    [super viewWillAppear:animated];
}

- (void)addSubViews{
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height -170, self.view.bounds.size.width, 30)];
//    label.text= @"轻触上面的'提交'按钮，即表示您同意";
//    label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:label];
//    
//    UIButton *agreeButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [agreeButton setFrame:CGRectMake(0, self.view.bounds.size.height -130, self.view.bounds.size.width, 30)];
//    [agreeButton setTitle:@"《彩票圈软件许可及服务协议》" forState:UIControlStateNormal];
//    [agreeButton addTarget:self action:@selector(agreeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:agreeButton];
//    
    
    NSArray *placeholderArray = [NSArray arrayWithObjects:@"phone Number",@"code",@"nickName",@"password", nil];//xx位至xx位
    for (int i=0; i<4; i++) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, registerFeildHeight*(i+2), K_FRAME_BASE_WIDTH, 1)];
        [lineView setBackgroundColor:[UIColor lightGrayColor]];
        [lineView setAlpha:0.2f];
        [self.view addSubview:lineView];
        
        if (i==3) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, registerFeildHeight*(i+3), K_FRAME_BASE_WIDTH, 1)];
            [lineView setBackgroundColor:[UIColor lightGrayColor]];
            [lineView setAlpha:0.2f];
            [self.view addSubview:lineView];
        }
        
        float textWid;
        if (i == 1) {
            textWid = K_FRAME_BASE_WIDTH-140;
        } else {
            textWid = K_FRAME_BASE_WIDTH-40;
        }
        
        UITextField *registerField = [[UITextField alloc] initWithFrame:CGRectMake(20, registerFeildHeight*(i+2), K_FRAME_BASE_WIDTH-40, registerFeildHeight)];
        [registerField setPlaceholder:[placeholderArray objectAtIndex:i]];
        [registerField setDelegate:self];
        [registerField setReturnKeyType:UIReturnKeyDone];
        [registerField setTag:1000100+i];
        [self.view addSubview:registerField];
        
        if (i == 0) {
            self.mobile = registerField;
        } else if (i == 3) {
            registerField.secureTextEntry = YES;
            self.PswField = registerField;
        }
        
        if (i == 1) {
            UIButton *yanzhen = [[UIButton alloc] initWithFrame:CGRectMake(K_FRAME_BASE_WIDTH-110, CGRectGetMinY(registerField.frame)+10, 80, registerFeildHeight/2)];
            [yanzhen setTitle:@"get code" forState:UIControlStateNormal];
            [yanzhen.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [yanzhen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [yanzhen addTarget:self action:@selector(clickGetCodeButton) forControlEvents:UIControlEventTouchUpInside];
            [yanzhen setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [yanzhen setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            yanzhen.layer.cornerRadius =5.0;
            yanzhen.backgroundColor = RGBA(255, 125, 67, 1);
            [self.view addSubview:yanzhen];
            
            self.codeBtn = yanzhen;

        }
        if (i == 3) {
            UIImage *NImage = [UIImage imageNamed:@"loginpage_btn_hide.png"];
            UIImage *SImage = [UIImage imageNamed: @"loginpage_btn_display.png"];
            CGFloat BtnY = (registerFeildHeight-RectHeight(NImage)*2)/2;
            UIButton *showPswBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(K_FRAME_BASE_WIDTH-70, CGRectGetMinY(registerField.frame)+BtnY+5,RectWidth(NImage), RectHeight(NImage))];
            [showPswBtn1 setBackgroundImage:NImage forState:UIControlStateNormal];
            [showPswBtn1 setBackgroundImage:SImage forState:UIControlStateSelected];
            [showPswBtn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [showPswBtn1 addTarget:self action:@selector(setShowPswBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:showPswBtn1];
            
            self.showPswBtn = showPswBtn1;
            
//            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(K_FRAME_BASE_WIDTH-140, CGRectGetMinY(registerField.frame)+8, 1, registerFeildHeight-16)];
//            [line setBackgroundColor:[UIColor lightGrayColor]];
//            [self.view addSubview:line];
        }
    }

    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    [registerBtn setFrame:CGRectMake(15, K_RECT_MAXY(self.showPswBtn)+50, K_FRAME_BASE_WIDTH-30, 40)];
    [registerBtn setBackgroundColor:K_COLOR_DAMINO_RED];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn setTitle:@"submit" forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius = 5.0;
    [registerBtn addTarget:self action:@selector(registerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
}

#pragma mark -
#pragma mark button action

-(void)agreeBtnAction:(id)sender{
    [sender setSelected:![sender isSelected]];
}

- (void)enjoyBtnAction:(id)sender{
    [sender setSelected:![sender isSelected]];
}

- (void)registerBtnAction:(id)sender{
    
    [SVProgressHUD showErrorWithStatus:@"Temporarily not registered, please try again later!!!"];
    
//        NSMutableArray *ary = [NSMutableArray array];
//        for (int i = 0; i < 4; i++) {
//            UITextField *field = (UITextField *)[self.view viewWithTag:1000100+i];
//            if (i < 4 && field.text.length == 0) {
//                [SVProgressHUD showWithStatus:@"Please fill out the required fields and submit again"];
//                return;
//            }
//            [ary addObject:field.text];
//        }
//    
//    if (strTime==nil) {
//         [SVProgressHUD showWithStatus:@"Please send verification code"];
//    }else{
//        
//        NSMutableDictionary *parmetr = [NSMutableDictionary dictionary];
//        [parmetr setObject:@"" forKey:@""];
//        [parmetr setObject:@"" forKey:@""];
//        [parmetr setObject:@"" forKey:@""];
//        [parmetr setObject:@"" forKey:@""];
//
//        
//        [SYJHttpHelper Post:[NSString stringWithFormat:@""] parameters:nil success:^(id responseObject) {
//            
//        } failure:^(NSError *error) {
//            
//        }];
    
        
//        [[HttpRequestClient sharedClient] userRegister:ary[0] password:ary[3] validcode:ary[1] username:strTime nickname:[Utils paramStringIsNull:ary[2]]  email:nil birthday:nil gender:nil request:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//            if (![[dataDict objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
//                NSString *errStr = [dataDict objectForKey:@"error"];
//                [SVProgressHUD showWithStatus:errStr];
//
//            }else{
//                dispatch_async(dispatch_get_main_queue(), ^{
//                
//                [self.navigationController  popViewControllerAnimated:YES];
//                });
//            
//            }
//            
//        }];
//    }
}
    
    



- (void)clickGetCodeButton {
    if (self.mobile.text.length == 11) {
        if ([Utils validateTelPhone:self.mobile.text]) {
            [self.codeBtn setUserInteractionEnabled:NO];
            time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(sendValidCode) userInfo:nil repeats:YES];
        } else {
            [SVProgressHUD showErrorWithStatus:@"Mobile phone number format is not correct"];
        }
    } else {
         [SVProgressHUD showErrorWithStatus:@"Please enter the 11 phone number"];
    }
}


-(void)agreeButtonClicked{
    AgreeViewController *agreeViewController=[[AgreeViewController alloc] init];
    [self.navigationController pushViewController:agreeViewController animated:YES];
    
}

//设置显示密码安全显示
-(void)setShowPswBtn{
    self.showPswBtn.selected =! self.showPswBtn.selected;
    self.PswField.secureTextEntry = !self.PswField.secureTextEntry;
}

- (void)sendValidCode {
    if (num == 60) {
        num--;
        NSString *url = [NSString stringWithFormat:@"https://www.h1055.com:80/ozsuser/registerCheckUser.htmls?phonenumber=%@", self.mobile.text];
//        NSDictionary *parame = @{
//                                 
//                                 };
        [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
            [SVProgressHUD showSuccessWithStatus:@"Verification code sent successfully"];
            strTime = object[@"result"][@"strTime"];
        } failure:^(NSError *err) {
            
        }];
//        [[HttpRequestClient sharedClient]sendValidCode:self.mobile.text VerificationCode:self.mobile.text VerificationCodeKey:nil request:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
////            [SVProgressHUD showWithStatus:@"验证码发送成功"];
//            strTime = dataDict[@"result"][@"strTime"];
//        }];
//        [[HttpRequestClient sharedClient] sendValidCode:self.mobile.text request:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//            [self showHint:@"验证码发送成功"];
//        }];
    } else if (num > 0) {
        num--;
        [self.codeBtn setTitle:[NSString stringWithFormat:@"%d秒",num] forState:UIControlStateNormal];
    } else {
        [time invalidate];
        [self.codeBtn setTitle:@"Get code" forState:UIControlStateNormal];
        [self.codeBtn setUserInteractionEnabled:YES];
        num = 60;
    }
}

#pragma mark -
#pragma mark textfield
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self changeViewHeightForkeyBoardWillShow:textField];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self changeViewHeightForKeyBoardWillHide:textField];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark view disappear
- (void)viewWillDisappear:(BOOL)animated{
   // [(AppDelegate*)[[UIApplication sharedApplication]delegate] showTabbar];
    [super viewWillDisappear:animated];
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
