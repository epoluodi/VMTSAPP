//
//  detailview.h
//  VMTSAPP
//
//  Created by appie on 15-1-23.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "main12.h"
@interface detailview : UINavigationController
{
        int srvtype;
    
}

@property (nonatomic,copy) NSString *Navtitle;
@property (nonatomic,weak) NSDictionary *Dictdata;
@property (nonatomic,copy) NSString *Infoparams;
@property (nonatomic) NSUInteger *infocounts;
@property (nonatomic) NSUInteger *nowpages;

-(void)setsrvtype:(int)_srvtype;
-(int)getsrvtype;

@end
