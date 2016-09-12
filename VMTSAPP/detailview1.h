//
//  detailview1.h
//  VMTSAPP
//
//  Created by appie on 15-1-23.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailview.h"
#import "Common.h"
@interface detailview1 : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
{
    detailview *rootview;
    NSString *stringident;
    UINib *nib;
    uint datalen;
    NSInteger *datacount;
    NSDictionary *setdetaildata;
    int srvtype;
    NSArray *titlelists;
    NSString *strurl;
    NSString * nowparam;
    NSMutableArray *datas;
    int startindex;
    bool isfinsh;
    bool ischildview;
    UISegmentedControl *s1;
}


@property (strong,nonatomic) NSMutableData *receivedData;

@property (weak, nonatomic) IBOutlet UITableView *tableview;


-(void)setdata1:(NSDictionary *)data;

@end
