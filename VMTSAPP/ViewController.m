//
//  ViewController.m
//  VMTSAPP
//
//  Created by appie on 15-1-4.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize button1,button2,button3,button4;

- (void)viewDidLoad {
    [super viewDidLoad];

    [button1 setImage:[UIImage imageNamed:@"main1_2.png"] forState:UIControlStateHighlighted];
    [button1 setImage:[UIImage imageNamed:@"main1_1.png"] forState:UIControlStateNormal];
    
    [button2 setImage:[UIImage imageNamed:@"main2_2.png"] forState:UIControlStateHighlighted];
    [button2 setImage:[UIImage imageNamed:@"main2_1.png"] forState:UIControlStateNormal];
    
    [button3 setImage:[UIImage imageNamed:@"main3_2.png"] forState:UIControlStateHighlighted];
    [button3 setImage:[UIImage imageNamed:@"main3_1.png"] forState:UIControlStateNormal];
    
    [button4 setImage:[UIImage imageNamed:@"main4_2.png"] forState:UIControlStateHighlighted];
    [button4 setImage:[UIImage imageNamed:@"main4_1.png"] forState:UIControlStateNormal];
    

//    [image sendSubviewToBack:button];
//    [image sendSubviewToBack:button2];
    // Do any additional setup after loading the view, typically from a nib.
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///扫描二维码
-(void)button1:(id)sender
{
//    [showscan ShowScan2D:self];
     [self performSegueWithIdentifier:@"scan" sender:self];
}


///基本信息查询
-(void)button2:(id)sender
{
//  [[UIApplication sharedApplication] openURL:
//   [[NSURL alloc] initWithString:@"http://sysjk.ivdc.org.cn:8081/cx/"]];
    //
}






///拍照取证
-(void)button3:(id)sender
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
    //        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //    }
    //sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    //sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    
    picker.sourceType = sourceType;
    [self presentModalViewController:picker animated:YES];//进入照相界面
    
    
  
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"SMILE!");
//    [self.capturedImages addObject:image];
    
//    if ([self.cameraTimer isValid])
//    {
//        return;
//    }
    
   
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
//    [self finishAndUpdate];
}

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
    UIAlertView *alert;
    
    if (error)
    {
        alert = [[UIAlertView alloc] initWithTitle:@"错误"
                                           message:@"保存失败"
                                          delegate:self cancelButtonTitle:@"确定"
                                 otherButtonTitles:nil];
    }
    else
    {
        alert = [[UIAlertView alloc] initWithTitle:@"成功"
                                           message:@"保存成功"
                                          delegate:self cancelButtonTitle:@"确定"
                                 otherButtonTitles:nil];
    }
    [alert show];
    
}

///关于
-(void)button4:(id)sender
{
    //
    
    
}


-(void)showAlera
{
    UIAlertView *uialertview =[[UIAlertView alloc] init];
    uialertview.message=@"此功能暂未开放";
    [uialertview addButtonWithTitle:@"确定"];
    [uialertview show];

}
@end
