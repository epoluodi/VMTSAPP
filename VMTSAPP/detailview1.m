//
//  detailview1.m
//  VMTSAPP
//
//  Created by appie on 15-1-23.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "detailview1.h"
#import "zsm_cell.h"
#import "Common.h"
#import "LoadingView.h"
@interface detailview1 ()

@end

@implementation detailview1
@synthesize tableview;
@synthesize receivedData;
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

 
    if (!isfinsh)
        if (srvtype ==1)
        {
           
                [[LoadingView shareLoadingView:YES] show];
        }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
//    CGRect barsize = [[self navigationController] navigationBar].frame;
//    barsize.size.height=58;
//    [[self navigationController] navigationBar].frame=barsize;;
//        [[[self navigationController] navigationBar]  setBackgroundImage:[UIImage imageNamed:@"title2"] forBarMetrics:UIBarMetricsDefault];
    rootview = (detailview *)[self parentViewController];
    
    

  
   
    datas = [[NSMutableArray alloc] init
             ];

  

    [[[self navigationController] navigationBar] setBackgroundColor:[UIColor clearColor]];
    UIButton *returnbutton = [[UIButton alloc] initWithFrame:CGRectMake(5, 10, 50, 24)];
    [returnbutton setTitle:@"返回" forState:UIControlStateNormal];
    [returnbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [returnbutton addTarget:self action:@selector(selectLeftAction:) forControlEvents:UIControlEventTouchUpInside];
//    //    //
//    UIImage *image = [UIImage imageNamed:@"returnpng"];
//    [returnbutton setBackgroundImage:image forState:UIControlStateNormal];
        [[[self navigationController] navigationBar] addSubview:returnbutton] ;
    
    
    
    
    
    
    [self navigationItem].title =rootview.Navtitle;
    
    
   
    srvtype = [rootview getsrvtype];
    
    [self settitlelists];
    [tableview setBackgroundColor:[[UIColor alloc] initWithRed:10/255 green:10/255 blue:10/255 alpha:.8]];
    stringident =@"zscell";
    nib=[UINib nibWithNibName:@"zsm_cell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:stringident];
   
    [tableview setBackgroundColor:[UIColor clearColor]];
    

  
//        if (rootview.nowpages < rootview.infocounts)
//        {
//            UIButton *nextbutton = [[UIButton alloc] initWithFrame:CGRectMake([Common GetScreen].size.width - 60, 10, 60, 24)];
//            [nextbutton setTitle:@"下一页" forState:UIControlStateNormal];
//            [nextbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//            [nextbutton addTarget:self action:@selector(selectnextAction:) forControlEvents:UIControlEventTouchUpInside];
//        //    //    //
//        //    UIImage *image = [UIImage imageNamed:@"returnpng"];
//        //    [returnbutton setBackgroundImage:image forState:UIControlStateNormal];
//            [[[self navigationController] navigationBar] addSubview:nextbutton] ;
//        
//            [tableview reloadData];
//            return;
//        }
        
        
        
        

    
        switch (srvtype) {
            case 1:
            

      
            datacount=0;
            startindex=0;
            strurl =@"http://sysjk.ivdc.org.cn:8081/cx/query_syscqysj/querysyscqydetail.do";
            [self loadmenu1];
            [tableview reloadData];
            break;
        case 12:
            datacount=0;
            startindex=0;
            datalen=0;
            strurl =@"http://sysjk.ivdc.org.cn:8081/cx/querysycppzwh/querySycppzwhData.do";
           
            [self loadmenu12];
            [tableview reloadData];
            break;
            
        default:
            setdetaildata =rootview.Dictdata;
            [tableview reloadData];
            break;
        }
    
    
}

-(void)selectnextAction:(id)sender
{
    [rootview setNowpages:rootview.nowpages+1];
  
    
    [rootview.navigationController performSegueWithIdentifier:@"child" sender:self];
    
     
    
}

-(void)loadmenu1
{
    

    
    
    
    
 
    NSMutableArray *dictarray = [[NSMutableArray alloc] init];
    [dictarray addObject:rootview.Infoparams];
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
    
    NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:jsonstr, @"itemidList" ,nil] ;
    NSData *ddata = [Common encodeDictionary:dictionary];
    receivedData = [[NSMutableData alloc] init];
    [rootview setNowpages:0];
    isfinsh=NO;
    if (![Common HttpPostUrl:[NSURL URLWithString:strurl] EncodeData:ddata delegateview:self])
    {
        isfinsh=YES;
        [[LoadingView shareLoadingView:YES] close];
        UIAlertView *uialertview =[[UIAlertView alloc] init];
        uialertview.message=@"获取数据失败，请重新尝试";
        [uialertview addButtonWithTitle:@"确定"];
        [uialertview show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }

    
}



-(void)loadmenu12
{
    NSMutableArray *dictarray = [[NSMutableArray alloc] init];
    NSDictionary *nsdictionary;
    NSLog(@"参数 ：%@",rootview.Infoparams);
    nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                    @"tym",@"itemname",
                    @"tym",@"itemfieldname",
                    rootview.Infoparams,@"itemval",
                    @"String",@"itemtype",
                    @"val",@"condType",
                    @"equal",@"compareType",nil];
    [dictarray addObject:nsdictionary];
    
    
    
    
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
    
    NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%d",startindex], @"start" ,@"10",@"limit",jsonstr,@"condList",nil] ;
    NSData *ddata = [Common encodeDictionary:dictionary];
    receivedData = [[NSMutableData alloc] init];
    
    if (![Common HttpPostUrl:[NSURL URLWithString:strurl] EncodeData:ddata delegateview:self])
    {
        [[LoadingView shareLoadingView:YES] close];
        UIAlertView *uialertview =[[UIAlertView alloc] init];
        uialertview.message=@"获取数据失败，请重新尝试";
        [uialertview addButtonWithTitle:@"确定"];
        [uialertview show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        nowparam =jsonstr;
    }

}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error : %@",error);
    isfinsh=YES;
    [[LoadingView shareLoadingView:YES] close];
    UIAlertView *uialertview =[[UIAlertView alloc] init];
    uialertview.message=@"获取数据失败，请重新尝试";
    [uialertview addButtonWithTitle:@"确定"];
    [uialertview show];
    [self dismissViewControllerAnimated:YES completion:nil];
}


//接收到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [receivedData appendData:data];
}

-(void)setdata1:(NSDictionary *)data
{
    setdetaildata = data;
    ischildview=YES;
    
}
//数据加载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    isfinsh=YES;
    [[LoadingView shareLoadingView:YES] close];
    NSError *error ;
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *result = [[NSString alloc] initWithData:receivedData encoding:gbkEncoding];
    [receivedData resetBytesInRange:NSMakeRange(0, [receivedData length])];
    
    [receivedData setLength:0];
    NSLog(@"数据 %@",result);
    NSData *jsondata = [result dataUsingEncoding:NSUTF8StringEncoding ];
    NSDictionary *dataDictory = [NSJSONSerialization JSONObjectWithData:jsondata options:kNilOptions error:&error];
    
    if(srvtype !=1)
    {
    
    datacount =[[dataDictory objectForKey:@"totalCount"] integerValue];
    }
    
   
    
    NSArray *rowsarray = [dataDictory objectForKey:@"rows"];

    if ( rowsarray.count != 0)
    {
        [datas addObjectsFromArray:rowsarray];
        if (srvtype ==1)
        {
            [self settitlelist1:0];
        }
        else
            datalen =datas.count;
        if (srvtype ==1)
        {
            [rootview setInfocounts:rowsarray.count];
            
            
//            UIButton *nextbutton = [[UIButton alloc] initWithFrame:CGRectMake([Common GetScreen].size.width - 60, 10, 60, 24)];
//            [nextbutton setTitle:@"下一页" forState:UIControlStateNormal];
//            [nextbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//            [nextbutton addTarget:self action:@selector(selectnextAction:) forControlEvents:UIControlEventTouchUpInside];
            //    //    //
            //    UIImage *image = [UIImage imageNamed:@"returnpng"];
            //    [returnbutton setBackgroundImage:image forState:UIControlStateNormal];
            
            [self navigationItem].title =@"";
            s1 = [[UISegmentedControl alloc] init];

            
            for (int i=0; i<rowsarray.count+1; i++) {
                    [s1 insertSegmentWithTitle:[NSString stringWithFormat:@"%d页",i+1] atIndex:i animated:YES];
            }
           s1.frame =CGRectMake([Common GetScreen].size.width / 2-25 , 15, [Common GetScreen].size.width  / 2 + 20, 20);
            
            [[[self navigationController] navigationBar] addSubview:s1] ;
             [s1 addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
        s1.selectedSegmentIndex=0;
            
            
            
        }
    }
    
    if (datas.count ==0)
    {
        datalen =0;
        
        UIAlertView *uialertview =[[UIAlertView alloc] init];
        uialertview.message=@"没有获得查询数据";
        [uialertview addButtonWithTitle:@"确定"];
        [uialertview show];
        tableview.tableFooterView =nil;
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }

    
    if (srvtype != 1)
    {
        [tableview setTableFooterView:[self setFootView]];
        
    }
 
    [tableview reloadData];
    
    
    
}

-(void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    [self settitlelist1:Index];
    [tableview reloadData];
}

-(void)settitlelist1:(int)pages
{
    switch (pages) {
        case 0:
                        datalen =9;
                        titlelists =[[NSArray alloc] initWithObjects:
                                     @"企业名称",@"许可证号",@"生产范围",@"生产地址",@"发证日期",
                                     @"有效期至",@"证书状态",@"变更情况",
                                     @"曾用名",nil];
            setdetaildata = [datas objectAtIndex:0];
            break;
        
            
        default:
       
            datalen =11;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"企业名称",@"生产地址",@"GMP证书号",@"验收范围",@"验收状态",@"公告号",
                         @"公告日期",@"失效日期",@"省份",
                         @"证书状态",@"变更情况",nil];
            setdetaildata = [datas objectAtIndex:pages-1];
            break;
    }
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
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%d",startindex], @"start" ,@"10",@"limit",nowparam,@"condList",nil] ;
        NSData *ddata = [Common encodeDictionary:dictionary];
        
        
        
        [[LoadingView shareLoadingView:YES] show];
        
        if ([Common HttpPostUrl:[NSURL URLWithString:strurl] EncodeData:ddata delegateview:self])
        {
            
        }
        
        
    }
    
    
}


-(void)settitlelists
{
    switch (srvtype) {
//        case 1:
//            datalen =0;
//            titlelists =[[NSArray alloc] initWithObjects:
//                         @"企业名称",@"许可证号",@"生产范围",@"生产地址",@"发证日期",
//                         @"有效期至",@"证书状态",@"变更情况",
//                         @"曾用名",nil];
//            break;
        case 2:
            datalen =10;
            titlelists =[[NSArray alloc] initWithObjects:
            @"受理号",@"企业名称",@"通用名",@"规格",
                         @"商品名",@"批准文号",@"批准日期",
                         @"有效期",@"失效原因",@"变更情况",nil];
            break;
        case 3:
            datalen =9;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"代理机构",@"生产企业",@"产品",@"注册证书号",
                         @"批号",@"规格",@"失效日期",
                         @"签发结果",@"签发日期",nil];
            break;
        case 4:
            datalen =7;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"生产企业",@"产品",@"批准文号",
                         @"批号",@"失效日期",
                         @"签发结果",@"签发日期",nil];
            break;
        case 5:
            datalen =13;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"检验结果",@"年度",@"季度",@"产品文号",
                         @"用药类别",@"产品名称",@"商品名",
                         @"标准生产企业",@"被抽样单位名称",
                         @"批号",@"不合格项目",@"检验单位",
                         @"备注",nil];
            break;
        case 6:
            datalen =12;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"检验结果",@"年度",@"季度",@"产品文号",
                         @"产品名称",@"生产企业",
                         @"被抽样单位名称",
                         @"批号",@"抽检项目",
                         @"不合格项目",@"检验依耐",
                         @"备注",nil];
            break;
        case 7:
            datalen =6;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"项目名称",@"批件号",@"申请单位名称",
                         @"试制产品的批号",@"试制产品的数量",
                         @"临床实验地点",
                         nil];
            break;
        case 8:
            datalen =9;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"新兽药名称",@"研制单位",@"类别",
                         @"规格",@"适应症",
                         @"注册证书号",@"备注",@"公告号",
                         @"公告日期",nil];
            break;
        case 9:
            datalen =9;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"兽药名称",@"生产厂名称",
                         @"规格",@"适应症",
                         @"证书号",@"有效期限",@"备注",@"公告号",
                         @"公告日期",nil];
            break;
        case 10:
        case 11:
            datalen =4;
            titlelists =[[NSArray alloc] initWithObjects:
                         @"通用名",@"规格",
                         @"说明书范本",@"附加说明"
                         ,nil];
            break;
//        case 12:
//            datalen =2;
//            titlelists =[[NSArray alloc] initWithObjects:
//                         @"企业名称",@"详细信息"
//                         
//                         ,nil];
//            break;
        default:
            break;
    }
}


-(void)selectLeftAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (srvtype ==1)
    {
        if (s1.selectedSegmentIndex==0)
            lbl.text = [setdetaildata objectForKey:@"xkzh"];
        else
            lbl.text = [setdetaildata objectForKey:@"gmpZsh"];
    }
    else
        lbl.text =@"";
    
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


-(zsm_cell*)setCellValue:(zsm_cell*)cell rowsindex:(int)index
{
    NSLog(@"行号:%d",index);
 
    NSDictionary *dict;

    switch (srvtype) {
        case 1:
       
            switch ((int)s1.selectedSegmentIndex) {
                case 0:
                    cell.title.text=[titlelists objectAtIndex:index];
                    switch (index) {
                        case 0:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"qymc"];
                            break;
                        case 1:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"xkzh"];
                           
                            break;
                        case 2:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"scfw"];
                            break;
                        case 3:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"scdz"];
                            break;
                        case 4:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"fzrq"];
                            break;
                        case 5:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"yxqz"];
                            break;
                        case 6:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"zszt"];
                            break;
                        case 7:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"bgqk"];
                            break;
                        case 8:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"cym"];
                            break;
                            
                        default:
                            break;
                    }

                    break;
                    
                default:
                    cell.title.text=[titlelists objectAtIndex:index];
                    switch (index) {
                        case 0:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"qymc"];
                            break;
                        case 1:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpScdz"];
                            
                            break;
                        case 2:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpZsh"];
                            break;
                        case 3:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpYsfw"];
                            break;
                        case 4:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpYszt"];
                            break;
                        case 5:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpGgh"];
                            break;
                        case 6:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpGgrq"];
                            break;
                        case 7:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpSxrq"];
                            break;
                        case 8:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpSf"];
                            break;
                        case 9:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpZszt"];
                            break;
                        case 10:
                            cell.valuetxt.text =[setdetaildata objectForKey:@"gmpBgqk"];
                            break;
                        default:
                            break;
                    }
                    break;
            }
          
            
            break;
        case 2:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                case 0:
                       cell.valuetxt.text =[setdetaildata objectForKey:@"slh"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"qymc"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"tym"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"gg"];
                    break;
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"spm"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"pzwh"];
                    break;
                case 6:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"pzrq"];
                    break;
                case 7:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"yxq"];
                    break;
                case 8:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"sxyy"];
                    break;
                case 9:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bgqk"];
                    break;
                default:
                    break;
            }
         
            break;
        case 3:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"dljg"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"scqy"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"cpmc"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"zczsh"];
                    break;
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ph"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"gg"];
                    break;
                case 6:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"sxrq"];
                    break;
                case 7:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"qfjg"];
                    break;
                case 8:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"qfrq"];
                    break;
           
                default:
                    break;
            }
            
            break;
        case 4:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {

                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"scqy"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"cpmc"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"pzwh"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ph"];
                    break;
   
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"sxrq"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"qfjg"];
                    break;
                case 6:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"qfrq"];
                    break;
                    
                default:
                    break;
            }
            
            break;
        case 5:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                    
                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"jyjl"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"nd"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"jd"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"cpwh"];
                    break;
                    
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"yylb"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"cpmc"];
                    break;
                case 6:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"spm"];
                    break;
                case 7:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bcscqy"];
                    break;
                case 8:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bcydwmc"];
                    break;
                case 9:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ph"];
                    break;
                case 10:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bhgxm"];
                    break;
                case 11:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"jydw"];
                    break;
                case 12:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bz"];
                    break;
           
            }
            
            break;
        case 6:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                    
                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"jyjl"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"nd"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"jd"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"cpwh"];
                    break;
                    
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"cpmc"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bcscqy"];
                    break;
                case 6:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bcydwmc"];
                    break;
                case 7:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ph"];
                    break;
                case 8:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"jyxm"];
                    break;
                case 9:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bhgxm"];
                    break;
                case 10:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"jyyj"];
                    break;
                case 11:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bz"];
                    break;
         
            }
            
            break;
        case 7:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                    
                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"xmmc"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"pjh"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"sqdwmc"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"szcpph"];
                    break;
                    
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"szcpsl"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"nlcsydd"];
                    break;
          
            }
            
            break;
        case 8:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                    
                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"xsymc"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"yzdw"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"lb"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"gg"];
                    break;
                    
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"syz"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"zsh"];
                    break;
                case 6:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bz"];
                    break;
                case 7:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ggh"];
                    break;
                case 8:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ggrq"];
                    break;
      
            }
            
            break;
        case 9:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                    
                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"symc"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"sccmc"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"gg"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"syz"];
                    break;
                    
                case 4:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"zsh"];
                    break;
                case 5:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"yxqx"];
                    break;
                case 6:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"bz"];
                    break;
                case 7:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ggh"];
                    break;
                case 8:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"ggrq"];
                    break;
                default:
                    break;
            }
            
            break;
        case 10:
        case 11:
            
            cell.title.text=[titlelists objectAtIndex:index];
            switch (index) {
                    
                case 0:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"tym"];
                    break;
                case 1:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"gg"];
                    break;
                case 2:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"fjm"];
                    break;
                case 3:
                    cell.valuetxt.text =[setdetaildata objectForKey:@"fjsm"];
                    break;
 
            }
            
            break;
       
            
        case 12:
            dict = [datas objectAtIndex:index];
            cell.title.text=[dict objectForKey:@"qymc"];
            
            cell.valuetxt.text =[NSString stringWithFormat:
                                 @"受理号：%@\n通用名：%@\n规格：%@\n商品名：%@\n批准文号：%@\n批准日期：%@\n有效期：%@\n失效原因：%@\n变更情况：%@",
                                 [dict objectForKey:@"slh"],
                                 [dict objectForKey:@"tym"],
                                 [dict objectForKey:@"gg"],
                                 [dict objectForKey:@"spm"],
                                 [dict objectForKey:@"pzwh"],
                                 [dict objectForKey:@"pzrq"],
                                 [dict objectForKey:@"yxq"],
                                 [dict objectForKey:@"sxyy"],
                                 [dict objectForKey:@"bgqk"]];
            break;
    
       
    }
    
    
    [cell ressetcell];
    return cell;
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
