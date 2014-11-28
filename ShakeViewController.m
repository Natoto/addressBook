//
//  ShakeViewController.m
//  addressBook
//
//  Created by huangbo on 14-2-27.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import "ShakeViewController.h"
#import "UIResponder+MotionRecognizers.h"
@interface ShakeViewController ()

@end

@implementation ShakeViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    if (self.shakeAction) {
        [self addMotionRecognizerWithAction:self.shakeAction];
    }

}
-(void)viewDidDisappear:(BOOL)animated
{
    [self removeMotionRecognizer];
}

@end
