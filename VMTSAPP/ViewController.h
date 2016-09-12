//
//  ViewController.h
//  VMTSAPP
//
//  Created by appie on 15-1-4.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UINavigationControllerDelegate>
{
   
}
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;




-(IBAction)button1:(id)sender;
-(IBAction)button2:(id)sender;
-(IBAction)button3 :(id)sender;
-(IBAction)button4:(id)sender;


@end

