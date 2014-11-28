//
//  AppDelegate.h
//  addressBook
//
//  Created by huangbo on 14-2-23.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPMotionRecognizingWindow.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
