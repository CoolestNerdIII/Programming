//
//  MenuViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 6/29/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MenuViewController.h"
#import "DetailViewController.h"
#import "SearchViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
{
    NSMutableArray *buttonRow;
    NSMutableArray *textRow;
    NSMutableArray *buttonProperties;
    NSMutableArray *textProperties;
}

@synthesize emergencyList, myImages;
@synthesize scroller, toolbar;

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //Setup Navigation Controller
    self.navigationItem.title = @"Select Your Emergency";
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Home" style: UIBarButtonItemStyleBordered target: nil action: nil];
    self.navigationItem.backBarButtonItem = newBackButton;
    self.navigationController.navigationBar.tintColor = [UIColor darkTextColor];
    self.toolbar.backgroundColor  = [UIColor darkGrayColor];
    //[self.toolbar setBackgroundImage:[UIImage imageNamed:@"Default.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    //self.toolbar.tintColor = [UIColor darkTextColor];
    
    //Set up scroll view
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320,650)];
    scroller.backgroundColor = [UIColor clearColor];
    
    //Initialize Variables
    emergencyList = [[NSArray alloc] initWithObjects:@"Fire", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", nil];
    myImages = [[NSArray alloc] initWithObjects:@"Fire.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", @"Default.png", nil];
    buttonProperties = [[NSMutableArray alloc] initWithCapacity:[myImages count]];
    textProperties = [[NSMutableArray alloc] initWithCapacity:[myImages count]];
    buttonRow = [[NSMutableArray alloc]initWithCapacity:5];
    textRow = [[NSMutableArray alloc]initWithCapacity:5];
    
    //Coordinates for icon and text
    int leftCoordinate = 24; int middleCoordinate = 130; int rightCoordinate = 238; int iconSize = 60; int spaceBetweenButtons = 92;
    
    //Create array for the different y axis values for the buttons
    for(NSInteger i = 0; i < 5; i++)
    {
        if(i==0){
            [buttonRow addObject:[NSNumber numberWithInt:15]];
            [textRow addObject:[NSNumber numberWithInt:18+iconSize]];
        }
        else{
            [buttonRow addObject:[NSNumber numberWithInt:([[buttonRow objectAtIndex:i-1] integerValue] + spaceBetweenButtons)]];
            [textRow addObject:[NSNumber numberWithInt:([[textRow objectAtIndex:i-1] integerValue] + spaceBetweenButtons)]];
        }
    }
    
    //Create buttons and add them to a mutable array
    for(NSInteger count = 0; count < [myImages count]/3; count++){
        
        //Set the sizes and locations of the buttons and labels
        int row = [[buttonRow objectAtIndex:count] integerValue];
        int trow = [[textRow objectAtIndex:count] integerValue];
        
        //Create the buttons and labels
        CGRect button1Rect = CGRectMake(leftCoordinate, row, iconSize, iconSize);
        CGRect button1LabelRect = CGRectMake(leftCoordinate, trow, iconSize, 25);
        CGRect button2Rect = CGRectMake(middleCoordinate, row, iconSize, iconSize);
        CGRect button2LabelRect = CGRectMake(middleCoordinate, trow, iconSize, 25);
        CGRect button3Rect = CGRectMake(rightCoordinate, row, iconSize, iconSize);
        CGRect button3LabelRect = CGRectMake(rightCoordinate, trow, iconSize, 25);
        
        //Add the buttons labels to their respective mutable arrays
        [buttonProperties addObject:[NSValue valueWithCGRect:button1Rect]];
        [textProperties addObject:[NSValue valueWithCGRect:button1LabelRect]];
        [buttonProperties addObject:[NSValue valueWithCGRect:button2Rect]];
        [textProperties addObject:[NSValue valueWithCGRect:button2LabelRect]];
        [buttonProperties addObject:[NSValue valueWithCGRect:button3Rect]];
        [textProperties addObject:[NSValue valueWithCGRect:button3LabelRect]];
    }
    
    
    //Add buttons and corresponding labels
    for(int buttonCount = 0; buttonCount < [myImages count]; buttonCount++)
    {
        [self makeButton:[emergencyList objectAtIndex:buttonCount]
               withImage:[myImages objectAtIndex:buttonCount]
               withFrame:[[buttonProperties objectAtIndex:buttonCount] CGRectValue]];
        
        [self makeLabel:[emergencyList objectAtIndex:buttonCount]
              withFrame:[[textProperties objectAtIndex:buttonCount] CGRectValue]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Initialization Methods
#pragma mark -

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


-(void)viewDidAppear:(BOOL)animated{
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchTable:)];
    
    //Show add button if in edit mode
    self.navigationItem.rightBarButtonItem = searchButton;
    
    /*
    UIBarButtonItem *save = [[UIBarButtonItem alloc]
                             initWithTitle:@"Save"
                             style:UIBarButtonItemStyleBordered
                             target:self
                             action:@selector(saveInformation:)];
    self.navigationItem.rightBarButtonItem = save;
     */
    
}

-(void)searchTable:(id)sender
{
    
    SearchViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Search"];
    
    //Return the title of the button pressed
    //NSString *selection = [[sender titleLabel] text];
    svc.emergencyList = emergencyList;
    
    [self.navigationController pushViewController:svc animated:YES];
    
    
    
    
}


#pragma Button Create Methods
#pragma mark -

-(void)makeButton:(NSString *)title withImage:(NSString *)image withFrame:(CGRect)frame
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.showsTouchWhenHighlighted = YES;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(emergencySelected:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:button];
}

-(void)makeLabel:(NSString *)title withFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    [label setFont:[UIFont fontWithName:@"Verdana" size:14.0]];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [scroller addSubview:label];
}

@end
