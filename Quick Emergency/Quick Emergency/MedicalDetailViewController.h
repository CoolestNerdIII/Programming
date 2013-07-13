//
//  MedicalDetailViewController.h
//  Quick Emergency
//
//  Created by Paul Wilson on 7/8/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalDetailViewController : UIViewController

@property(nonatomic,strong) NSString *medicalOption;
@property(nonatomic, assign) BOOL isTextBox;
@property(nonatomic,assign) BOOL isTextView;
@property(nonatomic, assign) BOOL isPicker;

-(void)saveInformation:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITextField *textbox;

@end
