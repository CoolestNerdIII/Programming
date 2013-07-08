//
//  MenuViewController.h
//  Quick Emergency
//
//  Created by Paul Wilson on 6/29/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;


-(void)emergencySelected:(id)sender;
-(void)makeButton:(NSString *)title withImage:(NSString *)image withFrame:(CGRect)frame;
-(void)makeLabel:(NSString *)title withFrame:(CGRect)frame;


- (IBAction)quickButtonPressed:(id)sender;
- (IBAction)settingsButtonPressed:(id)sender;
- (IBAction)helpButtonPressed:(id)sender;


@property (strong,nonatomic) NSArray *emergencyList;
@property (strong,nonatomic) NSArray *myImages;


@end
