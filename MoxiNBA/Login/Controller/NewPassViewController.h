//
//  NewPassViewController.h
//  Domino
//
//  Created by jack.wang on 16/7/18.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "BaseViewController.h"

@interface NewPassViewController : BaseViewController<UITextFieldDelegate>{
    UITextField *pwdField1;
    UITextField *pwdField2;
}

- (id)initWithMobile:(NSString *)mobile ValidCode:(NSString *)valid;

@end
