//
//  zsm_cell.h
//  VMTSAPP
//
//  Created by appie on 15-1-9.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zsm_cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *valuetxt;

-(void)ressetcell;
-(CGFloat)getviewheight;
@end
