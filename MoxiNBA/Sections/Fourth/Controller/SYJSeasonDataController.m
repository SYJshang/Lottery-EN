//
//  SYJPlayerDataController.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/16.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJSeasonDataController.h"
#import "SYJPlayerDataModel.h"
#import <FXBlurView.h>

@interface SYJSeasonDataController (){
    
    //    "st": 1,
    //    "fta": 14,
    //    "bs": 2,
    //    "off": 2,
    //    "pf": 2,
    //    "lastUpdated": "20161209T045620.124Z",
    //    "gameId": 21600327,
    //    "min": "32:27",
    //    "fgm": 7,
    //    "to": 4,
    //    "deff": 4,
    //    "pts": 25,
    //    "tpa": 2,
    //    "playerId": 2544,
    //    "ftm": 10,
    //    "fga": 10,
    //    "plusminus": 31,
    //    "ast": 7,
    //    "tpm": 1,
    //    "tot": 6
    
    UILabel *st;
    UILabel *fta;
    UILabel *off;
    UILabel *pt;
    UILabel *min;
    UILabel *fgm;
    UILabel *to;
    UILabel *deff;
    UILabel *pts;
    UILabel *tpa;
    UILabel *ftm;
    UILabel *fga;
    UILabel *plusminus;
    UILabel *ast;
    UILabel *tpm;
    UILabel *tol;
}

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation SYJSeasonDataController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:self.playerID.fullName font:18.0];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationController.navigationBar.tintColor = TextColor;
    
    
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FXBlurView *_maskView = [[FXBlurView alloc] initWithFrame:self.view.bounds];
    _maskView.dynamic = NO;
    _maskView.tintColor = [UIColor blackColor];
    _maskView.blurRadius = 40;
    [self.view addSubview:_maskView];
    self.view.layer.contents = (id)[UIImage imageNamed:@"nba3.png"].CGImage;
    
    
    st = [[UILabel alloc]init];
    [self.view addSubview:st];
    st.textColor = [UIColor blackColor];
    st.textAlignment = NSTextAlignmentCenter;
    st.font = [UIFont systemFontOfSize:14];
    st.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(self.view, 80).heightIs(20).widthIs(80);
    
    fta = [[UILabel alloc]init];
    [self.view addSubview:fta];
    fta.textColor = [UIColor blackColor];
    fta.textAlignment = NSTextAlignmentCenter;
    fta.font = [UIFont systemFontOfSize:14];
    fta.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 80).heightIs(20).widthIs(80);
    
    off = [[UILabel alloc]init];
    [self.view addSubview:off];
    off.textColor = [UIColor blackColor];
    off.textAlignment = NSTextAlignmentCenter;
    off.font = [UIFont systemFontOfSize:14];
    off.sd_layout.rightSpaceToView(self.view, 10).topSpaceToView(self.view, 80).heightIs(20).widthIs(80);
    //    pt;
    //    UILabel *min;
    //    UILabel *fgm
    
    pt = [[UILabel alloc]init];
    [self.view addSubview:pt];
    pt.textColor = [UIColor blackColor];
    pt.textAlignment = NSTextAlignmentCenter;
    pt.font = [UIFont systemFontOfSize:14];
    pt.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(st, 10).heightIs(20).widthIs(80);
    
    min = [[UILabel alloc]init];
    [self.view addSubview:min];
    min.textColor = [UIColor blackColor];
    min.textAlignment = NSTextAlignmentCenter;
    min.font = [UIFont systemFontOfSize:14];
    min.sd_layout.centerXEqualToView(self.view).topSpaceToView(fta, 10).heightIs(20).widthIs(80);
    
    fgm = [[UILabel alloc]init];
    [self.view addSubview:fgm];
    fgm.textColor = [UIColor blackColor];
    fgm.textAlignment = NSTextAlignmentCenter;
    fgm.font = [UIFont systemFontOfSize:14];
    fgm.sd_layout.rightSpaceToView(self.view, 10).topSpaceToView(off, 10).heightIs(20).widthIs(80);
    
    //    to;
    //    UILabel *deff;
    //    UILabel *pts
    
    to = [[UILabel alloc]init];
    [self.view addSubview:to];
    to.textColor = [UIColor blackColor];
    to.textAlignment = NSTextAlignmentCenter;
    to.font = [UIFont systemFontOfSize:14];
    to.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(pt, 10).heightIs(20).widthIs(80);
    
    deff = [[UILabel alloc]init];
    [self.view addSubview:deff];
    deff.textColor = [UIColor blackColor];
    deff.textAlignment = NSTextAlignmentCenter;
    deff.font = [UIFont systemFontOfSize:14];
    deff.sd_layout.centerXEqualToView(self.view).topSpaceToView(min, 10).heightIs(20).widthIs(80);
    
    pts = [[UILabel alloc]init];
    [self.view addSubview:pts];
    pts.textColor = [UIColor blackColor];
    pts.textAlignment = NSTextAlignmentCenter;
    pts.font = [UIFont systemFontOfSize:14];
    pts.sd_layout.rightSpaceToView(self.view, 10).topSpaceToView(fgm, 10).heightIs(20).widthIs(80);
    //    tpa;
    //    UILabel *ftm;
    //    UILabel *fga
    tpa = [[UILabel alloc]init];
    [self.view addSubview:tpa];
    tpa.textColor = [UIColor blackColor];
    tpa.textAlignment = NSTextAlignmentCenter;
    tpa.font = [UIFont systemFontOfSize:14];
    tpa.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(to, 10).heightIs(20).widthIs(80);
    
    ftm = [[UILabel alloc]init];
    [self.view addSubview:ftm];
    ftm.textColor = [UIColor blackColor];
    ftm.textAlignment = NSTextAlignmentCenter;
    ftm.font = [UIFont systemFontOfSize:14];
    ftm.sd_layout.centerXEqualToView(self.view).topSpaceToView(deff, 10).heightIs(20).widthIs(80);
    
    fga = [[UILabel alloc]init];
    [self.view addSubview:fga];
    fga.textColor = [UIColor blackColor];
    fga.textAlignment = NSTextAlignmentCenter;
    fga.font = [UIFont systemFontOfSize:14];
    fga.sd_layout.rightSpaceToView(self.view, 10).topSpaceToView(pts, 10).heightIs(20).widthIs(80);
    
    //    plusminus;
    //    UILabel *ast;
    //    UILabel *tpm;
    //    UILabel *tol;
    
    plusminus = [[UILabel alloc]init];
    [self.view addSubview:plusminus];
    plusminus.textColor = [UIColor blackColor];
    plusminus.textAlignment = NSTextAlignmentCenter;
    plusminus.font = [UIFont systemFontOfSize:14];
    plusminus.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(tpa, 10).heightIs(20).widthIs(80);
    
    ast = [[UILabel alloc]init];
    [self.view addSubview:ast];
    ast.textColor = [UIColor blackColor];
    ast.textAlignment = NSTextAlignmentCenter;
    ast.font = [UIFont systemFontOfSize:14];
    ast.sd_layout.centerXEqualToView(self.view).topSpaceToView(ftm, 10).heightIs(20).widthIs(80);
    
    tpm = [[UILabel alloc]init];
    [self.view addSubview:tpm];
    tpm.textColor = [UIColor blackColor];
    tpm.textAlignment = NSTextAlignmentCenter;
    tpm.font = [UIFont systemFontOfSize:14];
    tpm.sd_layout.rightSpaceToView(self.view, 10).topSpaceToView(fga, 10).heightIs(20).widthIs(80);
    
    tol = [[UILabel alloc]init];
    [self.view addSubview:tol];
    tol.textColor = [UIColor blackColor];
    tol.textAlignment = NSTextAlignmentCenter;
    tol.font = [UIFont systemFontOfSize:14];
    tol.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(plusminus, 10).heightIs(20).widthIs(80);
    
    
    self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelColor = [UIColor whiteColor];
    self.hud.color = [UIColor blackColor];
    self.hud.labelText = NSLocalizedString(@"loading", @"HUD message title");
    
    [self getHomeNetWorkData];
    
    // Do any additional setup after loading the view.
}

- (void)getHomeNetWorkData{
    
    
    [SYJHttpHelper GET:[NSString stringWithFormat:@"http://api.suredbits.com/nba/v0/stats/%@/%@",self.playerID.lastName,self.playerID.firstName] parameters:nil success:^(id responseObject) {
        
        //        [self.listArr removeAllObjects];
        //
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        //        self.listArr = [SYJPlayerModel mj_objectArrayWithKeyValuesArray:dict];
        //        [self.tableView reloadData];
        
        NSArray *arr = [SYJPlayerDataModel mj_objectArrayWithKeyValuesArray:dict];
        
        SYJPlayerDataModel *model = arr.firstObject;
        
        st.text = [NSString stringWithFormat:@"st: %ld",model.st];
        fta.text = [NSString stringWithFormat:@"fta: %ld",model.fta];
        off.text = [NSString stringWithFormat:@"off: %ld",model.off];
        pt.text = [NSString stringWithFormat:@"bs: %ld",model.bs];
        min.text = [NSString stringWithFormat:@"min: %ld",model.min];
        fgm.text = [NSString stringWithFormat:@"fgm: %ld",model.fgm];
        to.text = [NSString stringWithFormat:@"to: %ld",model.to];
        deff.text = [NSString stringWithFormat:@"deff: %ld",model.deff];
        pts.text = [NSString stringWithFormat:@"pts: %ld",model.pts];
        tpa.text = [NSString stringWithFormat:@"tpa: %ld",model.tpa];
        ftm.text = [NSString stringWithFormat:@"ftm: %ld",model.ftm];
        fga.text = [NSString stringWithFormat:@"fga: %ld",model.fga];
        plusminus.text = [NSString stringWithFormat:@"plusminus: %ld",model.plusminus];
        ast.text = [NSString stringWithFormat:@"ast: %ld",model.ast];
        tpm.text = [NSString stringWithFormat:@"tpm: %ld",model.tpm];
        tol.text = [NSString stringWithFormat:@"tot: %ld",model.tot];
        
        [self.hud hideAnimated:YES];
        
    } failure:^(NSError *error) {
        
    }];
    
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
