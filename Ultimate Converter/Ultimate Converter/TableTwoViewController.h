//
//  TableTwoViewController.h
//  Ultimate Converter
//
//  Created by Paul Wilson on 6/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableTwoViewController : UITableViewController
@property int converterNumber;
@property (strong, nonatomic) NSString * converterName;
@property(strong, nonatomic) NSArray * converterList;
@property(strong, nonatomic) NSArray * converterListSubtitles;
@end
