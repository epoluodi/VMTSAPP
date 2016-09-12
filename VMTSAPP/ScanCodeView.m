//
//  ScanCodeView.m
//  stereo
//
//  Created by Stereo on 15/10/20.
//  Copyright © 2015年 com.suypower.stereo. All rights reserved.
//

#import "ScanCodeView.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define scanwidth  (SCREEN_WIDTH * 0.75)

@interface ScanCodeView ()

@end

@implementation ScanCodeView
@synthesize navbar;
@synthesize backimg;
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];

    navbar.translucent =YES;
    navbar.barStyle =UIBarStyleBlackTranslucent;
    
    
    navtitle = [[UINavigationItem alloc] init];
    navtitle.title=@"扫描";
    [navbar pushNavigationItem:navtitle animated:YES];
    
    btnleft = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftclick)];
    [btnleft setTintColor:[UIColor whiteColor]];
    
    navtitle.leftBarButtonItem = btnleft;
    isReading = NO;
    [self addMask];
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    isReading =  [self startReading];
});
    
    
    
    // Do any additional setup after loading the view.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)leftclick
{
    [self stopReading];
    [self dismissViewControllerAnimated:YES completion:nil];
}




-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
     
    //判断是否有数据
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        
   
        //判断回传的数据类型
        
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            [self stopReading];
            
            enum CodeType codetype;
            
            if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode] )
                codetype = QRCode;
            else
                codetype = BarCode;
            if (delegate != nil){
                
                NSString *result=metadataObj.stringValue;//返回的扫描结果
                const NSStringEncoding *encoding = [NSString availableStringEncodings];
                NSData *data=[metadataObj.stringValue dataUsingEncoding:NSUTF8StringEncoding];
                NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
                NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];//如果中文是utf-8编码转gbk结果为空(还没搞明白)
                if (retStr)//如果扫描中文乱码则需要处理，否则不处理
                {
                    NSInteger max = [metadataObj.stringValue length];
                    char *nbytes = malloc(max + 1);
                    for (int i = 0; i < max; i++)
                    {
                        unichar ch = [metadataObj.stringValue  characterAtIndex:i];
                        nbytes[i] = (char) ch;
                    }
                    nbytes[max] = '\0';
                    result=[NSString stringWithCString: nbytes
                                              encoding: enc];
                }
                NSLog(@"处理2 编码 %@",result);
                if (!result)
                    result =metadataObj.stringValue;
                [delegate ScanCode:result CodeType:codetype];
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            });
    
            
            NSLog(@"条码 %@",metadataObj.stringValue);
        }
    }
}


- (BOOL)startReading {
    NSError *error;
    //1.初始化捕捉设备（AVCaptureDevice），类型为AVMediaTypeVideo
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //2.用captureDevice创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    //3.创建媒体数据输出流
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    //4.实例化捕捉会话
    _captureSession = [[AVCaptureSession alloc] init];
    //4.1.将输入流添加到会话
    [_captureSession addInput:input];
    //4.2.将媒体输出流添加到会话中
    [_captureSession addOutput:captureMetadataOutput];
    [_captureSession setSessionPreset:AVCaptureSessionPresetHigh];
    //5.创建串行队列，并加媒体输出流添加到队列当中
    
    dispatchQueue = dispatch_queue_create("scanQueue", NULL);
    //5.1.设置代理
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    //5.2.设置输出媒体数据类型为QRCode
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObjects:AVMetadataObjectTypeQRCode,nil]];
    //6.实例化预览图层
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    //7.设置预览图层填充方式
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    //8.设置图层的frame
    [_videoPreviewLayer setFrame:[UIScreen mainScreen].bounds];
    
    //9.将图层添加到预览view的图层上
    [self.view.layer insertSublayer:_videoPreviewLayer atIndex:0];
    //10.设置扫描范围
    captureMetadataOutput.rectOfInterest = CGRectMake(0.22f, 0.15f, 0.8f, 0.8f);


    
    //10.开始扫描
    [_captureSession startRunning];
    
    
   
    return YES;
}





-(void)stopReading{
    isReading = NO;
    [_captureSession stopRunning];
    _captureSession = nil;
    [line removeFromSuperlayer];
    line = nil;
    [_videoPreviewLayer removeFromSuperlayer];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//添加遮盖
- (void)addMask{
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 0,0,0,0.3);
    CGSize screenSize =[UIScreen mainScreen].bounds.size;
    CGRect drawRect =CGRectMake(0, 0, screenSize.width,screenSize.height);
    CGContextFillRect(ctx, drawRect);   //draw the transparent layer
    scanRect = CGRectMake(screenSize.width /2  - scanwidth /2, screenSize.height /2  -scanwidth /2, scanwidth,scanwidth);
    CGContextClearRect(ctx, scanRect);  //clear the center rect  of the layer
    CGContextSetRGBStrokeColor(ctx,1,1,1,1);
    CGContextStrokeRectWithWidth(ctx,scanRect,1);
    UIImage* returnimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    backimg.image =returnimage;
    line = [[CALayer alloc] init];
    line.contents = (id)[[UIImage imageNamed:@"scanline.png.png"] CGImage];
    
    line.frame = CGRectMake(scanRect.origin.x , scanRect.origin.y +2, scanRect.size.width, 2);
    [backimg.layer addSublayer:line];
    
    
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"请将一维条码，二维码，放入扫描框内";
    [lab setFont:[UIFont systemFontOfSize:12]];
    [lab setTextColor:[UIColor whiteColor]];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.frame = CGRectMake(scanRect.origin.x, scanRect.size.height + 5 + scanRect.origin.y, scanwidth, 40);
    [backimg addSubview:lab];
    
    dispatch_queue_t mainQ = dispatch_get_main_queue();
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC);
    dispatch_after(popTime, mainQ, ^(void){
         [self lineAnimation];
    });
    return ;
}



-(void)lineAnimation
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 2.1f;
    animation.autoreverses=YES;
    animation.repeatCount = MAXFLOAT;
    animation.timingFunction
    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    
    animation.fromValue
    = [NSValue valueWithCGPoint:CGPointMake( line.anchorPoint.x * SCREEN_WIDTH, scanRect.origin.y +2)];
    animation.toValue
    = [NSValue valueWithCGPoint:CGPointMake(line.anchorPoint.x * SCREEN_WIDTH, scanRect.origin.y + scanRect.size.height-2)];
    [line addAnimation:animation forKey:nil];
    
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
