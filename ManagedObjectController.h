//
//  DetailViewController.h
//  addressBook
//
//  Created by huangbo on 14-2-23.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperCell.h"
@class ManagedObjectConfiguration;
@interface ManagedObjectController : UITableViewController<SuperCellDelegate>

@property (strong, nonatomic) id detailItem;
@property(strong,nonatomic)NSManagedObject *managedObject;
@property(strong,nonatomic)ManagedObjectConfiguration *config;
//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
