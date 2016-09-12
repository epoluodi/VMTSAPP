//
//  detailview.m
//  VMTSAPP
//
//  Created by appie on 15-1-23.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "detailview.h"
#import "Common.h"

@interface detailview ()

@end

@implementation detailview

@synthesize Navtitle;
@synthesize Dictdata;
@synthesize Infoparams;
@synthesize infocounts;
@synthesize nowpages;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    infocounts = 0;
    nowpages = 0;

    [self navigationItem].title=Navtitle;
 
//    [[self navigationBar] setBackgroundColor:[UIColor clearColor]];
    
    
    
       
    //    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(selectLeftAction:)];
    

    
    //    [leftButton setBackgroundImage:[UIImage imageNamed:@"returnpng"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //    [leftButton setWidth:24];
    
    //    [navitem setLeftBarButtonItem:nil];
//    navitem.hidesBackButton=YES;
//    [navbar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:                             [UIColor whiteColor], UITextAttributeTextColor,                               [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,                             [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,                            [UIFont fontWithName:@"Arial-Bold" size:15], UITextAttributeFont, nil]];
    

 
//    switch (viewtype) {
//        case 1:
//            m=[[main12 alloc] init];
//            [self pushViewController:m animated:YES];
//            break;
//            
//        default:
//            break;
//    }
    

}


-(int)getsrvtype
{
    return srvtype;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)setsrvtype:(int)_srvtype
{
    srvtype = _srvtype;
    switch (srvtype) {
        case 1:
   
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
