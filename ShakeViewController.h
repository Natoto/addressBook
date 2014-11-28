//
//  ShakeViewController.h
//  addressBook
//
//  Created by huangbo on 14-2-27.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ShakeViewControllerDelegate <NSObject>
-(void)shakeMotionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;
-(void)shakemotionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
-(void)shakemotionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event;
@end
@interface ShakeViewController : UIViewController
{
  id <ShakeViewControllerDelegate> delegate;
  
}
@property(nonatomic,assign) SEL shakeAction;
@property (nonatomic, strong) id <ShakeViewControllerDelegate>  delegate;
@property(nonatomic,strong) NSString *telephone;

@end
