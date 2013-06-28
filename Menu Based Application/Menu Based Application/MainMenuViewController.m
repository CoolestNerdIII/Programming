//
//  MainMenuViewController.m
//  Menu Based Application
//
//  Created by Paul Wilson on 6/15/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGRect allButtonRect;
    CGRect allLabelRect;
    
    CGRect favoritesButtonRect;
    CGRect favoritesLabelRect;
    
    if ([UIScreen mainScreen].bounds.size.height > 480.0f ) {
        
        //User is using iPhone 5
        
        allButtonRect = CGRectMake(51, 49, 70, 66);
        allLabelRect = CGRectMake(58, 123, 42, 21);
        
        favoritesButtonRect = CGRectMake(199, 49, 70, 66);
        favoritesLabelRect = CGRectMake(213, 123, 42, 21);
        
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
    [allButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [allButton addTarget:self action:@selector(allButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
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
    [favoritesButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [favoritesButton addTarget:self action:@selector(favoritesButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *favoritesButtonLabel = [[UILabel alloc] initWithFrame:favoritesLabelRect];
    favoritesButtonLabel.text = @"Favorites";
    favoritesButtonLabel.backgroundColor = [UIColor clearColor];
    favoritesButtonLabel.textColor = [UIColor whiteColor];
    favoritesButtonLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:favoritesButton];
    [self.view addSubview:favoritesButtonLabel];
    
}

- (void) allButtonPressed:(id)sender{
    
    //Push to Main View Controller
    MainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    
    mainView.locationPressed = @"All";

    [self.navigationController pushViewController:mainView animated:YES];
    
}


- (void) favoritesButtonPressed:(id)sender{
    
    //Push to Main View Controller
    MainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    
    mainView.locationPressed = @"Favorites";
    
    [self.navigationController pushViewController:mainView animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
