//
//  SuperDBCell.h
//  
//
//  Created by huangbo on 13-12-6.
//
//

//#import "UITableViewCell.h"
#import <UIKit/UIKit.h>
@protocol SuperCellDelegate <NSObject>
- (void)portrainImgTap:(NSString *)portrainImg;
@end


#define kLabelTextColor [UIColor colorWithRed:0.321569f green:0.4f blue:0.568627f alpha:1.0f]
@interface SuperCell : UITableViewCell

@property (nonatomic, assign) NSObject<SuperCellDelegate> *delegate;

@property(strong,nonatomic)NSManagedObject *hero;
@property(strong,nonatomic)UILabel *label;
@property(strong,nonatomic)UITextField *textfield;

@property(strong,nonatomic) NSString *key;
@property(strong,nonatomic) id value;

-(BOOL)isEditable;

@end
