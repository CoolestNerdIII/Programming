//
//  MenuViewController.h
//  Quick Emergency
//
//  Created by Paul Wilson on 6/29/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UIScrollViewDelegate>


- (void) emergencySelected:(id)sender;


- (IBAction)quickButtonPressed:(id)sender;
- (IBAction)settingsButtonPressed:(id)sender;



@property (strong,nonatomic) NSArray *emergencyList;
@property (strong,nonatomic) NSArray *myImages;

@end
