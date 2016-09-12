//
//  zsm_cell.m
//  VMTSAPP
//
//  Created by appie on 15-1-9.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "zsm_cell.h"
#import "Common.h"
@implementation zsm_cell
@synthesize title;
@synthesize valuetxt;
- (void)awakeFromNib {
    // Initialization code
    
}

-(id)init
{
    
    
    
    valuetxt.numberOfLines=0;
    valuetxt.lineBreakMode=UILineBreakModeCharacterWrap;
    
    title.frame = CGRectMake(title.frame.origin.x, title.frame.origin.y, self.frame.size.width-10, title.frame.size.height);
    self.Frame=CGRectMake(0, 0, [Common GetScreen].size.width, 85);
    
    return [super init];
}

-(CGFloat)getviewheight
{
   
    return title.frame.size.height+valuetxt.frame.size.height+30;
}
-(void)ressetcell
{
    NSString *info = valuetxt.text;
    NSString *titleinfo = title.text;
    CGSize infosize = [info sizeWithFont:valuetxt.font constrainedToSize:CGSizeMake([Common GetScreen].size.width-10, 1000)];
        CGSize titlesize = [titleinfo sizeWithFont:title.font constrainedToSize:CGSizeMake([Common GetScreen].size.width-10, 1000)];
    
    
    title.numberOfLines=0;
    title.lineBreakMode=UILineBreakModeCharacterWrap;
    title.Frame=CGRectMake(title.frame.origin.x, title.frame.origin.y,
                           [Common GetScreen].size.width-20, titlesize.height);
    
    valuetxt.numberOfLines=0;
    valuetxt.lineBreakMode=UILineBreakModeCharacterWrap;

    valuetxt.Frame=CGRectMake(title.frame.origin.x, title.frame.origin.y +
                                title.frame.size.height +5, [Common GetScreen].size.width-20, infosize.height);
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, title.frame.size.height+valuetxt.frame.size.height+10, self.frame.size.width);
  

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
