//
//  about.m
//  VMTSAPP
//
//  Created by appie on 15-1-16.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "about.h"
#import "Common.h"
@interface about ()

@end

@implementation about
@synthesize comment;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    comment.numberOfLines=0;
    comment.lineBreakMode=UILineBreakModeWordWrap;
    NSMutableString *info = [[NSMutableString alloc] init];
    [info appendString:@"介绍：\r"];
    [info appendString:@"本软件免费下载使用，供兽药监管单位，兽药生产与经营企业相关用户查询兽药产品信息使用。 \r\r"];
    [info appendString:@"版权单位：\r"];
    [info appendString:@"中国兽医药品监察所 \r\r"];
    
    [info appendString:@"开发及维护单位: \r"];
    [info appendString:@"江苏东大集成电路系统工程技术有限公司 \r\r"];
//    
//    [info appendString:@"开发商：\r"];
//    [info appendString:@"江苏东大集成电路系统工程技术有限公司"];
    comment.text = info;
    
    button = [[UIButton alloc] initWithFrame:comment.frame];
    [button addTarget:self action:@selector(closewindows) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
//    CGSize size = CGSizeMake(300,1000);
//    CGSize labelsize = [info sizeWithFont:comment.font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
//    
//    CGRect rect =comment.frame;
    
    
    
//    [comment setFrame:CGRectMake(rect.origin.x, rect.origin.y, labelsize.width, labelsize.height)];
    
  
    
    
    
}

-(void)closewindows
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
