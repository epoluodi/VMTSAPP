//
//  query.m
//  VMTSAPP
//
//  Created by appie on 15-1-19.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "query.h"
#import "SheetUI.h"
#import "LoadingView.h"
#import "Common.h"
#import "zsm_cell.h"
#import "detailview.h"
@interface query ()
    

@end

@implementation query
@synthesize navbar;
@synthesize tableview;
@synthesize Navtitle;
@synthesize querybutton;
@synthesize receivedData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    startindex = 0;
    datas = [[NSMutableArray alloc] init
             ];
    [querybutton setBackgroundImage:[UIImage imageNamed:@"button2"] forState:UIControlStateHighlighted];
    [querybutton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    
    
    [navbar  setBackgroundImage:[UIImage imageNamed:@"title2"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationItem *navitem = [[UINavigationItem alloc] init];
//    navitem.title =Navtitle;
    
    UILabel *labtitle = [[UILabel alloc] init];
    labtitle.text = Navtitle;
    labtitle.textColor=[UIColor whiteColor];
    labtitle.textAlignment=NSTextAlignmentCenter;
    labtitle.frame = CGRectMake(0, 20,[Common GetALLScreen].size.width , 20);
    
    UIButton *returnbutton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 20, 20)];
    [returnbutton addTarget:self action:@selector(selectLeftAction:) forControlEvents:UIControlEventTouchDown];
    //
    UIImage *image = [UIImage imageNamed:@"returnpng"];
    [returnbutton setBackgroundImage:image forState:UIControlStateNormal];
    
    
    navitem.hidesBackButton=YES;
    [navbar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:                             [UIColor whiteColor], UITextAttributeTextColor,                               [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,                             [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,                            [UIFont fontWithName:@"Arial-Bold" size:18], UITextAttributeFont, nil]];
    [navbar addSubview:labtitle];
    [navbar addSubview:returnbutton];
    [navbar pushNavigationItem:navitem animated:YES];
    
    [tableview setBackgroundColor:[[UIColor alloc] initWithRed:10/255 green:10/255 blue:10/255 alpha:.8]];
    stringident =@"zscell";
    nib=[UINib nibWithNibName:@"zsm_cell2" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:stringident];
    datalen=0;
    [tableview setBackgroundColor:[UIColor clearColor]];
    [tableview reloadData];
  
    
}


-(void)setsrvtype:(int)_srvtype
{
    srvtype = _srvtype;
    switch (srvtype) {
        case 1:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/query_syscqysj/querysyscqyinfo.do";
            break;
        case 2:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/querysycppzwh/querySycppzwhData.do";
            break;
        case 3:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/queryjksyby/queryJksybyData.do";
            break;
        case 4:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/querysyswzppqfgl/querySyswzppqfglData.do";
            break;
        case 5:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/queryhyjdcjjg/queryhyjdcjjg.do";
            break;
        case 6:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/querysyjdcjjg/querysyjdcjjg.do";
            break;
        case 7:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/querylcsysp/queryLcsysp.do";
            break;
        case 8:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/querygnxsyzc/queryGnxsyzc.do";
            break;
        case 9:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/queryjksyzcxx/queryJksyzcxx.do";
            break;
        case 10:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/querygnsybqsms/queryGnsybqsms.do";
            break;
        case 11:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/queryjksybqsms/queryJksybqsms.do";
            break;
        case 12:
            urlstr = @"http://sysjk.ivdc.org.cn:8081/cx/querysygjbz/querySygjbz.do";
            break;
        default:
            break;
    }
}


-(void)setVisualEffect
{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    
    effectview.frame =self.view.frame;
    
    [self.view addSubview:effectview];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)querybutton:(id)sender
{
    //兼容 ios8
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self setVisualEffect];
    }
    
    
    SheetUI *sheetui = [[SheetUI alloc] init];
    UIAlertController *uv;
    switch (srvtype) {
        case 1:
            uv= [sheetui SHowSheetQuery1:self];
            break;
        case 2:
            uv= [sheetui SHowSheetQuery2:self];
            break;
        case 3:
            uv= [sheetui SHowSheetQuery3:self];
            break;
        case 4:
            uv= [sheetui SHowSheetQuery4:self];
            break;
        case 5:
            uv= [sheetui SHowSheetQuery5:self];
            break;
        case 6:
            uv= [sheetui SHowSheetQuery6:self];
            break;
        case 7:
            uv= [sheetui SHowSheetQuery7:self];
            break;
        case 8:
            uv= [sheetui SHowSheetQuery8:self];
            break;
        case 9:
            uv= [sheetui SHowSheetQuery9:self];
            break;
        case 10:
            uv= [sheetui SHowSheetQuery10:self];
            break;
        case 11:
            uv= [sheetui SHowSheetQuery11:self];
            break;
        case 12:
            uv= [sheetui SHowSheetQuery12:self];
            break;
        default:
            break;
    }
    
    

    
    [self presentViewController:uv animated:NO completion:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectLeftAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)cancelquery
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        [effectview removeFromSuperview];}

}


-(NSDictionary *)getquerydict:(NSString *)params
{
    NSDictionary *dictionary;
    
    switch (srvtype) {
        case 1:
            dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSString stringWithFormat:
                           @"%d",startindex],
                          @"start" ,@"20",
                          @"limit",params,@"condList",
                          @"0",@"isGjcx",nil];
            break;
            
            case 2:
            case 3:
            case 4:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSString stringWithFormat:
                           @"%d",startindex],
                          @"start" ,@"20",
                          @"limit",params,@"condList",
                          nil];
            break;
        case 5:
        case 6:
            dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSString stringWithFormat:
                           @"%d",startindex],
                          @"start" ,@"20",
                          @"limit",params,@"condList",
                          datatype,@"datatype",
                          nil];
            break;
        default:
            break;
    }
 
    return dictionary;
}



-(void)SetqueryDataTypeParams:(NSString *)params
{
    datatype =params;
}

-(void)SetqueryParams:(NSString *)params
{
    [datas removeAllObjects];
    datalen=0;
    startindex=0;
    //兼容 ios8
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        [effectview removeFromSuperview];}
   
    
//    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
//                                [NSString stringWithFormat:@"%d",startindex],@"start" ,
//                                @"20",@"limit",params,@"condList",@"0",@"isGjcx", nil];
    if (params ==nil)
    {
        params =@"[]";
    }
    NSDictionary *dictionary = [self getquerydict:params];
    NSData *ddata = [Common encodeDictionary:dictionary];
    receivedData = [[NSMutableData alloc] init];
    
    
    [[LoadingView shareLoadingView:YES] show];
    
    if ([Common HttpPostUrl:[NSURL URLWithString:urlstr] EncodeData:ddata delegateview:self])
    {
        paramsstrshare =params;
    }
    NSLog(@"params : %@",params);
    
}




//接收到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [receivedData appendData:data];
}

//数据加载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [[LoadingView shareLoadingView:YES] close];
    NSError *error ;

        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *result = [[NSString alloc] initWithData:receivedData encoding:gbkEncoding];
    [receivedData resetBytesInRange:NSMakeRange(0, [receivedData length])];
    
    [receivedData setLength:0];
    NSLog(@"数据 %@",result);
    NSData *jsondata = [result dataUsingEncoding:NSUTF8StringEncoding ];
    NSDictionary *dataDictory = [NSJSONSerialization JSONObjectWithData:jsondata options:kNilOptions error:&error];
    datacount =[[dataDictory objectForKey:@"totalCount"] integerValue];
    
    NSLog(@"数据总数 %i",datacount);
   
    NSArray *rowsarray = [dataDictory objectForKey:@"rows"];
    
    if ( rowsarray.count != 0)
    {
        [datas addObjectsFromArray:rowsarray];
        
        datalen =datas.count;
    }
    
    if (datas.count ==0)
    {
        datalen =0;
        [tableview reloadData];
        UIAlertView *uialertview =[[UIAlertView alloc] init];
        uialertview.message=@"没有获得查询数据";
        [uialertview addButtonWithTitle:@"确定"];
        [uialertview show];
        tableview.tableFooterView =nil;
        return;
    }
    [tableview setTableFooterView:[self setFootView]];
    [tableview reloadData];
    
    
//   
//    [tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
    

}

-(UIView *)setFootView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(2, 0, [Common GetScreen].size.width-10, 50)];
    
     UIButton *footbutton = [[UIButton alloc] initWithFrame:view.frame];
    
    [footbutton setTitle:@"显示更多" forState:UIControlStateNormal];
    [footbutton addTarget:self action:@selector(footclick) forControlEvents:UIControlEventTouchUpInside];
    [footbutton setBackgroundImage:[UIImage imageNamed:@"button2"] forState:UIControlStateHighlighted];
    [footbutton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    
     
    [view addSubview:footbutton];
    
    
    
    return view;
}




-(void)footclick
{
    if ((startindex + 20) < datacount)
    {
        startindex +=20;
        NSDictionary *dictionary = [self getquerydict:paramsstrshare];
//        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
//                                    [NSString stringWithFormat:@"%d",startindex],@"start" ,
//                                    @"20",@"limit",paramsstrshare,@"condList",@"0",@"isGjcx", nil];
        NSData *ddata = [Common encodeDictionary:dictionary];
        
        
        
        [[LoadingView shareLoadingView:YES] show];
        
        if ([Common HttpPostUrl:[NSURL URLWithString:urlstr] EncodeData:ddata delegateview:self])
        {
            
        }
      
        
    }
    
    
}

-(zsm_cell*)setCellValue:(zsm_cell*)cell rowsindex:(int)index
{
    NSLog(@"行号:%d",index);
    NSDictionary *dictdata =[datas objectAtIndex:index];
    
    switch (srvtype) {
        case 1:
            cell.title.text=[dictdata objectForKey:@"qymc"];
         
            cell.valuetxt.text =[NSString stringWithFormat:@"许可证号:%@\nGMP证书号:%@",[dictdata objectForKey:@"xkzh"],[dictdata objectForKey:@"gmpZsh"]];
            break;
        case 2:
            cell.title.text=[dictdata objectForKey:@"tym"];
     
            cell.valuetxt.text =[NSString stringWithFormat:@"批准文号:%@\n企业名称:%@",[dictdata objectForKey:@"pzwh"],[dictdata objectForKey:@"qymc"]];
            break;
        case 3:
            cell.title.text=[dictdata objectForKey:@"cpmc"];
       
            cell.valuetxt.text =[NSString stringWithFormat:@"生产企业:%@\n代理机构:%@\n批号:%@",[dictdata objectForKey:@"scqy"],[dictdata objectForKey:@"dljg"],
                                 [dictdata objectForKey:@"ph"]];
            break;
        case 4:
            cell.title.text=[dictdata objectForKey:@"cpmc"];
       
            cell.valuetxt.text =[NSString stringWithFormat:@"生产企业:%@\n批准文号:%@",[dictdata objectForKey:@"scqy"],
                                 [dictdata objectForKey:@"pzwh"]];
            break;
        case 5:
            cell.title.text=[dictdata objectForKey:@"cpmc"];
            if ([datatype isEqualToString:@"all"])
            {
            cell.valuetxt.text =[NSString stringWithFormat:
                                 @"生产企业:%@\n检验结论:%@",
                                 [dictdata objectForKey:@"bcscqy"],
                                 [dictdata objectForKey:@"jyjl"]];
            }
            if ([datatype isEqualToString:@"hg"])
            {
                cell.valuetxt.text =[NSString stringWithFormat:
                                     @"生产企业:%@\n检验结论:%@",
                                     [dictdata objectForKey:@"bcscqy"],
                                     [dictdata objectForKey:@"jyjl"]];
            }
            if ([datatype isEqualToString:@"bhg"])
            {
                cell.valuetxt.text =[NSString stringWithFormat:
                                     @"生产企业:%@\n检验结果:不合格\n不合格项目:%@",
                                     [dictdata objectForKey:@"bcscqy"],
                                     [dictdata objectForKey:@"bhgxm"]                                     ];
            }
            if ([datatype isEqualToString:@"jsy"])
            {
                cell.valuetxt.text =[NSString stringWithFormat:
                                     @"生产企业:%@\n检验结果:假售药\n批准文号:%@",
                                     [dictdata objectForKey:@"bcscqy"],
                                     [dictdata objectForKey:@"cpwh"]                                     ];
            }
            break;
        case 6:
            cell.title.text=[dictdata objectForKey:@"cpmc"];
            if ([datatype isEqualToString:@"all"])
            {
                cell.valuetxt.text =[NSString stringWithFormat:
                                     @"生产企业:%@\n检验结论:%@\n抽检项目:%@",
                                     [dictdata objectForKey:@"bcscqy"],
                                     [dictdata objectForKey:@"jyjl"],
                                     [dictdata objectForKey:@"jyxm"]];
            }
            if ([datatype isEqualToString:@"hg"])
            {
                cell.valuetxt.text =[NSString stringWithFormat:
                                     @"生产企业:%@\n检验结论:%@\n抽检项目:%@",
                                     [dictdata objectForKey:@"bcscqy"],
                                     [dictdata objectForKey:@"jyjl"],
                                     [dictdata objectForKey:@"jyxm"]];
            }
            if ([datatype isEqualToString:@"bhg"])
            {
                cell.valuetxt.text =[NSString stringWithFormat:
                                     @"生产企业:%@\n检验结果:不合格\n不合格项目:%@",
                                     [dictdata objectForKey:@"bcscqy"],
                                     [dictdata objectForKey:@"jyxm"]                                     ];
            }
      
            break;
        case 7:
            cell.title.text=[dictdata objectForKey:@"xmmc"];
            
            cell.valuetxt.text =[NSString stringWithFormat:@"申请单位:%@",
                                 [dictdata objectForKey:@"sqdwmc"]];
            break;
        case 8:
            cell.title.text=[dictdata objectForKey:@"xsymc"];
            
            cell.valuetxt.text =[NSString stringWithFormat:@"研制单位:%@\n类别:%@",
                                 [dictdata objectForKey:@"yzdw"],[dictdata objectForKey:@"lb"]];
            break;
        case 9:
            cell.title.text=[dictdata objectForKey:@"symc"];
            
            cell.valuetxt.text =[NSString stringWithFormat:@"生产企业:%@\n证书号:%@",
                                 [dictdata objectForKey:@"sccmc"],[dictdata objectForKey:@"zsh"]];
            break;
            
        case 10:
        case 11:
            cell.title.text=[dictdata objectForKey:@"tym"];
            
            cell.valuetxt.text =[NSString stringWithFormat:@"规格:%@",
                                 [dictdata objectForKey:@"gg"]];
            break;
        case 12:
            cell.title.text=[dictdata objectForKey:@"bzmc"];
            
            cell.valuetxt.text =[NSString stringWithFormat:@"规格:%@",
                                 [dictdata objectForKey:@"gg"]];
            break;
        default:
            break;
    }
   

    [cell ressetcell];
    return cell;
}



- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error : %@",error);
    [[LoadingView shareLoadingView:YES] close];
    UIAlertView *uialertview =[[UIAlertView alloc] init];
    uialertview.message=@"获取数据失败，请重新尝试";
    [uialertview addButtonWithTitle:@"确定"];
    [uialertview show];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"行数:%d",datalen);
    
    return datalen;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lbl = [[UILabel alloc] init];
    
    lbl.textAlignment = UITextAlignmentCenter;
    
    lbl.textColor = [UIColor whiteColor];
    
    lbl.text = @"查询信息";
    
    [lbl setBackgroundColor:[[UIColor alloc] initWithRed:0.52 green:.43 blue:.4 alpha:.21]];
    
    
    
    return lbl;
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier  isEqual: @"detail"])
    {
       
        detailview *dview = segue.destinationViewController;
        [dview setsrvtype:srvtype];
        if ([dview respondsToSelector:@selector(setNavtitle:)]) {
            [dview setValue:@"详细信息" forKey:@"Navtitle"];
        }
        
        switch (srvtype) {
            case 1:
                if ([dview respondsToSelector:@selector(setInfoparams:)]) {
                    [dview setValue:[setdetaildata objectForKey:@"itemid"] forKey:@"Infoparams"];
                }
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:

                if ([dview respondsToSelector:@selector(setDictdata:)]) {
                    [dview setValue:setdetaildata forKey:@"Dictdata"];
                }
                break;
            case 12:

                if ([dview respondsToSelector:@selector(setInfoparams:)]) {
                    [dview setValue:[setdetaildata objectForKey:@"bzmc"] forKey:@"Infoparams"];
                }
                
                break;
            default:
                break;
        }

        
        
 
        
        
    }
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (srvtype) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
           setdetaildata= [datas objectAtIndex:indexPath.row];
          
            [self performSegueWithIdentifier:@"detail" sender:self];
            break;
            
        default:
            break;
    }
    
   
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
