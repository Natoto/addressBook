//
//  ContactsProtrainCell.m
//  addressBook
//
//  Created by huangbo on 14-2-23.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import "ContactsPortraitCell.h"

@implementation ContactsPortraitCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-150)/2, 0, 150, 150)];
        imgview.image=[UIImage imageNamed:@"lwj.jpeg"];
        //自适应图片宽高比例
        imgview.contentMode =UIViewContentModeScaleAspectFit;// UIViewContentModeScaleAspectFit;
        self.PortrainImgName= @"lwj.jpeg";
        self.PortrainImgview=imgview;
//        self.frame=CGRectMake(0, 0, self.frame.size.width, imgview.frame.size.height);
//         imgview.center=CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
        [self addSubview:imgview];
        [self registerguester];
        // Initialization code
    }
    return self;
}

-(void)registerguester
{
    UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc]  initWithTarget:self action:@selector(tapImagview:)];
    tap.delegate=self;
    
    [self.PortrainImgview addGestureRecognizer:tap];
     self.PortrainImgview.userInteractionEnabled = YES;
    
}
//- (void)installOnView:(UIView *)view
//{
//    UITapGestureRecognizer *tapGesture;
//    
//    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//    [view addGestureRecognizer:tapGesture];
//    view.userInteractionEnabled = YES;
//}
-(IBAction)tapImagview:(id)sender
{
    if (self.delegate!= nil && [self.delegate respondsToSelector:@selector(portrainImgTap:)])
    {
        [self.delegate performSelector:@selector(portrainImgTap:) withObject:_PortrainImgName];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
