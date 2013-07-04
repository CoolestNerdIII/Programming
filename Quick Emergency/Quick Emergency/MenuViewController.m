//
//  MenuViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 6/29/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MenuViewController.h"
#import "DetailViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize emergencyList, myImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Pick Your Emergency";
    [self.navigationItem.titleView sizeToFit];
    //[[UINavigationBar appearance] setTitleTextAttributes: @{UITextAttributeFont: [UIFont fontWithName:@"Helvetica" size:12.0f]}];
    
    emergencyList = [[NSArray alloc] initWithObjects:@"Fire", @"Theft", @"Break In", nil];
    myImages = [[NSArray alloc] initWithObjects:@"Fire", @"Theft", @"Break In", nil];
    
    //Declare Buttons and Labels
    CGRect button1Rect;
    CGRect button1Label;
    
    CGRect button2Rect;
    CGRect button2Label;
    
    CGRect button3Rect;
    CGRect button3LabelRect;
    
    CGRect button4Rect;
    CGRect button4LabelRect;
    
    
    if ([UIScreen mainScreen].bounds.size.height > 480.0f ) {
        
        //User is using iPhone 5
        
        //Set the sizes and locations of the buttons and labels
        button1Rect = CGRectMake(24, 78, 60, 60);
        button1Label = CGRectMake(26, 139, 58, 25);
        
        button2Rect = CGRectMake(130, 78, 60, 60);
        button2Label = CGRectMake(131, 139, 58, 25);
        
        button3Rect = CGRectMake(238, 78, 60, 60);
        button3LabelRect = CGRectMake(238, 139, 58, 25);
        
        button4Rect = CGRectMake(24, 170, 60, 60);
        button4LabelRect = CGRectMake(26, 232, 58, 25);
        
    } else {
        
        //User is not using iPhone 5
        
        button1Rect = CGRectMake(51, 34, 70, 66);
        button1Label = CGRectMake(67, 108, 42, 21);
        
        button2Rect = CGRectMake(182, 34, 70, 66);
        button2Label = CGRectMake(196, 108, 42, 21);
        
        
    }
    
    //Add buttons and corresponding labels
    [self makeButton:@"1" withImage:@"Default.png" withFrame:button1Rect];
    [self makeLabel:@"1" withFrame:button1Label];
    
    [self makeButton:@"2" withImage:@"Default.png" withFrame:button2Rect];
    [self makeLabel:@"2" withFrame:button2Label];
    
    [self makeButton:@"3" withImage:@"Default.png" withFrame:button3Rect];
    [self makeLabel:@"3" withFrame:button3LabelRect];
    
    [self makeButton:@"4" withImage:@"Default.png" withFrame:button4Rect];
    [self makeLabel:@"4" withFrame:button4LabelRect];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) emergencySelected:(id)sender{
    /*
    //Push to Main View Controller
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    
    //Return the title of the button pressed
    NSString *selection = [[sender titleLabel] text];
    dvc.emergencySelected = selection;
    
    [self.navigationController pushViewController:dvc animated:YES];
     */
    NSLog(@"Title: %@", [[sender titleLabel] text]);
}


- (IBAction)quickButtonPressed:(id)sender {
}

- (IBAction)settingsButtonPressed:(id)sender {
}


-(void)makeButton:(NSString *)title withImage:(NSString *)image withFrame:(CGRect)frame
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.showsTouchWhenHighlighted = YES;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(emergencySelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

-(void)makeLabel:(NSString *)title withFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end
