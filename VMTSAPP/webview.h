//
//  webview.h
//  VMTSAPP
//
//  Created by appie on 15-1-15.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webview : UIViewController
{
    UINavigationItem *navitem;
}

@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;
@property (nonatomic,copy) NSString *strurl;
@end
