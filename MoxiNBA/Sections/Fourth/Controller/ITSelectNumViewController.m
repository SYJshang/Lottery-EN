//
//  ITSelectNumViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/4/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITSelectNumViewController.h"

@interface ITSelectNumViewController ()

@property (nonatomic, strong) UILabel *numLab1;
@property (nonatomic, strong) UILabel *numLab2;
@property (nonatomic, strong) UILabel *numLab3;
@property (nonatomic, strong) UILabel *numLab4;
@property (nonatomic, strong) UILabel *numLab5;
@property (nonatomic, strong) UILabel *numLab6;
@property (nonatomic, strong) UILabel *numLab7;
@property (nonatomic, strong) UILabel *numLab8;
@property (nonatomic, strong) UILabel *numLab9;
@property (nonatomic, strong) NSArray *numLabs;

@end

@implementation ITSelectNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SelectNum";
    [self createViews];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
}

- (void)createViews {
    
    UIView *showView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_SIZE.width, scaleWithSize(100))];
    [self.view addSubview:showView];
    
    UILabel *lab1 = [[UILabel alloc]init];
    lab1.text = @"SelectYourNum";
    lab1.font = fontSize(scaleWithSize(16));
    lab1.textColor = Color(250, 67, 67, 1);
    [showView addSubview:lab1];
    
    UILabel *lab2 = [[UILabel alloc]init];
    lab2.text = @"I believe";
    lab2.textColor = Color(200, 199, 204, 1);
    lab2.font = fontSize(scaleWithSize(14));
    [showView addSubview:lab2];
    
    UILabel *lab3 = [[UILabel alloc]init];
    lab3.text = @"下一个幸运儿就是你";
    lab3.textColor = Color(200, 199, 204, 1);
    lab3.font = fontSize(scaleWithSize(14));
    [showView addSubview:lab3];
    
    UILabel *numLab1 = [self createNumLab];
    [showView addSubview:numLab1];
    self.numLab1 = numLab1;
    UILabel *numLab2 = [self createNumLab];
    [showView addSubview:numLab2];
    self.numLab2 = numLab2;
    UILabel *numLab3 = [self createNumLab];
    [showView addSubview:numLab3];
    self.numLab3 = numLab3;
    UILabel *numLab4 = [self createNumLab];
    [showView addSubview:numLab4];
    self.numLab4 = numLab4;
    UILabel *numLab5 = [self createNumLab];
    [showView addSubview:numLab5];
    self.numLab5 = numLab5;
    UILabel *numLab6 = [self createNumLab];
    [showView addSubview:numLab6];
    self.numLab6 = numLab6;
    UILabel *numLab7 = [self createNumLab];
    [showView addSubview:numLab7];
    self.numLab7 = numLab7;
    UILabel *numLab8 = [self createNumLab];
    [showView addSubview:numLab8];
    self.numLab8 = numLab8;
    UILabel *numLab9 = [self createNumLab];
    [showView addSubview:numLab9];
    self.numLab9 = numLab9;
    CGFloat numLabWidth = (SCREEN_SIZE.width - scaleWithSize(112)) / 9;
    NSArray *numLabs = @[numLab1, numLab2, numLab3, numLab4, numLab5, numLab6, numLab7, numLab8, numLab9];
    _numLabs = numLabs;
    for (int i = 0; i < 9; i++) {
        
        if (i == 0) {
            [numLabs[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(scaleWithSize(16));
                make.width.mas_equalTo(numLabWidth);
                make.top.mas_equalTo(lab3.mas_bottom).offset(scaleWithSize(30));
                make.height.mas_equalTo(scaleWithSize(45));
            }];
        }else{
            UILabel *lab = numLabs[i-1];
            [numLabs[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lab.mas_right).offset(scaleWithSize(10));
                make.width.mas_equalTo(numLabWidth);
                make.top.mas_equalTo(lab3.mas_bottom).offset(scaleWithSize(30));
                make.height.mas_equalTo(scaleWithSize(45));
            }];
        }
        
    }
    
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.top.mas_equalTo(scaleWithSize(10));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(SCREEN_SIZE.width));
    }];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lab1.mas_left);
        make.top.mas_equalTo(lab1.mas_bottom).offset(scaleWithSize(10));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(SCREEN_SIZE.width));
    }];
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lab1.mas_left);
        make.top.mas_equalTo(lab2.mas_bottom).offset(scaleWithSize(10));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(SCREEN_SIZE.width));
    }];
    
    UIButton *shuangseqiuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shuangseqiuBtn.layer.cornerRadius = scaleWithSize(5);
    [shuangseqiuBtn setTitle:@"双色球选号" forState:UIControlStateNormal];
    shuangseqiuBtn.titleLabel.font = fontSize(scaleWithSize(16));
    [shuangseqiuBtn addTarget:self action:@selector(selectNumClick) forControlEvents:UIControlEventTouchUpInside];
    shuangseqiuBtn.backgroundColor = Color(250, 67, 67, 1);
    [self.view addSubview:shuangseqiuBtn];
    
    UIButton *liuchangbanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    liuchangbanBtn.layer.cornerRadius = scaleWithSize(5);
    [liuchangbanBtn addTarget:self action:@selector(selectNumClick) forControlEvents:UIControlEventTouchUpInside];
    liuchangbanBtn.titleLabel.font = fontSize(scaleWithSize(16));
    [liuchangbanBtn setTitle:@"六场半选号" forState:UIControlStateNormal];
    liuchangbanBtn.backgroundColor = Color(250, 67, 67, 1);
    [self.view addSubview:liuchangbanBtn];
    
    UIButton *sichangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sichangBtn.layer.cornerRadius = scaleWithSize(5);
    [sichangBtn addTarget:self action:@selector(selectNumClick) forControlEvents:UIControlEventTouchUpInside];
    [sichangBtn setTitle:@"四场进球" forState:UIControlStateNormal];
    sichangBtn.titleLabel.font = fontSize(scaleWithSize(16));
    sichangBtn.backgroundColor = Color(250, 67, 67, 1);
    [self.view addSubview:sichangBtn];
    
    CGFloat width = (SCREEN_SIZE.width - scaleWithSize(60)) / 3;
    [shuangseqiuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(10));
        make.width.mas_equalTo(width);
        make.bottom.mas_equalTo(scaleWithSize(-30));
    }];
    [liuchangbanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(shuangseqiuBtn.mas_right).offset(scaleWithSize(20));
        make.width.mas_equalTo(width);
        make.bottom.mas_equalTo(shuangseqiuBtn.mas_bottom);
    }];
    [sichangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(liuchangbanBtn.mas_right).offset(scaleWithSize(20));
        make.width.mas_equalTo(width);
        make.bottom.mas_equalTo(shuangseqiuBtn.mas_bottom);
    }];
    
}

- (void)selectNumClick {
    
    NSInteger x;
    
    NSString *str = @"";
    
    for (int i = 0; i < 9; i++) {
        x = arc4random() % 20;
        UILabel *lab = _numLabs[i];
        lab.text = [NSString stringWithFormat:@"%d", x];
    }
}

- (UILabel *)createNumLab {
    UILabel *lab = [[UILabel alloc]init];
    lab.backgroundColor = Color(139, 139, 139, 1);
    lab.textColor = [UIColor whiteColor];
    //    lab.text = @"1";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.layer.cornerRadius = scaleWithSize(5);
    lab.layer.masksToBounds = YES;
    lab.font = fontSize(scaleWithSize(20));
    return lab;
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
