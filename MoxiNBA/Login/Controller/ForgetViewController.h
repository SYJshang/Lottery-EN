//
//  ForgetViewController.h
//  Domino
//
//  Created by jack.wang on 16/7/18.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "BaseViewController.h"

@interface ForgetViewController : BaseViewController<UITextFieldDelegate>{
    UITextField *phoneField;
    UITextField *varifyField;
    NSTimer *time;
    
    UITextField *newPswField;
}

@property(nonatomic,strong)UIButton *showPswBtn;

@property(nonatomic,strong)NSString *strTime ;
    
@property (nonatomic, assign) BOOL isChangePwd;



@end
