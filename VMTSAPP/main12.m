//
//  main12.m
//  VMTSAPP
//
//  Created by appie on 15-1-16.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "main12.h"
#import "query.h"

@interface main12 ()

    
@end

@implementation main12
@synthesize navbar;
@synthesize btn1;
@synthesize btn2;
@synthesize btn10;
@synthesize btn11;
@synthesize btn12;
@synthesize btn3;
@synthesize btn4;
@synthesize btn5;
@synthesize btn6;
@synthesize btn7;
@synthesize btn8;
@synthesize btn9;



- (void)viewDidLoad {
    [super viewDidLoad];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"兽药生产企业数据_2.png"] forState:UIControlStateHighlighted];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"兽药生产企业数据.png"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"兽药产品批准文号数据_2.png"] forState:UIControlStateHighlighted];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"兽药产品批准文号数据.png"] forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"进口兽药注册数据_2.png"] forState:UIControlStateHighlighted];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"进口兽药注册数据.png"] forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"国产生物制品批签发数据_2.png"] forState:UIControlStateHighlighted];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"国产生物制品批签发数据.png"] forState:UIControlStateNormal];
    [btn5 setBackgroundImage:[UIImage imageNamed:@"化药监督抽检结果数据_2.png"] forState:UIControlStateHighlighted];
    [btn5 setBackgroundImage:[UIImage imageNamed:@"化药监督抽检结果数据.png"] forState:UIControlStateNormal];
    [btn6 setBackgroundImage:[UIImage imageNamed:@"国内兽药说明书数据_2.png"] forState:UIControlStateHighlighted];
    [btn6 setBackgroundImage:[UIImage imageNamed:@"国内兽药说明书数据.png"] forState:UIControlStateNormal];
    
    
    [btn7 setBackgroundImage:[UIImage imageNamed:@"进口生物制品签发数据_2.png"] forState:UIControlStateHighlighted];
    [btn7 setBackgroundImage:[UIImage imageNamed:@"进口生物制品签发数据.png"] forState:UIControlStateNormal];
    [btn8 setBackgroundImage:[UIImage imageNamed:@"生药监督抽检结果数据_2.png"] forState:UIControlStateHighlighted];
    [btn8 setBackgroundImage:[UIImage imageNamed:@"生药监督抽检结果数据.png"] forState:UIControlStateNormal];
    
    [btn9 setBackgroundImage:[UIImage imageNamed:@"进口兽药说明书数据_2.png"] forState:UIControlStateHighlighted];
    [btn9 setBackgroundImage:[UIImage imageNamed:@"进口兽药说明书数据.png"] forState:UIControlStateNormal];
    
    
//    [btn10 setBackgroundImage:[UIImage imageNamed:@"国内兽药.png"] forState:UIControlStateHighlighted];
//    [btn10 setBackgroundImage:[UIImage imageNamed:@"国内兽药2.png"] forState:UIControlStateNormal];
//    [btn11 setBackgroundImage:[UIImage imageNamed:@"说明书数据.png"] forState:UIControlStateHighlighted];
//    [btn11 setBackgroundImage:[UIImage imageNamed:@"说明书数据2.png"] forState:UIControlStateNormal];
//    [btn12 setBackgroundImage:[UIImage imageNamed:@"兽药.png"] forState:UIControlStateHighlighted];
//    [btn12 setBackgroundImage:[UIImage imageNamed:@"兽药2.png"] forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view.
    [navbar  setBackgroundImage:[UIImage imageNamed:@"title2"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationItem *navitem = [[UINavigationItem alloc] init];
//    navitem.title =@"兽药追溯码查询";
    
    UILabel *labtitle = [[UILabel alloc] init];
    labtitle.text = @"国家兽药基础信息查询";
    labtitle.textColor=[UIColor whiteColor];
    labtitle.textAlignment=NSTextAlignmentCenter;
    labtitle.frame = CGRectMake(0, 20,[Common GetALLScreen].size.width , 20);
    
    UIButton *returnbutton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 20, 20)];
    [returnbutton addTarget:self action:@selector(selectLeftAction:) forControlEvents:UIControlEventTouchDown];
    //
    UIImage *image = [UIImage imageNamed:@"returnpng"];
    [returnbutton setBackgroundImage:image forState:UIControlStateNormal];
    

    navitem.hidesBackButton=YES;
    [navbar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:                             [UIColor whiteColor], UITextAttributeTextColor,                               [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,                             [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,                            [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont, nil]];
    [navbar addSubview:labtitle];
    [navbar addSubview:returnbutton];
    [navbar pushNavigationItem:navitem animated:YES];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectLeftAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier  isEqual: @"sqgue1"])
    {
        query *queryview = segue.destinationViewController;
        [queryview setsrvtype:srvtype];
        
   
        if ([queryview respondsToSelector:@selector(setNavtitle:)]) {
            [queryview setValue:childtitle forKey:@"Navtitle"];
        }
  
        
    }
}

-(IBAction)btn1:(id)sender
{
    childtitle = @"兽药生产企业数据查询";
    srvtype=1;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn2:(id)sender
{
    childtitle = @"兽药产品批准文号数据查询";
    srvtype=2;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn3:(id)sender
{
    childtitle = @"进口兽药注册数据查询";
    srvtype=9;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn4:(id)sender
{
    childtitle = @"国产生物制品批签发数据查询";
    srvtype=4;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn5:(id)sender
{
    childtitle = @"化药监督抽查结果数据查询";
    srvtype=5;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn6:(id)sender
{
    childtitle = @"国内兽药说明书数据查询";
    srvtype=10;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn7:(id)sender
{
    childtitle = @"进口生物制品签发数据查询";
    srvtype=3;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn8:(id)sender
{
    childtitle = @"生药监督抽检结果数据查询";
    srvtype=6;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn9:(id)sender
{
    childtitle = @"进口兽药说明书数据查询";
    srvtype=11;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn10:(id)sender
{
    childtitle = @"国内兽药说明书数据查询";
    srvtype=10;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}

-(void)btn11:(id)sender
{
    childtitle = @"进口兽药说明书数据查询";
    srvtype=11;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
}
-(void)btn12:(id)sender
{
    childtitle = @"兽药国家标准数据查询";
    srvtype=12;
    [self performSegueWithIdentifier:@"sqgue1" sender:self];
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
