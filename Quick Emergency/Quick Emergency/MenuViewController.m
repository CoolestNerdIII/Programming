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
    CGRect allButtonRect;
    CGRect allLabelRect;
    
    CGRect favoritesButtonRect;
    CGRect favoritesLabelRect;
    
    CGRect button3Rect;
    CGRect button3LabelRect;
    
    CGRect button4Rect;
    CGRect button4LabelRect;
    
    
    if ([UIScreen mainScreen].bounds.size.height > 480.0f ) {
        
        //User is using iPhone 5
        
        //Set the sizes and locations of the buttons and labels
        allButtonRect = CGRectMake(24, 78, 60, 60);
        allLabelRect = CGRectMake(26, 139, 58, 25);
        
        favoritesButtonRect = CGRectMake(130, 78, 60, 60);
        favoritesLabelRect = CGRectMake(131, 139, 58, 25);
        
        button3Rect = CGRectMake(238, 78, 60, 60);
        button3LabelRect = CGRectMake(238, 139, 58, 25);
        
        button4Rect = CGRectMake(24, 170, 60, 60);
        button4LabelRect = CGRectMake(26, 232, 58, 25);
        
    } else {
        
        //User is not using iPhone 5
        
        allButtonRect = CGRectMake(51, 34, 70, 66);
        allLabelRect = CGRectMake(67, 108, 42, 21);
        
        favoritesButtonRect = CGRectMake(182, 34, 70, 66);
        favoritesLabelRect = CGRectMake(196, 108, 42, 21);
        
        
    }
    
    //Create All Button and Label
    UIButton *allButton = [UIButton buttonWithType:UIButtonTypeCustom];
    allButton.frame = allButtonRect;
    allButton.showsTouchWhenHighlighted = YES;
    [allButton setTitle:@"1" forState:UIControlStateNormal];
    [allButton setImage:[UIImage imageNamed:@"Default.png"] forState:UIControlStateNormal];
    [allButton addTarget:self action:@selector(emergencySelected:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *allButtonLabel = [[UILabel alloc] initWithFrame:allLabelRect];
    allButtonLabel.text = @"All";
    allButtonLabel.backgroundColor = [UIColor clearColor];
    allButtonLabel.textColor = [UIColor whiteColor];
    allButtonLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:allButton];
    [self.view addSubview:allButtonLabel];
    
    //Create Favorites Button and Label
    UIButton *favoritesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    favoritesButton.frame = favoritesButtonRect;
    favoritesButton.showsTouchWhenHighlighted = YES;
    [favoritesButton setTitle:@"2" forState:UIControlStateNormal];
    [favoritesButton setImage:[UIImage imageNamed:@"Default.png"] forState:UIControlStateNormal];
    [favoritesButton addTarget:self action:@selector(emergencySelected:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *favoritesButtonLabel = [[UILabel alloc] initWithFrame:favoritesLabelRect];
    favoritesButtonLabel.text = @"Favorites";
    favoritesButtonLabel.backgroundColor = [UIColor clearColor];
    favoritesButtonLabel.textColor = [UIColor whiteColor];
    favoritesButtonLabel.textAlignment = NSTextAlignmentCenter;
    
    //Add buttons to the subview
    [self.view addSubview:favoritesButton];
    [self.view addSubview:favoritesButtonLabel];
    
    //Create Button 3 Button and Label
    UIButton *button3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    button3Button.frame = button3Rect;
    button3Button.showsTouchWhenHighlighted = YES;
    [button3Button setTitle:@"3" forState:UIControlStateNormal];
    [button3Button setImage:[UIImage imageNamed:@"Default.png"] forState:UIControlStateNormal];
    [button3Button addTarget:self action:@selector(emergencySelected:) forControlEvents:UIControlEventTouchUpInside];
    

    UILabel *button3Label = [[UILabel alloc] initWithFrame:button3LabelRect];
    button3Label.text = @"3";
    button3Label.backgroundColor = [UIColor clearColor];
    button3Label.textColor = [UIColor whiteColor];
    button3Label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:button3Button];
    [self.view addSubview:button3Label];
    
    //Create Button 4 Button and Label
    UIButton *button4Button = [UIButton buttonWithType:UIButtonTypeCustom];
    button4Button.frame = button4Rect;
    button4Button.showsTouchWhenHighlighted = YES;
    [button4Button setTitle:@"4" forState:UIControlStateNormal];
    [button4Button setImage:[UIImage imageNamed:@"Default.png"] forState:UIControlStateNormal];
    [button4Button addTarget:self action:@selector(emergencySelected:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *button4Label = [[UILabel alloc] initWithFrame:button4LabelRect];
    button4Label.text = @"4";
    button4Label.backgroundColor = [UIColor clearColor];
    button4Label.textColor = [UIColor whiteColor];
    button4Label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:button4Button];
    [self.view addSubview:button4Label];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) emergencySelected:(id)sender{
    
    //Push to Main View Controller
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    
    //Return the title of the button pressed
    NSString *selection = [[sender titleLabel] text];
    dvc.emergencySelected = selection;
    
    [self.navigationController pushViewController:dvc animated:YES];

}


- (IBAction)quickButtonPressed:(id)sender {
}

- (IBAction)settingsButtonPressed:(id)sender {
}
@end
