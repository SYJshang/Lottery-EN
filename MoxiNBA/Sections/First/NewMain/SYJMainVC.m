//
//  SYJMainVC.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/7/11.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJMainVC.h"
#import <SDCycleScrollView.h>
#import "UINavigationController+NavAlpha.h"
#import "SYJTableCollectionCell.h"
#import "ITNewsModel.h"
#import "ITNewsTableViewCell.h"
#import "ITNewsDetailViewController.h"
#import "LTLotteryInfoMode.h"
#import "LTLotteryManager.h"
#import "LTNumberPickingTableVC.h"



@interface SYJMainVC ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,SYJSelectDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property(nonatomic,strong) NSArray *lotteryOrder;



/**
 彩票名称数组
 */
@property (nonatomic, strong) NSMutableArray *lotListArr;

@property (nonatomic, strong) NSMutableArray *lunboArr;


@end

@implementation SYJMainVC

- (NSArray *)lotteryOrder{
    if (_lotteryOrder == nil) {
        _lotteryOrder = @[@"ssq",@"dlt",@"3d",@"pls",@"plw", @"qxc", @"qlc", @"qqs", @"anh"];
    }
    return _lotteryOrder;
}


- (NSMutableArray *)lunboArr{
    
    if (_lunboArr == nil) {
        _lunboArr = [NSMutableArray array];
    }
    
    return _lunboArr;
    
}


- (NSMutableArray *)lotListArr{
    
    if (_lotListArr == nil) {
        _lotListArr = [NSMutableArray array];
    }
    return _lotListArr;
}

-(void)getInfoData{
    
    NSArray *dataArr =  @[
                          @{
                              @"id": @"29",
                              @"title": @"600万男人在离婚后的2年后变得幻想破灭",
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
                              @"title": @"双色球5注一等奖900万奖金，6.54亿",
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
                              @"title": @"双色球4注一等奖1000万，奖金6.24亿",
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
                              @"title": @"双色球058：8注一等奖703万等奖7亿200万",
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
                              @"id": @"24",
                              @"title": @"里皮：U23足球协会的政策起到了一定作用，但利用了",
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
                              @"title": @"甘刚：以人民的名义弘扬彩票文化",
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
    self.lotListArr = [ITNewsModel mj_objectArrayWithKeyValuesArray:dataArr];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}



- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"大厅" font:17.0];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor lightGrayColor] title:@"" font:scaleWithSize(24)];
}


-(void)leftBtn{
    //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTableView];
    [self getHttpPic];
    [self getInfoData];

    
    // Do any additional setup after loading the view.
}

- (void)setTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 108) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.cycleScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(5, 5, KSceenW - 10, 190.0)];
    self.cycleScrollView.placeholderImage = [UIImage imageNamed:@"图片占位or加载"];
    self.cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    self.cycleScrollView.delegate = self;
    self.cycleScrollView.layer.masksToBounds = YES;
    self.cycleScrollView.layer.borderColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0].CGColor;
    self.cycleScrollView.layer.borderWidth = 2;
    self.cycleScrollView.layer.cornerRadius = 5;
    self.tableView.tableHeaderView = self.cycleScrollView;
    
    [self.tableView registerClass:[SYJTableCollectionCell class] forCellReuseIdentifier:@"cell"];
    
    
}



- (void)getHttpPic{
    
    
    [SYJHttpHelper GET:[NSString stringWithFormat:@"http://mapi.yjcp.com/center/homePageInfo"] parameters:nil success:^(id responseObject) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        //获取轮播图
        NSArray *arr = json[@"lunboList"];
        NSMutableArray *imgArr = [NSMutableArray array];
        if (!NULLArray(arr)) {
            for (int i = 0; i < arr.count; i ++) {
                NSString *imgUrl = arr[i][@"mapAddress"];
                [imgArr addObject:imgUrl];
                [self.lunboArr addObject:arr[i][@"linkAddress"]];
            }
        }
        self.cycleScrollView.imageURLStringsGroup = imgArr;
        
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];
    
}



#pragma mark - table view dataSource

- (void)index:(NSInteger)index{
    
    LTNumberPickingTableVC *vc = [LTNumberPickingTableVC new];
    NSString *key = self.lotteryOrder[index];
    LTLotteryInfoMode *model = [LTLotteryManager lotteryInfo][key];
    vc.lotteryInfo = model;
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return KSceenW + 45;
        
    }else{
        
        return 130;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return @"投注选号";
    }else{
        return @"热点推送";
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        
      return self.lotListArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SYJTableCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.delegate = self;
        return cell;
    }else{
        ITNewsTableViewCell *cell = [ITNewsTableViewCell cellWithTableView:tableView];
        ITNewsModel *model = self.lotListArr[indexPath.row];
        cell.model = model;
        return cell;
    }
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    if (indexPath.section == 1) {
        
        ITNewsDetailViewController *vc = [[ITNewsDetailViewController alloc]init];
        vc.model = self.lotListArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }

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
