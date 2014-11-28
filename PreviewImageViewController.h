//
//  PreviewImageViewController.h
//  addressBook
//
//  Created by huangbo on 14-2-23.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShakeViewController.h"
@interface PreviewImageViewController : ShakeViewController
@property(nonatomic,strong)UIImageView * imgView;
-(void)reloadImgviews:(NSString *)path;

@end
