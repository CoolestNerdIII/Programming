//
//  PersonalInfoViewController.h
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoViewController : UITableViewController

@property (strong,nonatomic) NSArray *primaryInformation;
@property (strong,nonatomic) NSArray *addressInformation;

@property (strong,nonatomic) NSMutableArray *personalInformation;
@property (strong,nonatomic) NSMutableArray *titles;
@property (strong,nonatomic) NSMutableArray *defaultKeys;

@property (strong,nonatomic) NSDictionary *keyPairs;
@property (strong,nonatomic) NSDictionary *options;



-(NSMutableArray *)getDefaults:(NSMutableArray *)array withDefaults:(NSUserDefaults*) defaults;
//- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex withArray:(NSMutableArray *)array;
-(NSMutableArray *)reoganizePersonalArray:(NSMutableArray *)array;

@end
