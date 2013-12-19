//
//  ICEDetailTableCell.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "TFCell.h"

@implementation TFCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (id)value
{
    return self.textfield.text;
}

- (void)setValue:(id)newValue
{
    self.textfield.text = newValue;
}

@end
