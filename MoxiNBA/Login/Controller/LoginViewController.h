//
//  LoginViewController.h
//  Domino
//
//  Created by jack.wang on 16/6/27.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@interface LoginViewController : BaseViewController<UITextFieldDelegate>{
    UIButton *loginTitleBtn;
    UIButton *loginAccountBtn;
   
    UITextField *userField;
    UITextField *passField;
    UITextField *imageCode;
    
    UIView  *moveLine;
    UIView *verifyLine;
    UIView *imageLine;
    UIView *buttomLine;
    
    UIButton *verifyButton;
    UIButton *forgetPassButton;
    UIButton *registerButton;
    UIButton *imageButton;
    UIButton *loginButton;
    
    NSString *VerificationCodeKey;
    
    NSTimer *time;
    
}

@property (nonatomic, assign)    int   jumpNum;

@property (nonatomic, strong)    UIButton *showPswBtn;

@end
