//
//  ShowScan.h
//  VMTSAPP
//
//  Created by appie on 15-1-5.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBarSDK.h"
@protocol Scan2dDelegate


- (void)ScanFinish:(NSString *)data;
@end

@interface ShowScan : NSObject<ZBarReaderDelegate>
{
    NSObject<Scan2dDelegate> * scan2ddelegate;
}

@property (nonatomic, strong) UIImageView * line;

-(void)ShowScan2D:(UIViewController*) Mainview;



@end



