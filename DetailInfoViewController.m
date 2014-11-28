//
//  DetailInfoViewController.m
//  addressBook
//
//  Created by huangbo on 14-2-25.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import "DetailInfoViewController.h"
#import "ManagedObjectConfiguration.h"
#import "UIResponder+MotionRecognizers.h"
@interface DetailInfoViewController ()

@end

@implementation DetailInfoViewController

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
    self.config=[[ManagedObjectConfiguration alloc] initWithResource:@"ContactsDetail"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)motionWasRecognized:(NSNotification*)notif
{
    NSString *telephone=[self.managedObject valueForKey:@"phone"];
    if (telephone.length) {
        NSString *url=[NSString stringWithFormat:@"tel://%@",telephone];
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
}
@end
