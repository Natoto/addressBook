//
//  SuperEditCell.m
//  addressBook
//
//  Created by huangbo on 14-2-25.
//  Copyright (c) 2014年 nonato. All rights reserved.
//

#import "SuperEditCell.h"

@implementation SuperEditCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         self.textfield.delegate=self;
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    self.textfield.enabled=editing;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(BOOL)isEditable
{
    return YES;
}
@end
