
//  Created by Yang Meyer on 03.02.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import "CPMotionRecognizingWindow.h"

@implementation CPMotionRecognizingWindow


-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type==UIEventTypeMotion && event.subtype==UIEventSubtypeMotionShake) {
        NSLog(@"WINDOW 开始摇晃了");
    }
}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type==UIEventTypeMotion && event.subtype==UIEventSubtypeMotionShake) {
        NSLog(@"WINDOW 取消摇晃了");
    }
}
//-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (event.type==UIEventTypeMotion && event.subtype==UIEventSubtypeMotionShake) {
//        NSLog(@"结束摇晃了");
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
//    }
//}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
	if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"CPDeviceShaken" object:self];
        NSLog(@"WINDOW SHAKE END");
	}
}

@end
