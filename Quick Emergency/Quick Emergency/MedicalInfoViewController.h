//
//  MedicalInfoViewController.h
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalInfoViewController : UITableViewController <UIAlertViewDelegate>

@property (strong,nonatomic) NSMutableArray *medicalInformation;

@property (strong,nonatomic) NSMutableArray *defaultKeys;
@property (strong,nonatomic) NSDictionary *keyPairs;
@property (strong,nonatomic) NSDictionary *options;

-(NSMutableArray *)reoganizeMedicalArray:(NSMutableArray *)array;
@end
