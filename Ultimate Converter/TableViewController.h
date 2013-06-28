//
//  TableViewController.h
//  Ultimate Converter
//
//  Created by Paul Wilson on 6/2/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property(strong, nonatomic) NSArray * converterList;
@property(strong, nonatomic) NSArray * converterListSubtitles;
@property(strong, nonatomic) NSArray * variableConverterList;

- (IBAction)showLeftMenuPressed:(id)sender;
- (IBAction)showRightMenuPressed:(id)sender;

@end
