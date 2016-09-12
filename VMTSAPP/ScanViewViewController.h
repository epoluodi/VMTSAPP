//
//  ScanViewViewController.h
//  VMTSAPP
//
//  Created by appie on 15-1-6.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ShowScan.h"
#import "Common.h"
#import "ScanCodeView.h"
@interface ScanViewViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ScanCodeDelegate>
{


    NSString *stringident;
    UINib *nib;
    uint datalen;
    NSDictionary *zsmdata;
    UIButton *openurlbutton;
    NSString *cid,*pid;
//    ShowScan *showscan;
    BOOL isweb;
}

@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;
@property (weak, nonatomic) IBOutlet UILabel *scaninfolabel;
@property (weak, nonatomic) IBOutlet UIButton *scanbutton;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *tabletitle;

-(IBAction)scanbutton:(id)sender;



@end
