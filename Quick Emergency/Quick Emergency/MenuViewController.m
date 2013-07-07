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
@synthesize scroller, toolbar;

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.navigationItem.title = @"Pick Your Emergency";
    
    //Set up scroll view
    [scroller setScrollEnabled:(YES)];
    [scroller setContentSize:CGSizeMake(320,650)];

    
    
    emergencyList = [[NSArray alloc] initWithObjects:@"Fire", @"Theft", @"Break In", nil];
    myImages = [[NSArray alloc] initWithObjects:@"Fire", @"Theft", @"Break In", nil];
    
    //Declare Buttons and Labels
    CGRect button1Rect;
    CGRect button1LabelRect;
    
    CGRect button2Rect;
    CGRect button2LabelRect;
    
    CGRect button3Rect;
    CGRect button3LabelRect;
    
    CGRect button4Rect;
    CGRect button4LabelRect;
    
    CGRect button5Rect;
    CGRect button5LabelRect;
    
    CGRect button6Rect;
    CGRect button6LabelRect;
    
    CGRect button7Rect;
    CGRect button7LabelRect;
    
    CGRect button8Rect;
    CGRect button8LabelRect;
    
    CGRect button9Rect;
    CGRect button9LabelRect;
    
    CGRect button10Rect;
    CGRect button10LabelRect;
    
    CGRect button11Rect;
    CGRect button11LabelRect;
    
    CGRect button12Rect;
    CGRect button12LabelRect;
    
    CGRect button13Rect;
    CGRect button13LabelRect;
    
    CGRect button14Rect;
    CGRect button14LabelRect;
    
    CGRect button15Rect;
    CGRect button15LabelRect;
    
    
    
    if ([UIScreen mainScreen].bounds.size.height > 480.0f ) {
        
        //User is using iPhone 5
        //Coordinates for icon and text
        int leftCoordinate = 24;
        int middleCoordinate = 130;
        int rightCoordinate = 238;
        
        int leftTextCoordinate = 26;
        int middleTextCoordinate = 131;
        int rightTextCoordinate = 238;
        
        int iconSize = 60;
        
        int rowOne = 15;
        int rowTwo = rowOne + 92;
        int rowThree = rowTwo + 92;
        int rowFour = rowThree + 92;
        int rowFive = rowFour + 92;
        
        int rowOneText = 76;
        int rowTwoText = rowOneText + 92;
        int rowThreeText = rowTwoText + 92;
        int rowFourText = rowThreeText + 92;
        int rowFiveText = rowFourText + 92;
        
        
        //Set the sizes and locations of the buttons and labels
        button1Rect = CGRectMake(leftCoordinate, rowOne, iconSize, iconSize);
        button1LabelRect = CGRectMake(leftTextCoordinate, rowOneText, iconSize, 25);
        
        button2Rect = CGRectMake(middleCoordinate, rowOne, iconSize, iconSize);
        button2LabelRect = CGRectMake(middleTextCoordinate, rowOneText, iconSize, 25);
        
        button3Rect = CGRectMake(rightCoordinate, rowOne, iconSize, iconSize);
        button3LabelRect = CGRectMake(rightTextCoordinate, rowOneText, iconSize, 25);
        
        button4Rect = CGRectMake(leftCoordinate, rowTwo, iconSize, iconSize);
        button4LabelRect = CGRectMake(leftTextCoordinate, rowTwoText, iconSize, 25);
        
        button5Rect = CGRectMake(middleCoordinate, rowTwo, iconSize, iconSize);
        button5LabelRect = CGRectMake(middleTextCoordinate, rowTwoText, iconSize, 25);
        
        button6Rect = CGRectMake(rightCoordinate, rowTwo, iconSize, iconSize);
        button6LabelRect= CGRectMake(rightTextCoordinate, rowTwoText, iconSize, 25);
        
        button7Rect = CGRectMake(leftCoordinate, rowThree, iconSize, iconSize);
        button7LabelRect = CGRectMake(leftTextCoordinate, rowThreeText, iconSize, 25);
        
        button8Rect = CGRectMake(middleCoordinate, rowThree, iconSize, iconSize);
        button8LabelRect = CGRectMake(middleTextCoordinate, rowThreeText, iconSize, 25);
        
        button9Rect = CGRectMake(rightCoordinate, rowThree, iconSize, iconSize);
        button9LabelRect = CGRectMake(rightTextCoordinate, rowThreeText, iconSize, 25);
        
        button10Rect = CGRectMake(leftCoordinate, rowFour, iconSize, iconSize);
        button10LabelRect = CGRectMake(leftTextCoordinate, rowFourText, iconSize, 25);
        
        button11Rect = CGRectMake(middleCoordinate, rowFour, iconSize, iconSize);
        button11LabelRect = CGRectMake(middleTextCoordinate, rowFourText, iconSize, 25);
        
        button12Rect = CGRectMake(rightCoordinate, rowFour, iconSize, iconSize);
        button12LabelRect = CGRectMake(rightTextCoordinate, rowFourText, iconSize, 25);
        
        button13Rect = CGRectMake(leftCoordinate, rowFive, iconSize, iconSize);
        button13LabelRect = CGRectMake(leftTextCoordinate, rowFiveText, iconSize, 25);
        
        button14Rect = CGRectMake(middleCoordinate, rowFive, iconSize, iconSize);
        button14LabelRect = CGRectMake(middleTextCoordinate, rowFiveText, iconSize, 25);
        
        button15Rect = CGRectMake(rightCoordinate, rowFive, iconSize, iconSize);
        button15LabelRect = CGRectMake(rightTextCoordinate, rowFiveText, iconSize, 25);
        
        
    } else {
        
        //User is not using iPhone 5
        
        button1Rect = CGRectMake(51, 34, 70, 66);
        button1LabelRect = CGRectMake(67, 108, 42, 21);
        
        button2Rect = CGRectMake(182, 34, 70, 66);
        button2LabelRect = CGRectMake(196, 108, 42, 21);
        
        
    }
    
    //Add buttons and corresponding labels
    
    [self makeButton:@"1" withImage:@"Fire.png" withFrame:button1Rect];
    [self makeLabel:@"1" withFrame:button1LabelRect];
    
    [self makeButton:@"2" withImage:@"Default.png" withFrame:button2Rect];
    [self makeLabel:@"2" withFrame:button2LabelRect];
    
    [self makeButton:@"3" withImage:@"Default.png" withFrame:button3Rect];
    [self makeLabel:@"3" withFrame:button3LabelRect];
    
    [self makeButton:@"4" withImage:@"Default.png" withFrame:button4Rect];
    [self makeLabel:@"4" withFrame:button4LabelRect];
    
    [self makeButton:@"5" withImage:@"Default.png" withFrame:button5Rect];
    [self makeLabel:@"5" withFrame:button5LabelRect];
    
    [self makeButton:@"6" withImage:@"Default.png" withFrame:button6Rect];
    [self makeLabel:@"6" withFrame:button6LabelRect];
    
    [self makeButton:@"7" withImage:@"Default.png" withFrame:button7Rect];
    [self makeLabel:@"7" withFrame:button7LabelRect];
    
    [self makeButton:@"8" withImage:@"Default.png" withFrame:button8Rect];
    [self makeLabel:@"8" withFrame:button8LabelRect];
    
    [self makeButton:@"9" withImage:@"Default.png" withFrame:button9Rect];
    [self makeLabel:@"9" withFrame:button9LabelRect];
    
    [self makeButton:@"10" withImage:@"Default.png" withFrame:button10Rect];
    [self makeLabel:@"10" withFrame:button10LabelRect];
    
    [self makeButton:@"11" withImage:@"Default.png" withFrame:button11Rect];
    [self makeLabel:@"11" withFrame:button11LabelRect];
    
    [self makeButton:@"12" withImage:@"Default.png" withFrame:button12Rect];
    [self makeLabel:@"12" withFrame:button12LabelRect];
    
    [self makeButton:@"13" withImage:@"Default.png" withFrame:button13Rect];
    [self makeLabel:@"13" withFrame:button13LabelRect];
    
    [self makeButton:@"14" withImage:@"Default.png" withFrame:button14Rect];
    [self makeLabel:@"14" withFrame:button14LabelRect];
    
    [self makeButton:@"15" withImage:@"Default.png" withFrame:button15Rect];
    [self makeLabel:@"15" withFrame:button15LabelRect];
    
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

- (void)helpButtonPressed:(id)sender {

}


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
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [scroller addSubview:label];
}



@end
