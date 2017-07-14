//
//  releaseViewController.m
//  inrtest
//
//  Created by HongShun Chen on 2017/4/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "releaseViewController.h"



@interface releaseViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextField *titleText;
@property (nonatomic, strong) UITextView *content;

@end

@implementation releaseViewController{
    NSMutableArray *dataArr;
    NSString *titleStr;
    NSString *contentStr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor lightGrayColor] title:@"发布" font:scaleWithSize(24)];
    
    [self createViews];
    //    [self createRightBtn];
    // Do any additional setup after loading the view.
}
- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(void)getDataWithphoneNumber:(NSString *)phoneNumber title:(NSString *)title content:(NSString *)content userName:(NSString *)userName{

    NSString *str = [NSString stringWithFormat:@"https://h1055.com/user/saveForum.htmls?phonenumber=%@&title=%@&content=%@&username=%@",[[gobalConfig getInstance]phonenumber ],title,content,userName];
    NSString *url = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [self.navigationController popViewControllerAnimated:YES];

    [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
        if (object[@"errorcode"] == 0) {
            [SVProgressHUD showErrorWithStatus:@"fail"];
        }else{
            [SVProgressHUD showSuccessWithStatus:@"Success"];
        }
    } failure:^(NSError *err) {
        
    }];
}

- (void)createViews {
    
    UITextField *titleText = [[UITextField alloc]init];
    titleText.placeholder = @"标题";
    [titleText addTarget:self action:@selector(ListentitleChange) forControlEvents:UIControlEventEditingChanged];
    titleText.font = fontSize(scaleWithSize(23));
    [self.view addSubview:titleText];
    self.titleText = titleText;
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = Color(200, 199, 204, 100);
    [self.view addSubview:line];
    
    UITextView *content = [[UITextView alloc]init];
    content.font = fontSize(scaleWithSize(18));
    content.delegate =self;
    [self.view addSubview:content];
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.font = fontSize(scaleWithSize(18));
    placeHolderLabel.text = @"内容（必填）";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [content addSubview:placeHolderLabel];
    
    [content setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    [titleText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.top.equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width-32, 64));
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.equalTo(titleText.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width-32, 1));
    }];
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.top.equalTo(line.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width-32, 200));
    }];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeCustom];
    next.frame = CGRectMake(0, 0, 50, 18);
    [next setTitle:@"release" forState:UIControlStateNormal];
    [next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    next.titleLabel.font = fontSize(scaleWithSize(16));
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:next];
    
//    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
//    cancel.frame = CGRectMake(0, 0, 50, 18);
//    [cancel setTitle:@"cancel" forState:UIControlStateNormal];
//    [cancel addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
//    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    cancel.titleLabel.font = fontSize(scaleWithSize(16));
//    self.content = content;
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cancel];
}


//titleChange
-(void)ListentitleChange{
    titleStr =   _titleText.text;
}
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"textViewDidChange：%@", textView.text);
    contentStr =  textView.text;
}
//取消
- (void)cancelClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)nextClick {
    
    [self getDataWithphoneNumber:nil title:titleStr content:contentStr userName:[[gobalConfig getInstance] userName]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
