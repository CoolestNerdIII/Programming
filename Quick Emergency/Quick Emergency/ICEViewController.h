//
//  ICEViewController.h
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICEViewController : UITableViewController

@property(strong, nonatomic) NSMutableDictionary *contacts;

@property(strong, nonatomic) NSMutableArray *doctors;
@property(strong, nonatomic) NSMutableArray *familyMembers;
@property(strong, nonatomic) NSMutableArray *otherContacts;

@end
