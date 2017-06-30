//
//  SYJSecondController.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJSecondController.h"
#import "ITNewsModel.h"
#import "ITBaoGaoViewCell.h"
#import "ITNewsTableViewCell.h"
#import "ITNewsDetailViewController.h"
#import "ITJiLuViewController.h"

@interface SYJSecondController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArr;

@end

@implementation SYJSecondController

- (NSMutableArray *)listArr{
    
    if (_listArr == nil) {
        _listArr = [NSMutableArray array];
    }
    
    return _listArr;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"论坛"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor grayColor] title:@"News" font:scaleWithSize(24)];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 108) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [SVProgressHUD showWithStatus:@"loading..."];
    //添加刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getInfoData];
    }];
    
    
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    
    // Do any additional setup after loading the view.
}

-(void)leftBtn{
    //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    [self.navigationController pushViewController:[ITJiLuViewController new] animated:YES];
}


-(void)getInfoData{
    
    NSArray *dataArr =  @[
                          @{
                              @"id": @"29",
                              @"title": @"The 6 million men immediately after the divorce 2 years later to become disillusioned",
                              @"content": @"But he is very negative, although it doesn't have to worry about food and clothing, but such a large villa only I live alone, I feel lonely now, only occasionally go to find the son, I do not know what time they will die, even now I will stand good, put all the property give my son died, now just want to live with my son back. But he is very negative, although it doesn't have to worry about food and clothing, but such a large villa only I live alone, I feel lonely now, only occasionally go to find the son, I do not know what time they will die, even now I will stand good, put all the property give my son died, now just want to live with my son back. \r\n\r\n Yong Yu think 3 days and 3 nights, see all of this, a decision from month 10 onwards, until his death, all their property, including land, houses, cars, cattle and other property will be sold, and the money as his son grew up on all major. \r\n\r\n this is the winning curse, 2013, Zhejiang 47 year old Xu Min (alias), spent 14 yuan alone to buy a few notes lottery, I did not expect 5 million. After winning the prize, he did not tell his wife. Then often access to a variety of high-end consumer sites, lavish. It was not until October 2013 when the wife suddenly found 2 million 100 thousand of her passbook at home that she knew the truth, and her disheartened wife filed for divorce. \r\n\r\n life is really change radically, logically speaking in the case of huge bonuses, the family should be able to live happily ever after, but never thought actually reduced to families. This is a sentence should be a dream of Red Mansions: hundred silver boxes, all person all the beggar slander. Just sigh, other people's life is not long, that know oneself return funeral!",
                              @"registertime": @"1496819344000",
                              @"status": @"2",
                              @"strTime": @"2017-06-07 15:09:04",
                              @"imageurl": @"https://www.h1055.com/app_image/1.jpg",
                              @"description": @"But he is very negative, although it doesn't have to worry about food and clothing, but such a large villa only I live alone, I feel lonely now, only occasionally go to find the son, I do not know what time they will die, even now I will stand good, put all the property give my son died, now just want to live with my son back. But he is very negative, although it doesn't have to worry about food and clothing, but such a large villa only I live alone, I feel lonely now, only occasionally go to find the son, I do not know what time they will die, even now I will stand good, put all the property give my son died, now just want to live with my son back. \r\n\r\n Yong Yu think 3 days and 3 nights, see all of this, a decision from month 10 onwards, until his death, all their property, including land, houses, cars, cattle and other property will be sold, and the money as his son grew up on all major. \r\n\r\n this is the winning curse, 2013, Zhejiang 47 year old Xu Min (alias), spent 14 yuan alone to buy a few notes lottery, I did not expect 5 million. After winning the prize, he did not tell his wife. Then often access to a variety of high-end consumer sites, lavish. It was not until October 2013 when the wife suddenly found 2 million 100 thousand of her passbook at home that she knew the truth, and her disheartened wife filed for divorce. \r\n\r\n life is really change radically, logically speaking in the case of huge bonuses, the family should be able to live happily ever after, but never thought actually reduced to families. This is a sentence should be a dream of Red Mansions: hundred silver boxes, all person all the beggar slander. Just sigh, other people's life is not long, that know oneself return funeral!",
                              @"url": @"https://www.h1055.com/folder/notice_detail.html",
                              @"author": @"",
                              @"source": @"",
                              @"commentCount": @"2"
                              },
                          @{
                              @"id": @"28",
                              @"title": @"Shuangseqiu 064: 5 note first prize 9 million prize 654 million",
                              @"content": @"In the news the evening of June 4th, China welfare lottery Shuangseqiu 2017064th lottery game. The current double ball red ball number is 02, 10, 16, 22, 24, 28, basketball number is 15. \r\n 5 note first prize 900 blossoms fall 4 \r\n current Shuangseqiu 5 note first prize, the single note bonus is 9 million yuan. The first prize of the 5 notes falls in 4 places. Among them, the Chongqing 2 note, Hebei 1 note, Guangdong 1 note, Sichuan 1 note, a total of 5 notes. \t\t\t\t\t\t\r\n two prize out 158 note, single note amount more than 150 thousand yuan. Among them, Inner Mongolia in the 26 note, ranking the first; Shandong, Guangxi in 15, ranked second; Sichuan in 12, ranking fourth in Henan; 11 note, ranking fifth; in addition, the two prize in other regions were lower than 11. When the final prize leaves more than 8 million 760 thousand notes. \r\n current red ball number size ratio is 3:3, three area ratio is 2:2:2; odd even ratio is 0:6. The red ball out of a set of even numbers 22, 24; an oblique block 24; two heavy number 16, 22; a separate code is out of 15 basketball 24. \r\n go 654 million yuan \r\n the current national sales volume is 351 million yuan. Guangdong (excluding Shenzhen) period Shuangseqiu sales of 32 million 210 thousand yuan, ranking first; Zhejiang to more than 28 million 390 thousand yuan in sales ranked second; Shandong ranked third with more than 20 million 290 thousand yuan to 20 million 240 thousand yuan; Jiangsu ranked fourth; Guangxi ranked fifth to 16 million 740 thousand yuan. \r\n prize, Shuangseqiu jackpot amount is 654 million yuan, the lottery friends will have the opportunity to get 10 million yuan in 2 yuan. (Zhu Zhu)",
                              @"registertime": @"1496713325000",
                              @"status": @"2",
                              @"strTime": @"2017-06-06 09:42:05",
                              @"imageurl": @"https://www.h1055.com/app_image/2.jpg",
                              @"description": @"In the news the evening of June 4th, China welfare lottery Shuangseqiu 2017064th lottery game. The current double ball red ball number is 02, 10, 16, 22, 24, 28, basketball number is 15. \r\n 5 note first prize 900 blossoms fall 4 \r\n current Shuangseqiu 5 note first prize, the single note bonus is 9 million yuan. The first prize of the 5 notes falls in 4 places. Among them, the Chongqing 2 note, Hebei 1 note, Guangdong 1 note, Sichuan 1 note, a total of 5 notes. \t\t\t\t\t\t\r\n two prize out 158 note, single note amount more than 150 thousand yuan. Among them, Inner Mongolia in the 26 note, ranking the first; Shandong, Guangxi in 15, ranked second; Sichuan in 12, ranking fourth in Henan; 11 note, ranking fifth; in addition, the two prize in other regions were lower than 11. When the final prize leaves more than 8 million 760 thousand notes. \r\n current red ball number size ratio is 3:3, three area ratio is 2:2:2; odd even ratio is 0:6. The red ball out of a set of even numbers 22, 24; an oblique block 24; two heavy number 16, 22; a separate code is out of 15 basketball 24. \r\n go 654 million yuan \r\n the current national sales volume is 351 million yuan. Guangdong (excluding Shenzhen) period Shuangseqiu sales of 32 million 210 thousand yuan, ranking first; Zhejiang to more than 28 million 390 thousand yuan in sales ranked second; Shandong ranked third with more than 20 million 290 thousand yuan to 20 million 240 thousand yuan; Jiangsu ranked fourth; Guangxi ranked fifth to 16 million 740 thousand yuan. \r\n prize, Shuangseqiu jackpot amount is 654 million yuan, the lottery friends will have the opportunity to get 10 million yuan in 2 yuan.",
                              @"url": @"https://www.h1055.com/folder/notice_detail.html",
                              @"author": @"",
                              @"source": @"",
                              @"commentCount": @"3"
                              },
                          @{
                              @"id": @"27",
                              @"title": @"Shuangseqiu 063: 4 note first prize 10 million prize 624 million",
                              @"content": @"In the news the evening of June 1st, China welfare lottery Shuangseqiu 2017063rd lottery game. The current double ball red ball number is 12, 16, 20, 22, 25, 31, basketball number is 04. \r\n 4 note first prize 1000 blossoms fall 3 \r\n current Shuangseqiu 4 note first prize, the single note bonus is 10 million yuan. The first prize of these 4 notes falls in 3 places, among them 1 Notes in Hebei, 2 Notes in Guangxi, 1 Notes in Sichuan, 4 notes in total. \r\n two prize out 246 note, single note amount more than 100 thousand yuan. Among them, Henan in the 100 note, ranking the first; Guangdong (excluding Shenzhen) in 89, ranking second in Jiangxi; 10, ranked third; Jiangsu and Fujian were 5 note, ranked fourth; two prize in other regions were 5 note the following. When the final prize leaves more than 6 million 360 thousand notes. \r\n current red ball number size ratio is 4:2, three area ratio is 0:4:2; odd even ratio is 2:4. The red ball out of two heavy, 22, 31; two, code 12, 20; a set of even numbers 20, 22; a slant even 25; a group with tail number 12, 22; basketball is out of 04. \r\n go 624 million yuan \r\n the current national sales volume is 307 million yuan. Guangdong (excluding Shenzhen) period Shuangseqiu sales of 27 million 650 thousand yuan, ranking first in Zhejiang, sales of more than 24 million 430 thousand yuan to 18 million 50 thousand yuan ranked second, Shandong ranked third, Jiangsu ranked fourth with 17 million 800 thousand yuan to more than 14 million 830 thousand yuan in Guangxi, ranked fifth. \r\n prize, Shuangseqiu jackpot amount is 624 million yuan, the lottery friends will have the opportunity to get 10 million yuan in 2 yuan. (Huang Man)",
                              @"registertime": @"1496373000000",
                              @"status": @"2",
                              @"strTime": @"2017-06-02 11:10:00",
                              @"imageurl": @"https://www.h1055.com/app_image/3.jpg",
                              @"description": @"In the news the evening of June 1st, China welfare lottery Shuangseqiu 2017063rd lottery game. The current double ball red ball number is 12, 16, 20, 22, 25, 31, basketball number is 04. \r\n 4 note first prize 1000 blossoms fall 3 \r\n current Shuangseqiu 4 note first prize, the single note bonus is 10 million yuan. The first prize of these 4 notes falls in 3 places, among them 1 Notes in Hebei, 2 Notes in Guangxi, 1 Notes in Sichuan, 4 notes in total. \r\n two prize out 246 note, single note amount more than 100 thousand yuan. Among them, Henan in the 100 note, ranking the first; Guangdong (excluding Shenzhen) in 89, ranking second in Jiangxi; 10, ranked third; Jiangsu and Fujian were 5 note, ranked fourth; two prize in other regions were 5 note the following. When the final prize leaves more than 6 million 360 thousand notes. \r\n current red ball number size ratio is 4:2, three area ratio is 0:4:2; odd even ratio is 2:4. The red ball out of two heavy, 22, 31; two, code 12, 20; a set of even numbers 20, 22; a slant even 25; a group with tail number 12, 22; basketball is out of 04. \r\n go 624 million yuan \r\n the current national sales volume is 307 million yuan. Guangdong (excluding Shenzhen) period Shuangseqiu sales of 27 million 650 thousand yuan, ranking first in Zhejiang, sales of more than 24 million 430 thousand yuan to 18 million 50 thousand yuan ranked second, Shandong ranked third, Jiangsu ranked fourth with 17 million 800 thousand yuan to more than 14 million 830 thousand yuan in Guangxi, ranked fifth. \r\n prize, Shuangseqiu jackpot amount is 624 million yuan, the lottery friends will have the opportunity to get 10 million yuan in 2 yuan. (Huang Man)",
                              @"url": @"https://www.h1055.com/folder/notice_detail.html",
                              @"author": @"",
                              @"source": @"",
                              @"commentCount": @""
                              },
                          @{
                              @"id": @"26",
                              @"title": @"Shuangseqiu 058: 8 note first prize 7 million 30 thousand prize 702 million",
                              @"content": @"In the news the evening of May 21st, China welfare lottery Shuangseqiu 2017058th lottery game. The current double ball red ball number is 01, 09, 13, 22, 28, 32, basketball number is 11. \r\n 8 note first prize 703 blossoms fall 8 \r\n current Shuangseqiu 8 note first prize, the single note bonus is more than 7 million 30 thousand yuan. The first prize of the 8 notes falls in 8 places. Among them, Shanxi 1 note, Zhejiang 1 note, Anhui 1 note, Hubei 1 note, Hunan 1 note, Sichuan 1 note, Shaanxi 1 note, Shenzhen 1 notes, a total of 8 notes. \r\n two prize out 111 note, single note amount more than 180 thousand yuan. Among them, Zhejiang in the 13 note, ranking the first; Guangdong (excluding Shenzhen) in 12, ranking second in Hunan; 10, ranked third; Hebei and Jiangsu were 7 note, ranked fourth; in addition, the two prize in other regions were lower than 7. When the final prize leaves more than 11 million 20 thousand notes. \r\n current red ball number size ratio is 3:3, three area ratio is 2:2:2; odd even ratio is 3:3. The red ball out of a group with tail number 22, 32; two oblique numbers 22, 32; a heavy 22; two, 13 yards across the 28 basketball is out of 11. \r\n go 702 million yuan \r\n the current national sales volume is 338 million yuan. Guangdong (excluding Shenzhen) period Shuangseqiu sales of 31 million 820 thousand yuan, ranking first in Zhejiang; 27 million 450 thousand yuan sales ranked second; Shandong ranked third to 19 million 810 thousand yuan to 19 million 460 thousand yuan; Jiangsu ranked fourth; Guangxi ranked fifth to 15 million 570 thousand yuan. \r\n prize, Shuangseqiu jackpot amount is 702 million yuan, the lottery friends will have the opportunity to get 10 million yuan in 2 yuan. (Huang Man)",
                              @"registertime": @"1495415336000",
                              @"status": @"2",
                              @"strTime": @"2017-05-22 09:08:56",
                              @"imageurl": @"https://www.h1055.com/app_image/4.jpg",
                              @"description": @"In the news the evening of May 21st, China welfare lottery Shuangseqiu 2017058th lottery game. The current double ball red ball number is 01, 09, 13, 22, 28, 32, basketball number is 11. \r\n 8 note first prize 703 blossoms fall 8 \r\n current Shuangseqiu 8 note first prize, the single note bonus is more than 7 million 30 thousand yuan. The first prize of the 8 notes falls in 8 places. Among them, Shanxi 1 note, Zhejiang 1 note, Anhui 1 note, Hubei 1 note, Hunan 1 note, Sichuan 1 note, Shaanxi 1 note, Shenzhen 1 notes, a total of 8 notes. \r\n two prize out 111 note, single note amount more than 180 thousand yuan. Among them, Zhejiang in the 13 note, ranking the first; Guangdong (excluding Shenzhen) in 12, ranking second in Hunan; 10, ranked third; Hebei and Jiangsu were 7 note, ranked fourth; in addition, the two prize in other regions were lower than 7. When the final prize leaves more than 11 million 20 thousand notes. \r\n current red ball number size ratio is 3:3, three area ratio is 2:2:2; odd even ratio is 3:3. The red ball out of a group with tail number 22, 32; two oblique numbers 22, 32; a heavy 22; two, 13 yards across the 28 basketball is out of 11. \r\n go 702 million yuan \r\n the current national sales volume is 338 million yuan. Guangdong (excluding Shenzhen) period Shuangseqiu sales of 31 million 820 thousand yuan, ranking first in Zhejiang; 27 million 450 thousand yuan sales ranked second; Shandong ranked third to 19 million 810 thousand yuan to 19 million 460 thousand yuan; Jiangsu ranked fourth; Guangxi ranked fifth to 15 million 570 thousand yuan. \r\n prize, Shuangseqiu jackpot amount is 702 million yuan, the lottery friends will have the opportunity to get 10 million yuan in 2 yuan. (Huang Man)",
                              @"url": @"https://www.h1055.com/folder/notice_detail.html",
                              @"author": @"",
                              @"source": @"",
                              @"commentCount": @"8"
                              },
                          @{
                              @"id": @"25",
                              @"title": @"Huizhou 57 million 180 thousand winning sites send more than 300 note lottery",
                              @"content": @"“Come and see have, to have joy!” In 57 million 180 thousand, multiple jackpot betting boss smiling, holding a bunch of \r\n is good to distribute packet lottery sites with gladness of nearby residents and the lottery. \r\n good news came too suddenly \r\n5718 million super jackpot breaking nearly half of the Huizhou City, the color of silence, let the Huizhou lottery jackpot was surprised, even a little ignorant! At the moment, the big news quickly spread through Huizhou's streets and lanes. \r\n5 on the evening of 14, welfare lottery 2017055th lottery, the current lottery number for red balls 07, 12, 13, 20, 24, 31, basketball number 05. A total of 20 prizes were awarded, 13 notes from Guangdong and 5 million 710 thousand yuan per note. Among them, the Huizhou lottery to a 1 note 10 yuan 20 times since the vote in 10 note first prize, the total prize money of 57 million 180 thousand yuan, this is the history of Huizhou welfare lottery leaflets the highest amount of the grand prize, the total prize money exceeded the amount of prize in 2014 to create 41 million 940 thousand yuan in Huizhou lottery lottery record sheet, but also become the in 2017 the Guangdong Provincial Welfare Lottery fourteenth more than ten million yuan prize winner. To celebrate the site really awesome \r\n5718 million lottery ticket from Huizhou District of Huicheng City Long Feng sand lane two No. 44080742 betting station sold. In May 16th, Huizhou welfare lottery center staff with the Huizhou City three mainstream media to lottery betting station interview, betting numbers hanging in the award banner before the site is particularly conspicuous, luoguxuantian, betting station door has filled the crowd of pedestrians and nearby residents watched the Lion Dance Awards the joy of sharing side bets station, station is stocked with sugar and peanut fruit and other food, betting station owner also prepared more than 300 red envelopes filled with lottery sent to residents of the scene. The boss Zhang Suilian Perry is side happy to say, hope everybody to joy, a lottery ticket has unlimited potential and hope that more people who are winning better, winning I happy. Zhang Suilian also said that in the betting station after about 50000000 yuan of huge awards, the people came to buy lottery obvious increase, many people who buy lottery said, “this betting station Feng Shui is good."". \r\n winners don't guess, “\r\n,” it's hard to guess! When smallpox 20 yuan, 10 times to throw a lot of, in fact, usually in my this way to buy double ball lottery lottery really many, the most have dozen 50 times. Near the site of my site is considered better in this area, the living conditions of tenants is relatively superior. The lottery group is still relatively fixed, in addition to neighborhood residents, there will be some old lottery came over to buy, in addition, there are shops around and work units of the lottery, the lottery betting, this way is not a two, so I guess the winner who is?" "The night is my husband in the lottery betting station stalls, awards out after the husband phoned me to say that I know is 10:30 in the Evening News Awards out of their site, that evening, I am pleased to have a good night sleep.” Zhang Suilian said that although not their own awards, but their heartfelt for the lottery happy. \r\n lucky has been in \r\n, according to the owners Zhang Suilian introduced, 10 years ago, she was laid off from DESAY electronics factory in Huizhou, did not find a fixed job for a while, when he came to a welfare betting station as a salesman. It is this short months of welfare lottery sales experience, let her to the welfare lottery industry prospects are full of confidence, but also let her germination of their own home betting station, as a lifelong career idea. “In April 1, 2007, I applied for the No. 44080742 city landscape station officially opened in 2015, because of rent due to relocation to this address, but the old two addresses separated by only hundred meters, so the old customers have been. 10 betting business has never been interrupted, large and small award is not broken, only Shuangseqiu two prize for five or six times, the amount won 200 thousand yuan 280 thousand yuan 390 thousand yuan, and relocated to the new site, also in a 17 yuan, also in 150 thousand, scratch yuan award.” Zhang Suilian is talking to familiar history winning betting station. “The betting station once again opened the grand prize, I feel that they can engage in this occupation very lucky, but fortunately my site for 10 years with awards, I hope in the future be able to bring more and more people around the blessing of good luck!”. \r\n owners have the words to the winners said in an interview with \r\n Zhang Suilian also sent a deep on the winner of this award lottery blessing, “mother's Day is just a winner, I believe is a loving kindness, hope that more and more of his good fortune and luck! In addition, to have millions of awards is not easy, I hope as soon as possible winners of the Huizhou welfare lottery center duijiang.” \r\n, the devoted boss, built a WeChat group for the service lottery. After the huge award broke out, Zhang Suilian's name of the WeChat group became vigorous - fifty-seven million landscape stations. The group has sent a message from time to time required to buy lottery lottery, Zhang Suilian also constantly issued the award information in the group, she hopes to spread through a variety of effective ways, in the huge prize remind lottery timely awarding.",
                              @"registertime": @"1495164729000",
                              @"status": @"2",
                              @"strTime": @"2017-05-19 11:32:09",
                              @"imageurl": @"https://www.h1055.com/app_image/5.jpg",
                              @"description": @"“Come and see have, to have joy!” In 57 million 180 thousand, multiple jackpot betting boss smiling, holding a bunch of \r\n is good to distribute packet lottery sites with gladness of nearby residents and the lottery. \r\n good news came too suddenly \r\n5718 million super jackpot breaking nearly half of the Huizhou City, the color of silence, let the Huizhou lottery jackpot was surprised, even a little ignorant! At the moment, the big news quickly spread through Huizhou's streets and lanes. \r\n5 on the evening of 14, welfare lottery 2017055th lottery, the current lottery number for red balls 07, 12, 13, 20, 24, 31, basketball number 05. A total of 20 prizes were awarded, 13 notes from Guangdong and 5 million 710 thousand yuan per note. Among them, the Huizhou lottery to a 1 note 10 yuan 20 times since the vote in 10 note first prize, the total prize money of 57 million 180 thousand yuan, this is the history of Huizhou welfare lottery leaflets the highest amount of the grand prize, the total prize money exceeded the amount of prize in 2014 to create 41 million 940 thousand yuan in Huizhou lottery lottery record sheet, but also become the in 2017 the Guangdong Provincial Welfare Lottery fourteenth more than ten million yuan prize winner. To celebrate the site really awesome \r\n5718 million lottery ticket from Huizhou District of Huicheng City Long Feng sand lane two No. 44080742 betting station sold. In May 16th, Huizhou welfare lottery center staff with the Huizhou City three mainstream media to lottery betting station interview, betting numbers hanging in the award banner before the site is particularly conspicuous, luoguxuantian, betting station door has filled the crowd of pedestrians and nearby residents watched the Lion Dance Awards the joy of sharing side bets station, station is stocked with sugar and peanut fruit and other food, betting station owner also prepared more than 300 red envelopes filled with lottery sent to residents of the scene. The boss Zhang Suilian Perry is side happy to say, hope everybody to joy, a lottery ticket has unlimited potential and hope that more people who are winning better, winning I happy. Zhang Suilian also said that in the betting station after about 50000000 yuan of huge awards, the people came to buy lottery obvious increase, many people who buy lottery said, “this betting station Feng Shui is good."". \r\n winners don't guess, “\r\n,” it's hard to guess! When smallpox 20 yuan, 10 times to throw a lot of, in fact, usually in my this way to buy double ball lottery lottery really many, the most have dozen 50 times. Near the site of my site is considered better in this area, the living conditions of tenants is relatively superior. The lottery group is still relatively fixed, in addition to neighborhood residents, there will be some old lottery came over to buy, in addition, there are shops around and work units of the lottery, the lottery betting, this way is not a two, so I guess the winner who is?""The night is my husband in the lottery betting station stalls, awards out after the husband phoned me to say that I know is 10:30 in the Evening News Awards out of their site, that evening, I am pleased to have a good night sleep.” Zhang Suilian said that although not their own awards, but their heartfelt for the lottery happy. \r\n lucky has been in \r\n, according to the owners Zhang Suilian introduced, 10 years ago, she was laid off from DESAY electronics factory in Huizhou, did not find a fixed job for a while, when he came to a welfare betting station as a salesman. It is this short months of welfare lottery sales experience, let her to the welfare lottery industry prospects are full of confidence, but also let her germination of their own home betting station, as a lifelong career idea. “In April 1, 2007, I applied for the No. 44080742 city landscape station officially opened in 2015, because of rent due to relocation to this address, but the old two addresses separated by only hundred meters, so the old customers have been. 10 betting business has never been interrupted, large and small award is not broken, only Shuangseqiu two prize for five or six times, the amount won 200 thousand yuan 280 thousand yuan 390 thousand yuan, and relocated to the new site, also in a 17 yuan, also in 150 thousand, scratch yuan award.” Zhang Suilian is talking to familiar history winning betting station. “The betting station once again opened the grand prize, I feel that they can engage in this occupation very lucky, but fortunately my site for 10 years with awards, I hope in the future be able to bring more and more people around the blessing of good luck!”. \r\n owners have the words to the winners said in an interview with \r\n Zhang Suilian also sent a deep on the winner of this award lottery blessing, “mother's Day is just a winner, I believe is a loving kindness, hope that more and more of his good fortune and luck! In addition, to have millions of awards is not easy, I hope as soon as possible winners of the Huizhou welfare lottery center duijiang.” \r\n, the devoted boss, built a WeChat group for the service lottery. After the huge award broke out, Zhang Suilian's name of the WeChat group became vigorous - fifty-seven million landscape stations. The group has sent a message from time to time required to buy lottery lottery, Zhang Suilian also constantly issued the award information in the group, she hopes to spread through a variety of effective ways, in the huge prize remind lottery timely awarding.",
                              @"url": @"https://www.h1055.com/folder/notice_detail.html",
                              @"author": @"",
                              @"source": @"",
                              @"commentCount": @"10"
                              },
                          @{
                              @"id": @"24",
                              @"title": @"Lippi: U23 policy of the football association has played a role, but was taken advantage of",
                              @"content": @"Beijing on May 16th news, the latest issue of ‘Night Football’ broadcast interview with Chinese national team coach Lippi, Lippi talked about the establishment of the national team two players on the U23's original intention, policy, directed at some club 10 minutes or up to 15 minutes to change the U23 player, and the Football Association rules the shuaxinyan. \r\n\r\n Lippi first talked about the expansion of the world cup topic, ‘on the one hand, more teams to participate in the world cup, in the sense that this is a positive, but I personally, to maintain the status quo is a better way for me.’ \r\n\r\n in answer to a reporter's two team established a person's thoughts or the soccer association to ask questions, Lippi said: ‘3, 4 years ago China Little League, players aged 20 or 21 years old appearance, so U20 U21, the national team is difficult, because these young players have no first-team experience. This is a trend of football culture and talent mining, so Chinese players are not mature at the age of 19 or 20, but mature at 22, 23 or even 24 years old. Compared with other countries, this is a bit late. And I want to make is that there are a lot of 22, 23 or 24 years old players experienced team, perhaps there are older, their position is the most difficult, because (League) these positions are foreign aid. \r\n\r\n ’move into these players, that they have the opportunity to rotate some of the main, also let them adapt to the call of the national team, for the first time, second enlisted some tension and fear, when they learned about the national team, familiar with the national team training and coach, after two times, three times, four times the spirit, can adapt to the national team, and then got called, would not have difficulty adapting to. That's the purpose of bringing these players together these days.‘\r\n\r\n in the view of Lippi, the young players in the league's participation rate has been much higher than he coached Guangzhou Evergrande Football Association period, the new policy in the growth of young players U23 players has played a positive role, but some clubs have emerged of the policies, under the measures to cope with the attitude. The participation of \r\n\r\n ’this year the young players are considerably higher than the past, even if the U23 policy is also have a positive effect, but the disadvantage is that a lot of teams for 10 minutes or up to 15 minutes to change the player U23, put on another player, the instructions and regulations shuaxinyan, rather than respect this provision. You can change it, you have to replace another U23 player with an U23 player, so that you can make sure the regulation works. Change the U23 player with the U23 player so that you can avoid the rules.’\r\n\r\n ‘if a coach opening soon to U23 players for a change, may be the original is the first or the main players, that information is passed to the U23 player, the coach has no confidence in them, they have no confidence in the coach, the players are confident?’ \r\n[SMG football betting] [buy] [not participate in competitive account? Register right now",
                              @"registertime": @"1494985140000",
                              @"status": @"2",
                              @"strTime": @"2017-05-17 09:39:00",
                              @"imageurl": @"https://www.h1055.com/app_image/6.jpg",
                              @"description": @"Beijing on May 16th news, the latest issue of \"Night Football\" broadcast interview with Chinese national team coach Lippi, Lippi talked about the establishment of the national team two players on the U23's original intention, policy, directed at some club 10 minutes or up to 15 minutes to change the U23 player, and the Football Association rules the shuaxinyan. \r\n\r\n Lippi first talked about the expansion of the world cup topic, \"on the one hand, more teams to participate in the world cup, in the sense that this is a positive, but I personally, to maintain the status quo is a better way for me.\" \r\n\r\n in answer to a reporter's two team established a person's thoughts or the soccer association to ask questions, Lippi said: \"3, 4 years ago China Little League, players aged 20 or 21 years old appearance, so U20 U21, the national team is difficult, because these young players have no first-team experience. This is a trend of football culture and talent mining, so Chinese players are not mature at the age of 19 or 20, but mature at 22, 23 or even 24 years old. Compared with other countries, this is a bit late. And I want to make is that there are a lot of 22, 23 or 24 years old players experienced team, perhaps there are older, their position is the most difficult, because (League) these positions are foreign aid. \r\n\r\n \"move into these players, that they have the opportunity to rotate some of the main, also let them adapt to the call of the national team, for the first time, second enlisted some tension and fear, when they learned about the national team, familiar with the national team training and coach, after two times, three times, four times the spirit, can adapt to the national team, and then got called, would not have difficulty adapting to. That's the purpose of bringing these players together these days.\" \r\n\r\n in the view of Lippi, the young players in the league's participation rate has been much higher than he coached Guangzhou Evergrande Football Association period, the new policy in the growth of young players U23 players has played a positive role, but some clubs have emerged of the policies, under the measures to cope with the attitude. The participation of \r\n\r\n \"this year the young players are considerably higher than the past, even if the U23 policy is also have a positive effect, but the disadvantage is that a lot of teams for 10 minutes or up to 15 minutes to change the player U23, put on another player, the instructions and regulations shuaxinyan, rather than respect this provision. You can change it, you have to replace another U23 player with an U23 player, so that you can make sure the regulation works. Change the U23 player with the U23 player so that you can avoid the rules.\" \r\n\r\n \"if a coach opening soon to U23 players for a change, may be the original is the first or the main players, that information is passed to the U23 player, the coach has no confidence in them, they have no confidence in the coach, the players are confident?\" \r\n[SMG football betting] [buy] [not participate in competitive account? Register right now",
                              @"url": @"https://www.h1055.com/folder/notice_detail.html",
                              @"author": @"",
                              @"source": @"",
                              @"commentCount": @"1"
                              },
                          @{
                              @"id": @"22",
                              @"title": @"Gan Gang: to carry forward the lottery culture, in the name of the people",
                              @"content": @"May 14th, the \"double chromosphere\" lottery scene ushered in Jiangxi and Heilongjiang \"approached the double chromosphere\" delegation visit. They will be on this special night, zero contact with the chromosphere, and witnessed the birth of the grand prize of the whole process. \r\n it is understood that Jiangxi \"approaching the double chromosphere\" delegation consists of 40 people. Unlike in the past, the Jiangxi \"approach to the double chromosphere\" member of the delegation is really big, they are all important leaders from Jiangxi province around the city civil affairs bureau. This time, they represent not only themselves, but also the representatives of Jiangxi welfare lottery, and they represent the name of the people\".",
                              @"registertime": @"1494814250000",
                              @"status": @"2",
                              @"strTime": @"2017-05-15 10:10:50",
                              @"imageurl": @"https://www.h1055.com/app_image/7.jpg",
                              @"description": @"May 14th, the \"double chromosphere\" lottery scene ushered in Jiangxi and Heilongjiang \"approached the double chromosphere\" delegation visit. They will be on this special night, zero contact with the chromosphere, and witnessed the birth of the grand prize of the whole process. \r\n it is understood that Jiangxi \"approaching the double chromosphere\" delegation consists of 40 people. Unlike in the past, the Jiangxi \"approach to the double chromosphere\" member of the delegation is really big, they are all important leaders from Jiangxi province around the city civil affairs bureau. This time, they represent not only themselves, but also the representatives of Jiangxi welfare lottery, and they represent the name of the people\".",
                              @"url": @"https://www.h1055.com/folder/notice_detail.html",
                              @"author": @"",
                              @"source": @"",
                              @"commentCount": @""
                              }
                          ];
    
    [self.tableView.mj_header endRefreshing];
//    NSArray *arr = dataArr;
//    NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:arr.count];
//    for (int i = 0; i < arr.count; i++) {
//        ITNewsModel *model = [ITNewsModel mj_objectWithKeyValues:arr[i]];
//        [arr1 addObject:model];
//    }
    [SVProgressHUD dismiss];
    self.listArr = [ITNewsModel mj_objectArrayWithKeyValuesArray:dataArr];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 130;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        ITNewsTableViewCell *cell = [ITNewsTableViewCell cellWithTableView:tableView];
        if (!NULLArray(self.listArr)) {
            cell.model = self.listArr[indexPath.row];
     
        }
        cell.backgroundColor = [UIColor clearColor];
        return cell;

    
    //    static NSString *cellIdentifier = @"MTCell";
    //
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //
    //    if(cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    //    }
    //
    //    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row];
    //
    //    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ITNewsDetailViewController *vc = [[ITNewsDetailViewController alloc]init];
    vc.model = self.listArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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
