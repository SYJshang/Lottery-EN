//
//  ITNewsDetailViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/4/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITNewsDetailViewController.h"
#import "CPNewsDetailHeaderView.h"
#import "CPCommentModel.h"
#import "CPCommentTableViewCell.h"
#import "CDCommentInputView.h"

@interface ITNewsDetailViewController () <UITableViewDelegate, UITableViewDataSource, CPNewsDetailContentHeightDelegate, CDCommentInputViewDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CPNewsDetailHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *commentArr;
@property (nonatomic, weak) CDCommentInputView *commentInputVIew;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *favoriteBtn;
@property (nonatomic, assign) BOOL isFavorite;

@end

@implementation ITNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
    [self addSubViews];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor lightGrayColor] title:@"详情" font:scaleWithSize(24)];
    
    [self addSubViews];
    
    //    [self createRightBtn];
    // Do any additional setup after loading the view.
}

- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (NSMutableArray *)commentArr{
    if (!_commentArr) {
        _commentArr = [NSMutableArray array];
    }
    return _commentArr;
}

-(void)addSubViews{
    _isFavorite = NO;
    
    //tablview
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height - 112)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    [_tableView registerClass:[CPCommentTableViewCell class] forCellReuseIdentifier:@"CPCommentTableViewCell"];
    tableView.fd_debugLogEnabled = YES;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [tableView registerClass:[CPCommentTableViewCell class] forCellReuseIdentifier:@"CPCommentTableViewCell"];
    
    CPNewsDetailHeaderView *headerView = [[CPNewsDetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, screen_width, scaleWithSize(270))];
    headerView.delegate = self;
    headerView.model = _model;
    _tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentBtn setImage:[UIImage imageNamed:@"tieziComment"] forState:UIControlStateNormal];
    [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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

- (void)sendButtonDidClick:(UIButton *)button{
    [self.commentInputVIew.textView resignFirstResponder];
    NSString *url = @"https://www.h1055.com/api/discuss.htmls";
    NSDictionary *dic = @{
                          @"id": _model.ID,
                          @"content": self.commentInputVIew.textView.text,
                          @"username": [[gobalConfig getInstance] userName]
                          };
    __weak typeof(self) weakSelf = self;
    [[CPNetWorkRequest sharedClient] get:url parame:dic success:^(id object) {
        if ([object[@"errorcode"] isEqualToString:@"0"]) {
            [SVProgressHUD showSuccessWithStatus:@"Release Successfully"];
            
            [weakSelf getComments];
        }
    } failure:^(NSError *err) {
        
    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self getComments];
}

- (void)getComments {
    NSString *url = [NSString stringWithFormat:@"https://www.h1055.com/%@", API_NEWSDETAIL_URL];
    NSDictionary *parame = @{
                             @"id": _model.ID
                             };
    __weak typeof(self) weakSelf = self;
    [[CPNetWorkRequest sharedClient]get:url parame:parame success:^(id object) {
        if (![[object objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
            NSString *errStr = [object objectForKey:@"msg"];
            [SVProgressHUD showErrorWithStatus:errStr];
            
        }else{
            NSArray *arr = object[@"discuss"];
            NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:arr.count];
            for (int i = 0; i < arr.count; i++) {
                CPCommentModel *model = [CPCommentModel mj_objectWithKeyValues:arr[i]];
                [arr1 addObject:model];
            }
            [weakSelf.commentArr addObjectsFromArray:arr1];
            [weakSelf.tableView reloadData];
        }
        
    } failure:^(NSError *err) {
        
    }];
}

- (void)praiseClick {
    if (_isFavorite) {
        [_favoriteBtn setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"Cancel Successfully"];
        
    }else{
        [_favoriteBtn setImage:[UIImage imageNamed:@"praise_selected"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"Success"];
    }
    _isFavorite = !_isFavorite;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Comment（%lu）", (unsigned long)_commentArr.count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //    return [tableView fd_heightForCellWithIdentifier:@"CPCommentTableViewCell" configuration:^(CPCommentTableViewCell *cell) {
    //        cell.model = _commentArr[indexPath.row];
    //    }];
    return [tableView fd_heightForCellWithIdentifier:@"CPCommentTableViewCell" cacheByIndexPath:indexPath configuration:^(CPCommentTableViewCell *cell) {
        cell.model = _commentArr[indexPath.row];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPCommentTableViewCell *cell = [CPCommentTableViewCell cellWithTableView:tableView];
    cell.model = _commentArr[indexPath.row];
    return cell;
}

#pragma mark 设置高度delegate
- (void)updateViewSize:(CGFloat)height{
    CGFloat headerViewHeight = height + scaleWithSize(270);//-72
    self.headerView.frame = CGRectMake(0, 0, SCREEN_SIZE.width, headerViewHeight);
    self.tableView.tableHeaderView = self.headerView;
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
