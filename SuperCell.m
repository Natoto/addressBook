//
//  SuperDBCell.m
//  
//
//  Created by huangbo on 13-12-6.
//
//

#import "SuperCell.h"

@implementation SuperCell

@synthesize delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.label=[[UILabel alloc] initWithFrame:CGRectMake(12.0, 15.0, 67.0, 15.0)];
        self.label.font=[UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
        self.label.textAlignment=NSTextAlignmentRight;
        self.label.backgroundColor=[UIColor clearColor];
        self.label.textColor=kLabelTextColor;
        self.label.text=@"label";
        [self.contentView addSubview:self.label];
        
        self.textfield=[[UITextField alloc] initWithFrame:CGRectMake(93.0, 13.0, 170.0, 19.0)];
        self.textfield.backgroundColor =[UIColor clearColor];
        self.textfield.clearButtonMode=UITextFieldViewModeWhileEditing;
        self.textfield.enabled=NO;
        self.textfield.font=[UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        self.textfield.text=@"Titile";
        [self.contentView addSubview:self.textfield];
     
        
    }
    return self;
}

-(BOOL)isEditable
{
    return NO;
}

-(id)value
{
    return self.textfield.text;
}

-(void)setValue:(id)avalue
{
    if ([avalue isKindOfClass:[NSString class]]) {
        self.textfield.text=avalue;
    }
    else
        self.textfield.text=[avalue description];
}


@end
