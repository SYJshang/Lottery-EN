//
//  LTLotteryManager.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/27.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryManager.h"
#import "LTLotteryInfoMode.h"

@implementation LTLotteryManager

+ (NSDictionary<NSString *,LTLotteryInfoMode *> *)lotteryInfo{
    static NSDictionary *dict = nil;
    if (!dict) {
#pragma mark - 彩票规则
#pragma mark 七乐彩
        NSDictionary *lotteryInfo = @{@"qlc":@{@"title":@"七乐彩",
                                               @"subTitle":@"七乐彩，其乐来",
                                               @"iconName":@"icon_qlclogo",
                                               @"blueNum":@1,
                                               @"rule":@[@{
                                                             @"type": @"play",
                                                             @"name": @"七乐彩",
                                                             @"set": @[
                                                                     @{@"title": @"至少选7个号码",
                                                                       @"member": @{@"start":@1,
                                                                                    @"end":@30},
                                                                       @"minNum":@7,
                                                                       @"bgColor":@0xff0000
                                                                       }
                                                                     ]
                                                             }]
                                               },
#pragma mark 双色球
                                      @"ssq":@{@"title":@"双色球",
                                               @"subTitle":@"每周二、四、日开奖",
                                               @"iconName":@"icon_ssqlogo",
                                               @"blueNum":@1,
                                               @"rule":@[@{
                                                             @"type": @"play",
                                                             @"name": @"双色球",
                                                             @"set": @[
                                                                     @{@"title": @"至少选6个红球",
                                                                       @"member": @{@"start":@1,
                                                                                    @"end":@33},
                                                                       @"minNum":@6,
                                                                       @"bgColor":@0xff0000
                                                                       },
                                                                     @{@"title": @"至少选1个蓝球",
                                                                       @"member": @{@"start":@1,
                                                                                    @"end":@16},
                                                                       @"minNum":@1,
                                                                       @"bgColor":@0x0000ff
                                                                       },
                                                                     ]
                                                             }]
                                               },
#pragma mark 大乐透
                                      @"dlt":@{@"title":@"大乐透",
                                               @"subTitle":@"每周一、三、六开奖",
                                               @"iconName":@"icon_dltlogo",
                                               @"blueNum":@2,
                                               @"rule":@[@{
                                                             @"type": @"play",
                                                             @"name": @"大乐透",
                                                             @"set": @[
                                                                     @{@"title": @"至少选5个红球",
                                                                       @"member": @{@"start":@1,
                                                                                    @"end":@35},
                                                                       @"minNum":@5,
                                                                       @"bgColor":@0xff0000
                                                                       },
                                                                     @{@"title": @"至少选2个蓝球",
                                                                       @"member": @{@"start":@1,
                                                                                    @"end":@12},
                                                                       @"minNum":@2,
                                                                       @"bgColor":@0x0000ff
                                                                       }
                                                                     ]
                                                             }]
                                               },
#pragma mark 3D试机号
                                      @"3ds":@{@"title":@"3D试机号",
                                               @"subTitle":@"七乐彩，其乐来",
                                               @"iconName":@"icon_fc3Dlogo"},
#pragma mark 福彩3D
                                      @"3d":@{@"title":@"福彩3D",
                                              @"subTitle":@"每天21：15开奖",
                                              @"iconName":@"icon_fc3Dlogo",
                                              @"rule":@[@{@"type": @"play",
                                                          @"name": @"直选",
                                                          @"set": @[
                                                                  @{@"title": @"百位",
                                                                    @"member": @{@"start":@0,
                                                                                 @"end":@9},
                                                                    @"minNum":@1,
                                                                    @"bgColor":@0xff0000
                                                                    },
                                                                  @{@"title": @"十位",
                                                                    @"member": @{@"start":@0,
                                                                                 @"end":@9},
                                                                    @"minNum":@1,
                                                                    @"bgColor":@0xff0000
                                                                    },
                                                                  @{@"title": @"个位",
                                                                    @"member": @{@"start":@0,
                                                                                 @"end":@9},
                                                                    @"minNum":@1,
                                                                    @"bgColor":@0xff0000
                                                                    }
                                                                  ]
                                                          },
                                                        @{@"type": @"play",
                                                          @"name": @"组选三",
                                                          @"set": @[
                                                                  @{@"title": @"选2个球",
                                                                    @"member": @{@"start":@0,
                                                                                 @"end":@9},
                                                                    @"minNum":@2,
                                                                    @"bgColor":@0xff0000
                                                                    }
                                                                  ]
                                                          },
                                                        @{@"type": @"play",
                                                          @"name": @"组选六",
                                                          @"set": @[
                                                                  @{@"title": @"至少选3个球",
                                                                    @"member": @{@"start":@0,
                                                                                 @"end":@9},
                                                                    @"minNum":@3,
                                                                    @"bgColor":@0xff0000
                                                                    }
                                                                  ]
                                                          }
                                                        ],
                                              },
                                      
#pragma mark 排列三
                                      @"pls":@{@"title":@"排列三",
                                               @"subTitle":@"天天排列三\n不用愁吃穿",
                                               @"iconName":@"icon_pl3logo",
                                               @"rule":@[@{@"type": @"play",
                                                           @"name": @"直选",
                                                           @"set": @[
                                                                   @{@"title": @"百位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"十位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"个位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     }
                                                                   ]
                                                           },
                                                         @{@"type": @"play",
                                                           @"name": @"组选三",
                                                           @"set": @[
                                                                   @{@"title": @"选2个球",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@2,
                                                                     @"bgColor":@0xff0000
                                                                     }
                                                                   ]
                                                           },
                                                         @{@"type": @"play",
                                                           @"name": @"组选六",
                                                           @"set": @[
                                                                   @{@"title": @"至少选3个球",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@3,
                                                                     @"bgColor":@0xff0000
                                                                     }
                                                                   ]
                                                           }
                                                         ],
                                               },
#pragma mark 排列五
                                      @"plw":@{@"title":@"排列五",
                                               @"subTitle":@"数字彩，天天开",
                                               @"iconName":@"icon_pl5logo",
                                               @"rule":@[@{@"type": @"play",
                                                           @"name": @"排列五",
                                                           @"set": @[
                                                                   @{@"title": @"万位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"千位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"百位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"十位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"个位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     }
                                                                   ]
                                                           }]
                                               },
#pragma mark 七星彩
                                      @"qxc":@{@"title":@"七星彩",
                                               @"subTitle":@"每周二、五、日开奖",
                                               @"iconName":@"icon_qxclogo",
                                               @"rule":@[@{@"type": @"play",
                                                           @"name": @"七星彩",
                                                           @"set": @[
                                                                   @{@"title": @"百万位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"十万位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"万位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"千位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"百位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"十位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     },
                                                                   @{@"title": @"个位",
                                                                     @"member": @{@"start":@0,
                                                                                  @"end":@9},
                                                                     @"minNum":@1,
                                                                     @"bgColor":@0xff0000
                                                                     }
                                                                   ]
                                                           }]},
#pragma mark 重庆时时彩
                                      @"qqs":@{@"title":@"重庆时时彩",
                                               @"subTitle":@"10分钟一期",
                                               @"iconName":@"icon_ssclogo",
                                               @"rule":@[
                                                       @{@"type": @"grounp",
                                                         @"name": @"五星",
                                                         @"grounp":@[
                                                                 @{@"type": @"play",
                                                                   @"name": @"直选",
                                                                   @"set": @[
                                                                           @{@"title": @"万位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"千位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"百位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"十位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"个位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             }
                                                                           ]
                                                                   },
                                                                 @{@"type": @"play",
                                                                   @"name": @"通选",
                                                                   @"set": @[
                                                                           @{@"title": @"万位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"千位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"百位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"十位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             },
                                                                           @{@"title": @"个位",
                                                                             @"member": @{@"start":@0,
                                                                                          @"end":@9},
                                                                             @"minNum":@1,
                                                                             @"bgColor":@0xff0000
                                                                             }
                                                                           ]
                                                                   }]},
                                                       @{@"type": @"grounp",
                                                         @"name": @"三星",
                                                         @"grounp":@[@{@"type": @"play",
                                                                       @"name": @"直选",
                                                                       @"set": @[
                                                                               @{@"title": @"百位",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 },
                                                                               @{@"title": @"十位",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 },
                                                                               @{@"title": @"个位",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]
                                                                       },
                                                                     @{@"type": @"play",
                                                                       @"name": @"组选三",
                                                                       @"set": @[
                                                                               @{@"title": @"至少选2个球",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@2,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]
                                                                       },
                                                                     @{@"type": @"play",
                                                                       @"name": @"组选六",
                                                                       @"set": @[
                                                                               @{@"title": @"至少选3个球",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@3,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]
                                                                       }]
                                                         },
                                                       @{@"type": @"grounp",
                                                         @"name": @"二星",
                                                         @"grounp":@[@{@"type": @"play",
                                                                       @"name": @"直选",
                                                                       @"set": @[
                                                                               @{@"title": @"十位",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 },
                                                                               @{@"title": @"个位",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]
                                                                       },
                                                                     @{@"type": @"play",
                                                                       @"name": @"组选",
                                                                       @"set": @[
                                                                               @{@"title": @"至少选2个球",
                                                                                 @"member": @{@"start":@0,
                                                                                              @"end":@9},
                                                                                 @"minNum":@2,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]
                                                                       }]
                                                         },
                                                       @{@"type": @"play",
                                                         @"name": @"一星",
                                                         @"set": @[
                                                                 @{@"title": @"个位",
                                                                   @"member": @{@"start":@0,
                                                                                @"end":@9},
                                                                   @"minNum":@1,
                                                                   @"bgColor":@0xff0000
                                                                   }
                                                                 ]
                                                         },
                                                       @{@"type": @"play",
                                                         @"name": @"大小单双",
                                                         @"set": @[
                                                                 @{@"title": @"十位",
                                                                   @"member": @[@"大", @"小", @"单", @"双"],
                                                                   @"minNum":@1,
                                                                   @"bgColor":@0xff0000
                                                                   },
                                                                 @{@"title": @"个位",
                                                                   @"member": @[@"大", @"小", @"单", @"双"],
                                                                   @"minNum":@1,
                                                                   @"bgColor":@0xff0000
                                                                   }
                                                                 ]
                                                         }
                                                       ]},
#pragma mark 安徽11选5
                                      @"anh":@{@"title":@"安徽11选5",
                                               @"subTitle":@"10分钟一期",
                                               @"iconName":@"icon_11x5logo",
                                               @"rule":@[
                                                       @{@"type": @"grounp",
                                                         @"name": @"任选",
                                                         @"grounp":@[@{@"type": @"play",
                                                                       @"name": @"任选一",
                                                                       @"set": @[
                                                                               @{@"title": @"选一位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"任选二",
                                                                       @"set": @[
                                                                               @{@"title": @"选二位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@2,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"任选三",
                                                                       @"set": @[
                                                                               @{@"title": @"选三位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@3,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"任选四",
                                                                       @"set": @[
                                                                               @{@"title": @"选四位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@4,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"任选五",
                                                                       @"set": @[
                                                                               @{@"title": @"选五位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@5,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"任选六",
                                                                       @"set": @[
                                                                               @{@"title": @"选六位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@6,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"任选七",
                                                                       @"set": @[
                                                                               @{@"title": @"选七位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@7,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"任选八",
                                                                       @"set": @[
                                                                               @{@"title": @"至少选八位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@8,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     
                                                                     ]
                                                         },
                                                       @{@"type": @"grounp",
                                                         @"name": @"前二",
                                                         @"grounp":@[@{@"type": @"play",
                                                                       @"name": @"直选",
                                                                       @"set": @[
                                                                               @{@"title": @"第一位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 },
                                                                               @{@"title": @"第二位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"组选",
                                                                       @"set": @[
                                                                               @{@"title": @"至少选两个",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     ]
                                                         },
                                                       @{@"type": @"grounp",
                                                         @"name": @"前三",
                                                         @"grounp":@[@{@"type": @"play",
                                                                       @"name": @"直选",
                                                                       @"set": @[
                                                                               @{@"title": @"第一位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 },
                                                                               @{@"title": @"第二位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 },
                                                                               @{@"title": @"第三位",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     @{@"type": @"play",
                                                                       @"name": @"组选",
                                                                       @"set": @[
                                                                               @{@"title": @"选三个",
                                                                                 @"member": @{
                                                                                         @"start":@0,
                                                                                         @"end":@11
                                                                                         },
                                                                                 @"minNum":@1,
                                                                                 @"bgColor":@0xff0000
                                                                                 }
                                                                               ]},
                                                                     ]
                                                         }
                                                       
                                                       ]
                                               }
                                      };
        
        
        NSArray* keys = lotteryInfo.allKeys;
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithCapacity:keys.count];
        for(int i = 0; i < keys.count; i ++){
            NSString *key = keys[i];
            LTLotteryInfoMode *model = [LTLotteryInfoMode new];
            [model mj_setKeyValues:lotteryInfo[key]];
            model.shortKey = key;
            [mDict setObject:model forKey:key];
        }
        dict = [mDict copy];
    }
    return dict;
}


/*
 管理记录的彩票
 两种：已买彩票，待买彩票
 
 已买彩票分为单期购买，-多期追号-
 
 待买彩票
 
 
 -所有号都有份数概念-
 
 
 */

@end
