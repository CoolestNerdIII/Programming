//
//  ICEDetailTableCell.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "ICEDetailTableCell.h"

@implementation ICEDetailTableCell

@synthesize cellTextField, cellLabel;

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

-(void) didTransitionToState:(UITableViewCellStateMask)state {
    [super didTransitionToState:state];
    if (state == UITableViewCellStateEditingMask) {
        self.cellTextField.enabled = YES;
    }
    if (state == UITableViewCellStateDefaultMask) {
        self.cellTextField.enabled = NO;
    }
}

@end
