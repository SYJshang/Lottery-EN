//
//  ITTieziDetailViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/12.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITTieziDetailViewController.h"
#import "ITTieZiHeaderView.h"
#import "CPCommentModel.h"
#import "CPCommentTableViewCell.h"
#import "CDCommentInputView.h"

@interface ITTieziDetailViewController ()<UITableViewDelegate, UITableViewDataSource, ITTieZiHeaderViewSetHeightDelegate, CDCommentInputViewDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) ITTieZiHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *comments;
@property (nonatomic, assign) BOOL isFavorite;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *favoriteBtn;
@property (nonatomic, weak) CDCommentInputView *commentInputVIew;
@end

@implementation ITTieziDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor grayColor] title:@"Detail" font:scaleWithSize(24)];
    
    [self createViews];
    [self createRightBtn];
    //    [self createRightBtn];
    // Do any additional setup after loading the view.
}
- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (NSMutableArray *)comments{
    if (!_comments) {
        _comments = [NSMutableArray array];
    }
    return _comments;
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)createViews {
    
    _isFavorite = NO;
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height - 80)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellStyleDefault;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [tableView registerClass:[CPCommentTableViewCell class] forCellReuseIdentifier:@"CPCommentTableViewCell"];
    
    ITTieZiHeaderView *headerView = [[ITTieZiHeaderView alloc]initWithFrame:CGRectMake(0, 0, screen_width, scaleWithSize(87))];
    headerView.delegate = self;
    self.tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentBtn setImage:[UIImage imageNamed:@"tieziComment"] forState:UIControlStateNormal];
    [commentBtn setTitleColor:Color(200, 199, 203, 1) forState:UIControlStateNormal];
    commentBtn.titleLabel.font = fontSize(scaleWithSize(15));
    [commentBtn addTarget:self action:@selector(commentClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:commentBtn];
//    self.commentBtn = commentBtn;
    
    UIButton *favoriteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [favoriteBtn setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
    [favoriteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    favoriteBtn.titleLabel.font = fontSize(scaleWithSize(14));
    [favoriteBtn addTarget:self action:@selector(praiseClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:favoriteBtn];
    self.favoriteBtn = favoriteBtn;
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = Color(200, 199, 204, 1);
    [bottomView addSubview:line];
    
    UIView *line2 = [[UIView alloc]init];
    line2.backgroundColor = Color(200, 199, 204, 1);
    [bottomView addSubview:line2];
    
    CDCommentInputView *commentInputVIew = [[CDCommentInputView alloc] initWithDelegate:self];
    [self.view addSubview:commentInputVIew];
    self.commentInputVIew = commentInputVIew;
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(screen_width, 48));
    }];
    
    CGFloat width = screen_width / 2;
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(width);
        make.bottom.mas_equalTo(0);
        //        make.height.mas_equalTo(scaleWithSize(15));
    }];
    
    [favoriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(width);
        make.bottom.mas_equalTo(0);
        //        make.height.mas_equalTo(scaleWithSize(15));
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(screen_width, 1));
    }];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(width);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(1);
    }];
    
}

- (void)createRightBtn {
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(0, 0, scaleWithSize(48),scaleWithSize(48));
    [collectBtn setImage:[UIImage imageNamed:@"tousu"] forState:UIControlStateNormal];
    [collectBtn addTarget:self action:@selector(tousuClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:collectBtn];
}

- (void)tousuClick{
    UIAlertAction *alert1 = [UIAlertAction actionWithTitle:@"Complain" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [SVProgressHUD showSuccessWithStatus:@"Complaints are successful and we will handle it within 24 hours！"];
    }];
    
    UIAlertAction *alert2 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [vc addAction:alert1];
    [vc addAction:alert2];
    [self presentViewController:vc animated:YES completion:nil];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Comment（%d）", _comments.count];
}


- (void)getInfo{
    NSString *url = [NSString stringWithFormat:@"https://www.h1055.com/ozsuser/getOneForum.htmls"];

    [[CPNetWorkRequest sharedClient]get:url parame:_dic success:^(id object) {
        if ([object[@"errorcode"] isEqualToString: @"0"]) {
            ITTieZiModel *model = [ITTieZiModel mj_objectWithKeyValues:object[@"result"]];
            self.headerView.imgPath = object[@"imgPath"];
            self.headerView.model = model;
            
            NSArray *arr = object[@"discuss"];
            NSMutableArray *arr1 = [NSMutableArray array];
            for (int i = 0; i < arr.count; i++) {
                CPCommentModel *CModel = [CPCommentModel mj_objectWithKeyValues:arr[i]];
                [arr1 addObject:CModel];
            }
            [self.comments addObjectsFromArray:arr1];
            [self.tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:object[@"error"]];
        }
    } failure:^(NSError *err) {
        
    }];
    
}

- (void)commentClick{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillChange:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
    [self.commentInputVIew.textView becomeFirstResponder];
    
}
- (void)textViewDidChange:(UITextView *)textView{
    self.commentInputVIew.placeHolderText = [textView.text isEqualToString:@""] ? @"say something" : @"";
}

- (void)keyboardWillChange: (NSNotification *)noti {
    
    NSDictionary *dict = noti.userInfo;
    NSLog(@"%@", dict);
    CGRect beginKeyboardFrame = [dict[UIKeyboardFrameBeginUserInfoKey]CGRectValue];
    CGRect KeyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat KeyboardY = KeyboardFrame.size.height;
    CGFloat y1 = beginKeyboardFrame.origin.y;
    CGFloat y2 = KeyboardFrame.origin.y;
    CGFloat duration = [dict[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    if (y1 < y2) {
        //获取动画时间
        //        CGFloat transY = self.tableView.contentSize.height - self.tableView.frame.size.height; //KeyboardY - self.tableView.contentSize.height;
        //动画
        [UIView animateWithDuration:duration animations:^{
            self.tableView.transform = CGAffineTransformMakeTranslation(0, 0);
            [self.tableView setContentOffset:CGPointMake(0, 0)];
            self.commentInputVIew.hidden = YES;
            //            [self.commentInputVIew mas_makeConstraints:^(MASConstraintMaker *make) {
            //                make.left.equalTo(@0);
            //                make.bottom.mas_equalTo(-KeyboardY);
            //                make.size.mas_equalTo(CGSizeMake(0, 0));
            //            }];
        }];
    }else{
        self.commentInputVIew.hidden = NO;
        //获取动画时间
        CGFloat transY = self.tableView.contentSize.height - self.tableView.frame.size.height; //KeyboardY - self.tableView.contentSize.height;
        //动画
        [UIView animateWithDuration:duration animations:^{
            self.tableView.transform = CGAffineTransformMakeTranslation(0, -KeyboardY - scaleWithSize(40));
            //            self.commentInputVIew.transform = CGAffineTransformMakeTranslation(0, -KeyboardY);
            [self.tableView setContentOffset:CGPointMake(0, transY)];
            [self.commentInputVIew mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@0);
                make.bottom.mas_equalTo(-KeyboardY);
                make.size.mas_equalTo(CGSizeMake(screen_width, scaleWithSize(40)));
            }];
        }];
    }
    
}

- (void)praiseClick {
    if (_isFavorite) {
        [_favoriteBtn setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"Success"];
        
    }else{
        [_favoriteBtn setImage:[UIImage imageNamed:@"praise_selected"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"Success"];
    }
    _isFavorite = !_isFavorite;
}

- (void)setContentHeight:(CGFloat)contenHeight{
    CGFloat height = scaleWithSize(87) + contenHeight;
    self.headerView.frame = CGRectMake(0, 0, screen_width, height);
    self.tableView.tableHeaderView = self.headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _comments.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"CPCommentTableViewCell" cacheByIndexPath:indexPath configuration:^(CPCommentTableViewCell *cell) {
        cell.model = _comments[indexPath.row];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPCommentTableViewCell *cell = [CPCommentTableViewCell cellWithTableView:tableView];
    cell.model = _comments[indexPath.row];
    return cell;
}

- (void)viewWillAppear:(BOOL)animated{
    [self getInfo];
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
