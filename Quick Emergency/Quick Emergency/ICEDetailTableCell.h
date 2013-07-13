//
//  ICEDetailTableCell.h
//  Quick Emergency
//
//  Created by Paul Wilson on 7/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICEDetailTableCell : UITableViewCell
{
    UILabel *cellLabel;
    UITextField *cellTextField;
}

@property (nonatomic, strong) IBOutlet UILabel *cellLabel;
@property (nonatomic, strong) IBOutlet UITextField *cellTextField;

@end
