//
//  ScanViewViewController.m
//  VMTSAPP
//
//  Created by appie on 15-1-6.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "ScanViewViewController.h"
#import "LoadingView.h"
#import "zsm_cell.h"
@interface ScanViewViewController ()

@end

@implementation ScanViewViewController
@synthesize navbar;
@synthesize scaninfolabel;
@synthesize scanbutton;
@synthesize tableview;
@synthesize tabletitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
   // self.edgesForExtendedLayout = UIRectEdgeNone;
   // self.extendedLayoutIncludesOpaqueBars = NO;
   // self.modalPresentationCapturesStatusBarAppearance = NO;
    openurlbutton = [[UIButton alloc] initWithFrame:scaninfolabel.frame];
  

    [openurlbutton addTarget:self action:@selector(openurlweb:) forControlEvents:UIControlEventTouchUpInside];
    [openurlbutton setBackgroundImage:[UIImage imageNamed:@"button2"] forState:UIControlStateHighlighted];
    [openurlbutton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    
    
    [scanbutton setBackgroundImage:[UIImage imageNamed:@"button2"] forState:UIControlStateHighlighted];
    [scanbutton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    
    
    
    CGRect btnFrame = scanbutton.frame;
    btnFrame.size.height=40;
    scanbutton.frame = btnFrame;
    
    [navbar  setBackgroundImage:[UIImage imageNamed:@"title2"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationItem *navitem = [[UINavigationItem alloc] init];
//    navitem.title =@"兽药追溯码查询";
  
    UILabel *labtitle = [[UILabel alloc] init];
    labtitle.text = @"兽药追溯码查询";
    labtitle.textColor=[UIColor whiteColor];
    labtitle.textAlignment=NSTextAlignmentCenter;
    labtitle.frame = CGRectMake(0, 20,[Common GetALLScreen].size.width , 20);
    
    
    UIButton *returnbutton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 20, 20)];
    [returnbutton addTarget:self action:@selector(selectLeftAction:) forControlEvents:UIControlEventTouchDown];
//
    UIImage *image = [UIImage imageNamed:@"returnpng"];
    [returnbutton setBackgroundImage:image forState:UIControlStateNormal];
    
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(selectLeftAction:)];
    
    
    [tableview setBackgroundColor:[[UIColor alloc] initWithRed:10/255 green:10/255 blue:10/255 alpha:.8]];
    
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"returnpng"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [leftButton setWidth:24];
    
//    [navitem setLeftBarButtonItem:nil];
    navitem.hidesBackButton=YES;
    
//    //自定义标题
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 , 100, 20)];
//    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
//    titleLabel.font = [UIFont boldSystemFontOfSize:18];  //设置文本字体与大小
//    titleLabel.textColor = [UIColor whiteColor];  //设置文本颜色
//    titleLabel.textAlignment = UITextAlignmentCenter;
//    titleLabel.text = @"兽药追溯码查询";  //设置标题
    
    
    
    [navbar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:                             [UIColor whiteColor], UITextAttributeTextColor,                               [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,                             [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,                            [UIFont fontWithName:@"Arial-Bold" size:20], UITextAttributeFont, nil]];
    [navbar addSubview:labtitle];
    [navbar addSubview:returnbutton];
//    navitem.titleView =titleLabel;
    [navbar pushNavigationItem:navitem animated:YES];
    
 
    
    scaninfolabel.text= @"";
    

//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"returnpng"] style:UIBarButtonItemStylePlain target:self action:nil];
//    navigationItem.leftBarButtonItem =leftButton;
    
//    [NavigateBar pushNavigationItem:navigationItem animated:YES];
    stringident =@"zscell";
    nib=[UINib nibWithNibName:@"zsm_cell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:stringident];
    datalen=0;
    [tableview setBackgroundColor:[UIColor clearColor]];
    [tableview reloadData];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self scanbutton:nil];

    });
   
}

-(void)ScanCode:(NSString *)Code CodeType:(enum CodeType)codetype
{
    NSLog(@"Code %@",Code);
    [self ScanFinish:Code];
    
}
-(void)scanbutton:(id)sender
{
//    showscan = [[ShowScan alloc] init];
//    [showscan ShowScan2D:self];
    
    ScanCodeView *scanview = [[ScanCodeView alloc] initWithNibName:@"scanCodeView" bundle:nil];
    scanview.delegate = self;
    [self presentViewController:scanview animated:YES completion:nil];
    
    
    
}

-(void)selectLeftAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ScanFinish:(NSString *)data
{
    
    
    if (data == nil)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *uialertview =[[UIAlertView alloc] init];
            uialertview.message=@"没有按照UTF-8格式编码" ;        [uialertview addButtonWithTitle:@"确定"];
            [uialertview show];
        });

        return;
    }
    NSLog(@"%@: " ,data);
    
    NSString *urlstr  = [Common CheckURl:data];
    
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        scaninfolabel.numberOfLines=0;
        scaninfolabel.lineBreakMode=UILineBreakModeCharacterWrap;
        scaninfolabel.text =data;
        
        
        if (![urlstr isEqualToString:@""])
        {
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:data];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,data.length)];
            scaninfolabel.numberOfLines=0;
            scaninfolabel.lineBreakMode=UILineBreakModeCharacterWrap;
            scaninfolabel.attributedText = str;
            //        scaninfolabel.font = [UIFont fontWithName:@"System" size:16];
            
            [self.view addSubview:openurlbutton];
            isweb=true;
            datalen=0;
            [tableview reloadData];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scaninfolabel.text]];
            return;
        }
        if (isweb)
        {
            [openurlbutton removeFromSuperview];
            isweb=false;
        }

        BarcodeStruct barcode;
        barcode = [Common GetCheckBarcode:data];
        
        
        //            scaninfolabel.font = [UIFont fontWithName:@"System" size:10];
        if (!barcode.isCode) {
            if (barcode.result == 1)
            {
                scaninfolabel.text =[NSString stringWithUTF8String:barcode.code];
                UIAlertView *uialertview =[[UIAlertView alloc] init];
                uialertview.message=@"没有按照UTF-8格式编码" ;        [uialertview addButtonWithTitle:@"确定"];
                [uialertview show];
                
                datalen=0;
                [tableview reloadData];
                return;
            }
            
            
            
        }
        
        
        NSString *zsm = [NSString stringWithUTF8String:barcode.code];
        
        //    CGSize labelSize = {0, 0};
        //    labelSize = [zsm sizeWithFont:[UIFont systemFontOfSize:14]
        //                     constrainedToSize:CGSizeMake(scaninfolabel.frame.size.width, scaninfolabel.frame.size.height)
        //                         lineBreakMode:UILineBreakModeWordWrap];
        //
        //      scaninfolabel.frame = CGRectMake(scaninfolabel.frame.origin.x, scaninfolabel.frame.origin.y, scaninfolabel.frame.size.width, labelSize.height);//保持原来Label的位置和宽度，只是改变高度。
        
        
        
        NSLog(@"zsm:%@",zsm);
        [[LoadingView shareLoadingView:YES] show];
        
        
        
        dispatch_queue_t globalqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        
        dispatch_async(globalqueue, ^{
            
            
            NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:zsm,@"zsm" , nil];
            NSData *ddata = [Common encodeDictionary:dictionary];
            
            NSString *jsondata=[Common HttpPostUrl:[NSURL URLWithString:@"http://sysy.ivdc.org.cn:8081/SyZs/commons/public/getZsmInfo.do?isRes=true"] EncodeData:ddata];
            
            dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:zsm,@"zsm" ,0,@"mode", nil];
            ddata = [Common encodeDictionary:dictionary];

            NSString *strjsondata2=[Common HttpPostUrl:[NSURL URLWithString:@"http://sysy.ivdc.org.cn:8081/SyZs/commons/public/getZsmLevels.do?isRes=true"] EncodeData:ddata];
            
            
            NSLog(@"json2 %@",strjsondata2);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[LoadingView shareLoadingView:YES] close];
                
                NSData *jsondata1 = [jsondata dataUsingEncoding:NSUTF8StringEncoding ];
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsondata1 options:NSJSONReadingMutableLeaves error:nil];
                NSArray *rowsarray = [json objectForKey:@"rows"];
                if (rowsarray.count == 0)
                {
                    
                    datalen =0;
                    [tableview reloadData];
                    UIAlertView *uialertview =[[UIAlertView alloc] init];
                    uialertview.message=@"没有获得二维码信息记录";
                    [uialertview addButtonWithTitle:@"确定"];
                    [uialertview show];
                    datalen=0;
                    [tableview reloadData];
                    return;
                }
                
                
                
                NSData *jsondata2 = [strjsondata2 dataUsingEncoding:NSUTF8StringEncoding ];
                
                NSArray *json2 = [NSJSONSerialization JSONObjectWithData:jsondata2 options:NSJSONReadingMutableLeaves error:nil];
                
                
                if (![strjsondata2 isEqualToString:@"[]"]){
                    
                    NSString *fixjson = [strjsondata2 stringByReplacingOccurrencesOfString:@"[{" withString:@""];
                    fixjson = [fixjson stringByReplacingOccurrencesOfString:@"}]" withString:@""];
                    NSArray *splitstr =[fixjson componentsSeparatedByString:@","];
                    
                    
                    cid = splitstr[0];
                    cid = [cid stringByReplacingOccurrencesOfString:@"id:'" withString:@""];
                    cid = [cid stringByReplacingOccurrencesOfString:@"'" withString:@""];
                    cid = [cid stringByReplacingOccurrencesOfString:@"  " withString:@"\r"];
                    pid = splitstr[3];
                    pid = [pid stringByReplacingOccurrencesOfString:@"pid:'" withString:@""];
                    pid = [pid stringByReplacingOccurrencesOfString:@"'" withString:@""];
                    pid = [pid stringByReplacingOccurrencesOfString:@"  " withString:@"\r"];
                   
                }
                else
                {
                    cid = @"无";
                    pid = @"无";
                }
                
                
                
                
                zsmdata = [rowsarray objectAtIndex:0];

                datalen = [zsmdata count] -1;
                
                [tableview setTableFooterView:[[UIView alloc] init]];
                [tableview reloadData];
                [tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
            });
            
            
        });
        
        
        
        //    UIAlertView *uialertview =[[UIAlertView alloc] init];
        //    uialertview.message=[NSString stringWithFormat:@"返回信息 %@",json] ;
        //    [uialertview addButtonWithTitle:@"确定"];
        //    [uialertview show];

    });

}



-(void)openurlweb:(id)sender
{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scaninfolabel.text]];
 
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"行数:%d",datalen);

    return datalen;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lbl = [[UILabel alloc] init];
    
    lbl.textAlignment = UITextAlignmentCenter;
    
    lbl.textColor = [UIColor whiteColor];
    
    lbl.text = @"二维码追溯信息";
    
    [lbl setBackgroundColor:[[UIColor alloc] initWithRed:0.52 green:.43 blue:.4 alpha:.21]];
    
    
    
    return lbl;
}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"二维码追溯信息";
//}


-(zsm_cell*)setCellValue:(zsm_cell*)cell rowsindex:(int)index
{
    NSLog(@"行号:%d",index);
    switch (index) {
        case 0:
            cell.title.text=@"产品名称";
            cell.valuetxt.text=[zsmdata objectForKey:@"cpname"];
            break;
        case 1:
            cell.title.text=@"生产企业";
            cell.valuetxt.text=[zsmdata objectForKey:@"qyname"];
            break;
        case 2:
            cell.title.text=@"药品类型";
            cell.valuetxt.text=[zsmdata objectForKey:@"yplxname"];
            break;
        case 3:
            cell.title.text=@"剂型";
            cell.valuetxt.text=[zsmdata objectForKey:@"jxname"];
            break;
        case 4:
            cell.title.text=@"批准文号";
            cell.valuetxt.text=[zsmdata objectForKey:@"pzwh"];
            break;
        case 5:
            cell.title.text=@"产品批号";
            cell.valuetxt.text=[zsmdata objectForKey:@"ph"];
            break;
        case 6:
            cell.title.text=@"生产日期";
            cell.valuetxt.text=[zsmdata objectForKey:@"scrq"];
            break;
        case 7:
            cell.title.text=@"失效日期";
            cell.valuetxt.text=[zsmdata objectForKey:@"sxrq"];
            break;
        case 8:
            cell.title.text=@"产品规格";
            cell.valuetxt.text=[zsmdata objectForKey:@"specification"];
            break;
        case 9:
            cell.title.text=@"最小贴码单位";
            cell.valuetxt.text=[zsmdata objectForKey:@"mintagunit"];
            break;
        case 10:
            cell.title.text=@"最小包装单位";
            cell.valuetxt.text=[zsmdata objectForKey:@"minpackunit"];
            break;
        case 11:
            cell.title.text=@"贴码包装比例";
            cell.valuetxt.text=[zsmdata objectForKey:@"tagratio"];
            break;
        case 12:
            cell.title.text=@"贴码级别";
            cell.valuetxt.text= [NSString stringWithFormat:@"%@",[zsmdata objectForKey:@"tmjb"]];;
            break;
        case 13:
            cell.title.text=@"发货目的地";
            cell.valuetxt.text=[zsmdata objectForKey:@"chsf"];
            break;
        case 14:
            cell.title.text=@"查询次数";
            cell.valuetxt.text=[NSString stringWithFormat:@"%@",[zsmdata objectForKey:@"cxcs"]];;
            break;
        case 15:
            cell.title.text=@"子级包装码";
            cell.valuetxt.text=cid;
            break;
        case 16:
            cell.title.text=@"父级包装码";
            cell.valuetxt.text=pid;
            break;
    }
    [cell ressetcell];
    return cell;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            zsm_cell *ucell =[tableView dequeueReusableCellWithIdentifier:stringident];
    
    if (ucell == nil)
    {
        ucell = [[zsm_cell alloc] init];
        
    }
    ucell = [self setCellValue:ucell rowsindex:indexPath.row];

    ucell.selectedBackgroundView = [[UIView alloc] initWithFrame:ucell.frame];
    ucell.selectedBackgroundView.backgroundColor = kUIColorFromRGB(0x106db9);
    if (indexPath.row % 2 ==0)
    {
        ucell.contentView.backgroundColor=[[UIColor alloc] initWithRed:0.1 green:0 blue:0 alpha:0.1];
        return ucell;
    }
    else
    {
        
        ucell.contentView.backgroundColor=[[UIColor alloc] initWithRed:0.2 green:0 blue:0 alpha:0.2];
        
        return ucell;
        
    }
}

-(void)tableView:(UITableView*)tableView  willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableview cellForRowAtIndexPath:indexPath];
    zsm_cell *cell2 =(zsm_cell*)cell;
    
    return [cell2 getviewheight];
//    return 85;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

@end
