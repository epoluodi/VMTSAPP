//
//  webview.m
//  VMTSAPP
//
//  Created by appie on 15-1-15.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "webview.h"



@implementation webview
@synthesize webview;
@synthesize navbar;
@synthesize strurl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [navbar  setBackgroundImage:[UIImage imageNamed:@"title2"] forBarMetrics:UIBarMetricsDefault];
    
    navitem = [[UINavigationItem alloc] init];
    navitem.title =@"";
    
    
    
    UIButton *returnbutton = [[UIButton alloc] initWithFrame:CGRectMake(5, 16, 24, 24)];
    [returnbutton addTarget:self action:@selector(selectLeftAction:) forControlEvents:UIControlEventTouchDown];
    //
    UIImage *image = [UIImage imageNamed:@"returnpng"];
    [returnbutton setBackgroundImage:image forState:UIControlStateNormal];
    
    navitem.hidesBackButton=YES;
    [navbar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:                             [UIColor whiteColor], UITextAttributeTextColor,                               [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,                             [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,                            [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont, nil]];
    
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
