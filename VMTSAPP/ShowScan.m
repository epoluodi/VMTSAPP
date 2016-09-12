//
//  ShowScan.m
//  VMTSAPP
//
//  Created by appie on 15-1-5.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "ShowScan.h"


@implementation ShowScan
@synthesize line;


int num;
BOOL upOrdown;
NSTimer * timer;


-(void)ShowScan2D:(UIViewController<Scan2dDelegate>*)Mainview
{
    scan2ddelegate =Mainview;
    num = 0;
    upOrdown = NO;
    //初始话ZBar
    ZBarReaderViewController * reader = [ZBarReaderViewController new];
    //设置代理
    reader.readerDelegate = self;
    //支持界面旋转
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    reader.showsHelpOnFail = NO;
    
    reader.scanCrop = CGRectMake(0.22f, 0.15f, 0.8f, 0.8f);
    //    reader.scanCrop = CGRectMake(0.1, 0.2, 0.8, 0.8);//扫描的感应框
    ZBarImageScanner * scanner = reader.scanner;
    [scanner setSymbology:ZBAR_I25
                   config:ZBAR_CFG_ENABLE
                       to:0];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
    view.backgroundColor = [UIColor clearColor];
    reader.cameraOverlayView = view;
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
    label.text = @"请将兽药二维码至于扫描框中";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.lineBreakMode = 0;
    label.numberOfLines = 2;
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick_bg.png"]];
    image.frame = CGRectMake(20, 80, 280, 280);
    [view addSubview:image];
    
    line = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 220, 2)];
    line.image = [UIImage imageNamed:@"line.png"];
    [image addSubview:line];
    //定时器，设定时间过1.5秒，
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
    [Mainview presentViewController:reader animated:YES completion:^{
        
    }];
    
    
}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        line.frame = CGRectMake(30, 2*num, 220, 2);
        if (2*num == 280) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        line.frame = CGRectMake(30, 2*num, 220, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [timer invalidate];
    line.frame = CGRectMake(30, 10, 220, 2);
    num = 0;
    upOrdown = NO;
    [picker dismissViewControllerAnimated:YES completion:^{
        [picker removeFromParentViewController];
    }];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [timer invalidate];
    num = 0;
    upOrdown = NO;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [picker removeFromParentViewController];}];
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    
    NSString * result;
    result =symbol.data;
    //        if ([symbol.data canBeConvertedToEncoding:NSShiftJISStringEncoding])
    //
    //        {
    //            result = [NSString stringWithCString:[symbol.data cStringUsingEncoding: NSShiftJISStringEncoding] encoding:NSUTF8StringEncoding];
    //        }
    //        else
    //        {
    //            result =symbol.data;
    //        }
    
    [scan2ddelegate ScanFinish:result];
    NSLog(@"%@",result);
    
    
}
/*
 -(NSString *)EncodeGB2312Str:(NSString *)encodeStr{
 CFStringRef nonAlphaNumValidChars = CFSTR("![        DISCUZ_CODE_1        ]’()*+,-./:;=?@_~");
 NSString *preprocessedString = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (CFStringRef)encodeStr, CFSTR(""), kCFStringEncodingGB_18030_2000));
 NSString *newStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)preprocessedString,NULL,nonAlphaNumValidChars,kCFStringEncodingGB_18030_2000));
 
 return newStr;
 }
 
 -(NSString *)EncodeUTF8Str:(NSString *)encodeStr{
 CFStringRef nonAlphaNumValidChars = CFSTR("![        DISCUZ_CODE_1        ]’()*+,-./:;=?@_~");
 NSString *preprocessedString = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (CFStringRef)encodeStr, CFSTR(""), kCFStringEncodingUTF8));
 NSString *newStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)preprocessedString,NULL,nonAlphaNumValidChars,kCFStringEncodingUTF8)) ;
 
 return newStr;
 }*/

@end
