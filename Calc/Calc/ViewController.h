//
//  ViewController.h
//  Calc
//
//  Created by Paul Wilson on 12/14/13.
//  Copyright (c) 2013 PW Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableString * value;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end
