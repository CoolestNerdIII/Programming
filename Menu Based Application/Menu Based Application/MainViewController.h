//
//  MainViewController.h
//  Menu Based Application
//
//  Created by Paul Wilson on 6/15/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMSwipeTableViewCell.h"
#import "CustomCell.h"

@interface MainViewController : UITableViewController <RMSwipeTableViewCellDelegate>

@property (strong, nonatomic) NSString *locationPressed;

@property (strong, nonatomic) NSString *plistFile;

@property (strong, nonatomic) NSMutableArray *allConverters;

@end
