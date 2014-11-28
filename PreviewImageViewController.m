//
//  PreviewImageViewController.m
//  addressBook
//
//  Created by huangbo on 14-2-23.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import "PreviewImageViewController.h" 
#import "UIResponder+MotionRecognizers.h"

@interface PreviewImageViewController ()

@end

@implementation PreviewImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//-(void)setImgView:(UIImageView *)newimgView
//{
//    if (_imgView!=newimgView) {
//        
//        _imgView=newimgView;
//    }
//}

#pragma mark - SuperDBEditCell Overrides
//-(UIImageView*)imgView
//{
//    return self.imgView;
//}

-(void)reloadImgviews:(NSString *)path
{
    if (self.imgView) {
        [self.imgView removeFromSuperview];
        self.imgView=nil;
    }
    NSString *imgname=[NSString stringWithFormat:@"%@",path];
    UIImage *image=[UIImage imageNamed:imgname];
    UIImageView *imageview=[[UIImageView alloc] initWithFrame:self.view.frame];
    imageview.image=image;
    imageview.contentMode=UIViewContentModeScaleAspectFit;
    self.imgView=imageview;
    [self.view addSubview:self.imgView];
    
}
/*
-(void)motionWasRecognized:(NSNotification*)notif
{
    if (self.telephone.length) {
        NSString *url=[NSString stringWithFormat:@"tel://%@",self.telephone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [self addMotionRecognizerWithAction:@selector(motionWasRecognized:)];

}
-(void)viewDidDisappear:(BOOL)animated
{
  [self removeMotionRecognizer];
}*/

-(void)motionWasRecognized:(NSNotification*)notif
{
    if (self.telephone.length) {
        NSString *url=[NSString stringWithFormat:@"tel://%@",self.telephone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    self.shakeAction=@selector(motionWasRecognized:);
//    UIButton *closebtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [closebtn setTitle:@"关闭预览" forState:UIControlStateNormal];
//    closebtn.frame=CGRectMake(5, 5, 80, 40);
//    [closebtn addTarget:self action:@selector(closeBtnTap:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:closebtn];
    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
 
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
   
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:recognizer];
 
    
    UISwipeGestureRecognizer *downrecognizer;
    downrecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [downrecognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view] addGestureRecognizer:downrecognizer];
  
}
-(IBAction)closeBtnTap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"swipe down");
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        //执行程序
    }
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
        //执行程序
    }
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left");
        //执行程序
//        [self nextImage:YES index:currentIndex];
    }
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right");
        //执行程序
//        [self nextImage:NO index:currentIndex];
    }
}

-(IBAction)handleSingleTap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(IBAction)dismissbtnTap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}




@end
