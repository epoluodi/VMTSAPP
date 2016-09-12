//
//  query.h
//  VMTSAPP
//
//  Created by appie on 15-1-19.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
@interface query : UIViewController <queryparams,UITextFieldDelegate,NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIVisualEffectView *effectview;
    int startindex;
    NSString *stringident;
    UINib *nib;
    uint datalen;
    NSInteger *datacount;
    NSMutableArray *datas;
    NSArray *rowheight;
    NSString *paramsstrshare;
    int srvtype;
    NSString *urlstr;
    __strong NSString *datatype;
    NSDictionary *setdetaildata;
    
}
@property (strong,nonatomic) NSMutableData *receivedData;


@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIButton *querybutton;

@property (nonatomic,copy) NSString *Navtitle;

-(void)setsrvtype:(int)_srvtype;
-(IBAction)querybutton:(id)sender;
@end
