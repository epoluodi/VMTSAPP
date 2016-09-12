//
//  SheetUI.m
//  VMTSAPP
//
//  Created by appie on 15-1-19.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "SheetUI.h"
#import "Common.h"
@implementation SheetUI




//
-(UIAlertController*)SHowSheetQuery1:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{

  
    NSString *str1  =@"企业名称";
    NSString *str2  =@"许可证号";
    NSString *str3  =@"GMP证号";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
                                                   }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"qymc",@"itemname",
                            @"qymc",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"xkzh",@"itemname",@"xkzh",@"itemfieldname", ed2.text,@"itemval",@"String",@"itemtype",   @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"gmpZsh",@"itemname",
                            @"gmp_Zsh",@"itemfieldname", ed3.text,@"itemval",@"String",@"itemtype",   @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        NSLog(@"jsondata:%@",[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]);
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
      
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];

 

    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
  


    
//    [ed1 setBackgroundColor:[UIColor grayColor]];
//    [ed2 setBackgroundColor:[UIColor clearColor]];
//    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;
    
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize3.width, titleSize.height);
    l3.text=str3;
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;

    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    ed3.frame =CGRectMake(ed1.frame.origin.x, ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];
    
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];
    
    
    return alert;

}



-(UIAlertController*)SHowSheetQuery2:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"企业名称";
    NSString *str2  =@"通用名";
    NSString *str3  =@"商品名";
    NSString *str4  =@"批准文号";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];
    __block UILabel *l4 = [[UILabel alloc] init];
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];
    __block UITextField *ed4 = [[UITextField alloc] init];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"qymc",@"itemname",
                            @"qymc",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"tym",@"itemname",
                            @"tym",@"itemfieldname", ed2.text,@"itemval",
                            @"String",@"itemtype", @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"spm",@"itemname",
                            @"spm",@"itemfieldname"
                            ,ed3.text,@"itemval",
                            @"String",@"itemtype",   @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed4.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"pzwh",@"itemname",
                            @"pzwh",@"itemfieldname",
                            ed4.text,@"itemval",
                            @"String",@"itemtype",   @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);

        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed3.adjustsFontSizeToFitWidth =YES;
    ed4.adjustsFontSizeToFitWidth =YES;
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;
    ed4.borderStyle = UITextBorderStyleRoundedRect;
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize3.width, titleSize.height);
    l3.text=str3;
    
    l4.frame =CGRectMake(10, l3.frame.origin.y+l3.frame.size.height+20, titleSize.width, titleSize.height);
    l4.text=str4;
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    
    ed3.frame =CGRectMake(ed1.frame.origin.x, ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    
    ed4.frame =CGRectMake(ed1.frame.origin.x, ed3.frame.origin.y+ ed3.frame.size.height+ 10,width - l4.frame.size.width -90 , titleSize.height+10);
    ed4.delegate =queryview;
    [ed4 setReturnKeyType:UIReturnKeyDone];
    
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];
    [alert.view addSubview:l4];
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];
    [alert.view addSubview:ed4];
    
    return alert;
    
}



-(UIAlertController*)SHowSheetQuery3:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"生产企业";
    NSString *str2  =@"代理机构";
    NSString *str3  =@"产品名称";
    NSString *str4  =@"证书号";
    NSString *str5  =@"批号";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];
    __block UILabel *l4 = [[UILabel alloc] init];
    __block UILabel *l5 = [[UILabel alloc] init];
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];
    __block UITextField *ed4 = [[UITextField alloc] init];
    __block UITextField *ed5 = [[UITextField alloc] init];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"scqy",@"itemname",
                            @"scqy",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"dljg",@"itemname",
                            @"dljg",@"itemfieldname",
                            ed2.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"cpmc",@"itemname",
                            @"cpmc",@"itemfieldname"
                            ,ed3.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed4.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"zczsh",@"itemname",
                            @"zczsh",@"itemfieldname",
                            ed4.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed5.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"ph",@"itemname",
                            @"ph",@"itemfieldname",
                            ed5.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed3.adjustsFontSizeToFitWidth =YES;
    ed4.adjustsFontSizeToFitWidth =YES;
    ed5.adjustsFontSizeToFitWidth =YES;
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;
    ed4.borderStyle = UITextBorderStyleRoundedRect;
    ed5.borderStyle = UITextBorderStyleRoundedRect;
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    CGSize titleSize5 = [str5 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize.width, titleSize.height);
    l3.text=str3;
    
    l4.frame =CGRectMake(10, l3.frame.origin.y+l3.frame.size.height+20, titleSize.width, titleSize.height);
    l4.text=str4;
    
    l5.frame =CGRectMake(10, l4.frame.origin.y+l4.frame.size.height+20, titleSize5.width, titleSize.height);
    l5.text=str5;
    
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    
    ed3.frame =CGRectMake(ed1.frame.origin.x, ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    
    ed4.frame =CGRectMake(ed1.frame.origin.x, ed3.frame.origin.y+ ed3.frame.size.height+ 10,width - l4.frame.size.width -90 , titleSize.height+10);
    ed4.delegate =queryview;
    [ed4 setReturnKeyType:UIReturnKeyDone];
    
    ed5.frame =CGRectMake(ed1.frame.origin.x, ed4.frame.origin.y+ ed4.frame.size.height+ 10,width - l4.frame.size.width -90 , titleSize.height+10);
    ed5.delegate =queryview;
    [ed5 setReturnKeyType:UIReturnKeyDone];
    
    
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];
    [alert.view addSubview:l4];
    [alert.view addSubview:l5];
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];
    [alert.view addSubview:ed4];
    [alert.view addSubview:ed5];
    return alert;
    
}


-(UIAlertController*)SHowSheetQuery4:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"生产企业";
    NSString *str2  =@"产品名称";
    NSString *str3  =@"批号";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];

    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"scqy",@"itemname",
                            @"scqy",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"cpmc",@"itemname",
                            @"cpmc",@"itemfieldname",
                            ed2.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"ph",@"itemname",
                            @"ph",@"itemfieldname"
                            ,ed3.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }

        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed3.adjustsFontSizeToFitWidth =YES;

    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;

    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
//    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize.width, titleSize.height);
    l3.text=str3;
    

    
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    
    ed3.frame =CGRectMake(ed1.frame.origin.x, ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    

    
    
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];

    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];

    return alert;
    
}




-(UIAlertController*)SHowSheetQuery5:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"企业名称";
    NSString *str2  =@"年度";
    NSString *str3  =@"产品文号(5、6两位)";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];
    __block UISegmentedControl *s1 = [[UISegmentedControl alloc] init];
    __block UISegmentedControl *s2 = [[UISegmentedControl alloc] init];
    
    
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"bcscqy",@"itemname",
                            @"bcscqy",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"nd",@"itemname",
                            @"nd",@"itemfieldname",
                            ed2.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            @"equal",@"compareType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"substr(cpwh,5,2)",@"itemname",
                            @"substr(cpwh,5,2)",@"itemfieldname"
                            ,ed3.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        if (s1.selectedSegmentIndex !=0)
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"jd",@"itemname",
                            @"jd",@"itemfieldname"
                            ,[NSString stringWithFormat:@"%i", s1.selectedSegmentIndex],@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            @"equal",@"compareType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        

        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        switch (s2.selectedSegmentIndex) {
            case 0:
                [queryview SetqueryDataTypeParams:@"all"];
                break;
            case 1:
                [queryview SetqueryDataTypeParams:@"hg"];
                break;
            case 2:
                [queryview SetqueryDataTypeParams:@"bhg"];
                break;
            case 3:
                [queryview SetqueryDataTypeParams:@"jsy"];
                break;
            default:
                break;
        }
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed3.adjustsFontSizeToFitWidth =YES;
    
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    CGSize titleSize2 = [str2 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(500, 30)];
    
    //    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize2.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize3.width, titleSize3.height);
    l3.text=str3;
    
    
    
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l1.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    
    ed3.frame =CGRectMake(l3.frame.size.width+30, ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l3.frame.size.width -90 , titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    
    [s1 insertSegmentWithTitle:@"一季度" atIndex:0 animated:YES];
    [s1 insertSegmentWithTitle:@"二季度" atIndex:1 animated:YES];
    [s1 insertSegmentWithTitle:@"三季度" atIndex:2 animated:YES];
    [s1 insertSegmentWithTitle:@"四季度" atIndex:3 animated:YES];
    [s1 insertSegmentWithTitle:@"全部" atIndex:0 animated:YES];
    
    [s2 insertSegmentWithTitle:@"全部" atIndex:0 animated:YES];
    [s2 insertSegmentWithTitle:@"合格" atIndex:1 animated:YES];
    [s2 insertSegmentWithTitle:@"不合格" atIndex:2 animated:YES];
    [s2 insertSegmentWithTitle:@"假售药" atIndex:3 animated:YES];
 
    
    s1.frame =CGRectMake(10, ed3.frame.origin.y+ ed3.frame.size.height+ 10,
                         width -70 , 50);

    s2.frame =CGRectMake(10, s1.frame.origin.y+ s1.frame.size.height+ 10,
                         width -70 , 50);
    
    s1.selectedSegmentIndex=0;
    s2.selectedSegmentIndex=0;
    [ed2 setKeyboardType:UIKeyboardTypeNumberPad];
    
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];
    
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];
    
    [alert.view addSubview:s1];
    [alert.view addSubview:s2];
    return alert;
    
}



-(UIAlertController*)SHowSheetQuery6:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"企业名称";
    NSString *str2  =@"年度";
    NSString *str3  =@"产品文号(5、6两位)";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];
    __block UISegmentedControl *s1 = [[UISegmentedControl alloc] init];
    __block UISegmentedControl *s2 = [[UISegmentedControl alloc] init];
    
    
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"bcscqy",@"itemname",
                            @"bcscqy",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"nd",@"itemname",
                            @"nd",@"itemfieldname",
                            ed2.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            @"equal",@"compareType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"substr(F_GetQydmOfPzwh(cpwh),1,2)",@"itemname",
                            @"substr(F_GetQydmOfPzwh(cpwh),1,2)",@"itemfieldname"
                            ,ed3.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        if (s1.selectedSegmentIndex !=0)
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"jd",@"itemname",
                            @"jd",@"itemfieldname"
                            ,[NSString stringWithFormat:@"%i", s1.selectedSegmentIndex],@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            @"equal",@"compareType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        
        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        switch (s2.selectedSegmentIndex) {
            case 0:
                [queryview SetqueryDataTypeParams:@"all"];
                break;
            case 1:
                [queryview SetqueryDataTypeParams:@"hg"];
                break;
            case 2:
                [queryview SetqueryDataTypeParams:@"bhg"];
                break;

            default:
                break;
        }
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed3.adjustsFontSizeToFitWidth =YES;
    
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    CGSize titleSize2 = [str2 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(500, 30)];
    
    //    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize2.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize3.width, titleSize3.height);
    l3.text=str3;
    
    
    
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l1.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    
    ed3.frame =CGRectMake(l3.frame.size.width+30, ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l3.frame.size.width -90 , titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    
    [s1 insertSegmentWithTitle:@"一季度" atIndex:0 animated:YES];
    [s1 insertSegmentWithTitle:@"二季度" atIndex:1 animated:YES];
    [s1 insertSegmentWithTitle:@"三季度" atIndex:2 animated:YES];
    [s1 insertSegmentWithTitle:@"四季度" atIndex:3 animated:YES];
    [s1 insertSegmentWithTitle:@"全部" atIndex:0 animated:YES];
    
    [s2 insertSegmentWithTitle:@"全部" atIndex:0 animated:YES];
    [s2 insertSegmentWithTitle:@"合格" atIndex:1 animated:YES];
    [s2 insertSegmentWithTitle:@"不合格" atIndex:2 animated:YES];

    
    
    s1.frame =CGRectMake(10, ed3.frame.origin.y+ ed3.frame.size.height+ 10,
                         width -70 , 50);
    
    s2.frame =CGRectMake(10, s1.frame.origin.y+ s1.frame.size.height+ 10,
                         width -70 , 50);
    
    s1.selectedSegmentIndex=0;
    s2.selectedSegmentIndex=0;
    [ed2 setKeyboardType:UIKeyboardTypeNumberPad];
    
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];
    
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];
    
    [alert.view addSubview:s1];
    [alert.view addSubview:s2];
    return alert;
    
}




//
-(UIAlertController*)SHowSheetQuery7:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"项目名称";
    NSString *str2  =@"批件号";
    NSString *str3  =@"申请单位名称";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"xmmc",@"itemname",
                            @"xmmc",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"pjh",@"itemname",
                            @"pjh",@"itemfieldname",
                            ed2.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"sqdwmc",@"itemname",
                            @"sqdwmc",@"itemfieldname",
                            ed3.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        NSLog(@"jsondata:%@",[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]);
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;
    
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    CGSize titleSize3 = [str3 sizeWithFont:l3.font constrainedToSize:CGSizeMake(500, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize3.width, titleSize.height);
    l3.text=str3;
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    
    ed3.frame =CGRectMake(l3.frame.origin.x + l3.frame.size.width + 30, ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l3.frame.size.width -100 ,
                          titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];
    
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];
    
    
    return alert;
    
}




-(UIAlertController*)SHowSheetQuery8:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"兽药名称";
    NSString *str2  =@"证书号";

    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
 
    __block UISegmentedControl *s1 = [[UISegmentedControl alloc] init];
    
    
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];

    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"xsymc",@"itemname",
                            @"xsymc",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"zsh",@"itemname",
                            @"zsh",@"itemfieldname",
                            ed2.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                        
                            nil];
            [dictarray addObject:nsdictionary];
        }
   
        
        if (s1.selectedSegmentIndex !=0)
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"lb",@"itemname",
                            @"lb",@"itemfieldname",
                            [s1 titleForSegmentAtIndex:s1.selectedSegmentIndex],@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",
                            @"equal",@"compareType",
                            nil];
            [dictarray addObject:nsdictionary];
        }
        
        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
     
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
  
    
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
 
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
 

    
    //    CGSize titleSize3 = [str3 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize.width, titleSize.height);
    l2.text=str2;
    
   
    
    
    
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l1.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    

    
    [s1 insertSegmentWithTitle:@"一类" atIndex:0 animated:YES];
    [s1 insertSegmentWithTitle:@"二类" atIndex:1 animated:YES];
    [s1 insertSegmentWithTitle:@"三类" atIndex:2 animated:YES];
    [s1 insertSegmentWithTitle:@"四类" atIndex:3 animated:YES];
    [s1 insertSegmentWithTitle:@"五类" atIndex:3 animated:YES];
    [s1 insertSegmentWithTitle:@"全部" atIndex:0 animated:YES];
    

    
    
    
    s1.frame =CGRectMake(10, ed2.frame.origin.y+ ed2.frame.size.height+ 10,
                         width -70 , 50);
    

    
    s1.selectedSegmentIndex=0;
   
   
    
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
  
    
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
   
    
    [alert.view addSubview:s1];
  
    return alert;
    
}


-(UIAlertController*)SHowSheetQuery9:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"兽药名称";
    NSString *str2  =@"生产企业";
    NSString *str3  =@"证书号";
    __block UILabel *l1 = [[UILabel alloc] init];
    __block UILabel *l2 = [[UILabel alloc] init];
    __block UILabel *l3 = [[UILabel alloc] init];
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    __block UITextField *ed2 = [[UITextField alloc] init];
    __block UITextField *ed3 = [[UITextField alloc] init];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"symc",@"itemname",
                            @"symc",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed2.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"sccmc",@"itemname",
                            @"sccmc",@"itemfieldname",
                            ed2.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        if (![ed3.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"zsh",@"itemname",
                            @"zsh",@"itemfieldname",
                            ed3.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        NSLog(@"jsondata:%@",[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]);
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed2.adjustsFontSizeToFitWidth =YES;
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    ed2.borderStyle = UITextBorderStyleRoundedRect;
    ed3.borderStyle = UITextBorderStyleRoundedRect;
    
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    CGSize titleSize3 = [str3 sizeWithFont:l3.font constrainedToSize:CGSizeMake(500, 30)];
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    l2.frame =CGRectMake(10, l1.frame.origin.y+ l1.frame.size.height+ 20, titleSize.width, titleSize.height);
    l2.text=str2;
    
    l3.frame =CGRectMake(10, l2.frame.origin.y+l2.frame.size.height+20, titleSize3.width, titleSize.height);
    l3.text=str3;
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    ed2.frame =CGRectMake(ed1.frame.origin.x, ed1.frame.origin.y+ ed1.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed2.delegate =queryview;
    [ed2 setReturnKeyType:UIReturnKeyDone];
    
    ed3.frame =CGRectMake(ed1.frame.origin.x , ed2.frame.origin.y+ ed2.frame.size.height+ 10,width - l2.frame.size.width -90 , titleSize.height+10);
    ed3.delegate =queryview;
    [ed3 setReturnKeyType:UIReturnKeyDone];
    
    [alert.view addSubview:l1];
    [alert.view addSubview:l2];
    [alert.view addSubview:l3];
    
    [alert.view addSubview:ed1];
    [alert.view addSubview:ed2];
    [alert.view addSubview:ed3];
    
    
    return alert;
    
}



-(UIAlertController*)SHowSheetQuery10:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"通用名";

    __block UILabel *l1 = [[UILabel alloc] init];

    
    __block UITextField *ed1 = [[UITextField alloc] init];

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"tym",@"itemname",
                            @"tym",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }

        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        NSLog(@"jsondata:%@",[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]);
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
 
    ed1.borderStyle = UITextBorderStyleRoundedRect;

    
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
 
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;

    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    

    
    [alert.view addSubview:l1];

    
    [alert.view addSubview:ed1];

    
    
    return alert;
    
}


-(UIAlertController*)SHowSheetQuery11:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"通用名";
    
    __block UILabel *l1 = [[UILabel alloc] init];
    
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"tym",@"itemname",
                            @"tym",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        NSLog(@"jsondata:%@",[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]);
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    
    
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    
    
    [alert.view addSubview:l1];
    
    
    [alert.view addSubview:ed1];
    
    
    
    return alert;
    
}



-(UIAlertController*)SHowSheetQuery12:(NSObject<queryparams,UITextFieldDelegate> *)queryview
{
    
    
    NSString *str1  =@"标准名称";
    
    __block UILabel *l1 = [[UILabel alloc] init];
    
    
    __block UITextField *ed1 = [[UITextField alloc] init];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alert.title=@"搜索信息";
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview cancelquery];
        NSLog(@"cancle action");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:NSLocalizedString(@"搜索", @"query") style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        NSDictionary *nsdictionary;
        if (![ed1.text isEqualToString:@""])
        {
            nsdictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"bzmc",@"itemname",
                            @"bzmc",@"itemfieldname",
                            ed1.text,@"itemval",
                            @"String",@"itemtype",
                            @"val",@"condType",nil];
            [dictarray addObject:nsdictionary];
        }
        
        
        
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictarray options:kNilOptions  error:nil];
        NSLog(@"jsondata:%@",JSONData);
        NSLog(@"jsondata:%@",[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]);
        NSString *jsonstr =[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        
        
        
        
        
        [queryview SetqueryParams:jsonstr];
        
        
    }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    
    //自定义搜索界面
    
    
    
    
    
    //    [ed1 setBackgroundColor:[UIColor grayColor]];
    //    [ed2 setBackgroundColor:[UIColor clearColor]];
    //    [ed3 setBackgroundColor:[UIColor clearColor]];
    
    ed1.adjustsFontSizeToFitWidth =YES;
    
    ed1.borderStyle = UITextBorderStyleRoundedRect;
    
    
    
    CGSize titleSize = [str1 sizeWithFont:l1.font constrainedToSize:CGSizeMake(100, 30)];
    
    
    
    l1.frame =CGRectMake(10, 50, titleSize.width, titleSize.height);
    l1.text=str1;
    
    
    ed1.frame =CGRectMake(l1.frame.size.width+30, 50,width - l1.frame.size.width -90 , titleSize.height+10);
    ed1.delegate =queryview;
    
    [ed1 setReturnKeyType:UIReturnKeyDone];
    
    
    
    [alert.view addSubview:l1];
    
    
    [alert.view addSubview:ed1];
    
    
    
    return alert;
    
}

@end

