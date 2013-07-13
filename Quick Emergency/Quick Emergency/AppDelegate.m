//
//  AppDelegate.m
//  Quick Emergency
//
//  Created by Paul Wilson on 6/29/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)customizeAppearance
{
    
#pragma mark - Customize navigation bar

    /*
    //Customize Navigation Bar
    
    // Create resizable images
    UIImage *gradientImage44 = [[UIImage imageNamed:@"surf_gradient_textured_44"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImage *gradientImage32 = [[UIImage imageNamed:@"surf_gradient_textured_32"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    // Set the background image for *all* UINavigationBars
    [[UINavigationBar appearance] setBackgroundImage:gradientImage44
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:gradientImage32
                                       forBarMetrics:UIBarMetricsLandscapePhone];
    
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
      UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
      UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
      UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"Arial-Bold" size:0.0],
      UITextAttributeFont,
      nil]];
    */
    
#pragma mark - Customize Bar Button

    /*
    
    //Customize Bar Button
    
    UIImage *buttonBack30 = [[UIImage imageNamed:@"button_back_textured_30"]
                             resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
    UIImage *buttonBack24 = [[UIImage imageNamed:@"button_back_textured_24"]
                             resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 5)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack30
                                                      forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack24
                                                      forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    */
    
#pragma mark - Customize tab bar

    /*
    //Customize Tab Bar
    
    UIImage *tabBG = [UIImage imageNamed:@"tab_bg.png"];
    [[UIToolbar appearance] setBackgroundImage:tabBG forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
     
    */
    #pragma mark - Customize Slider
    
    /*
    //Customize Slider
     
     UIImage *minImage = [[UIImage imageNamed:@"slider_minimum.png"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
     UIImage *maxImage = [[UIImage imageNamed:@"slider_maximum.png"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
     UIImage *thumbImage = [UIImage imageNamed:@"thumb.png"];
     
     [[UISlider appearance] setMaximumTrackImage:maxImage
     forState:UIControlStateNormal];
     [[UISlider appearance] setMinimumTrackImage:minImage
     forState:UIControlStateNormal];
     [[UISlider appearance] setThumbImage:thumbImage
     forState:UIControlStateNormal];
     */
    
    #pragma mark - Customize UISegmentedControl
    /*
    UIImage *segmentSelected =
    [[UIImage imageNamed:@"segcontrol_sel.png"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    UIImage *segmentUnselected =
    [[UIImage imageNamed:@"segcontrol_uns.png"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    UIImage *segmentSelectedUnselected =
    [UIImage imageNamed:@"segcontrol_sel-uns.png"];
    UIImage *segUnselectedSelected =
    [UIImage imageNamed:@"segcontrol_uns-sel.png"];
    UIImage *segmentUnselectedUnselected =
    [UIImage imageNamed:@"segcontrol_uns-uns.png"];
    
    [[UISegmentedControl appearance] setBackgroundImage:segmentUnselected
                                               forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:segmentSelected
                                               forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [[UISegmentedControl appearance] setDividerImage:segmentUnselectedUnselected
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segmentSelectedUnselected
                                 forLeftSegmentState:UIControlStateSelected
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance]
     setDividerImage:segUnselectedSelected
     forLeftSegmentState:UIControlStateNormal
     rightSegmentState:UIControlStateSelected
     barMetrics:UIBarMetricsDefault];
    */
    
    #pragma mark - Customize UISwitch
    /*
    [[UISwitch appearance] setOnTintColor:[UIColor colorWithRed:0 green:175.0/255.0 blue:176.0/255.0 alpha:1.0]];
    [[UISwitch appearance] setTintColor:[UIColor colorWithRed:1.000 green:0.989 blue:0.753 alpha:1.000]];
    [[UISwitch appearance] setThumbTintColor:[UIColor colorWithRed:0.211 green:0.550 blue:1.000 alpha:1.000]];
     */
    
#pragma mark - Customize UIStepper
    /*
    [[UIStepper appearance] setTintColor:[UIColor colorWithRed:0 green:175.0/255.0 blue:176.0/255.0 alpha:1.0]];
    [[UIStepper appearance] setIncrementImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [[UIStepper appearance] setDecrementImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    */
    
#pragma mark - Customize UI ProgressView
    /*
    [[UIProgressView appearance] setProgressTintColor:[UIColor colorWithRed:0 green:175.0/255.0 blue:176.0/255.0 alpha:1.0]];
    [[UIProgressView appearance] setTrackTintColor:[UIColor colorWithRed:0.996 green:0.788 blue:0.180 alpha:1.000]];
    */
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Load default defaults
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Defaults copy" ofType:@"plist"]]];
    
    //Customize Appearance
    [self customizeAppearance];
    
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CalmBackground.png"]];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
