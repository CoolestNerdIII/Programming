//
//  InformationViewController.m
//  Ultimate Converter
//
//  Created by Paul Wilson on 6/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "InformationViewController.h"
#import "DetailViewController.h"
//#import "DemoViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController
//Existing Variables
@synthesize converterName, converterNumber, informationText;

//Text Information
@synthesize areaInfo, angleInfo, bytesInfo, clothingInfo, cookingInfo, currencyInfo, densityInfo, energyInfo, forceInfo, lengthInfo, massInfo, numberInfo, powerInfo, pressureInfo, speedInfo, temperatureInfo, totalInfo;

NSString *returnText = @"";


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
    
    //Create paths to the text files containing the converter information
    NSString *pathToAngle = [[NSBundle mainBundle] pathForResource:@"angleInfo" ofType:@"txt"];
    NSString *pathToArea= [[NSBundle mainBundle] pathForResource:@"areaInfo" ofType:@"txt"];
    NSString *pathToBytes = [[NSBundle mainBundle] pathForResource:@"bytesInfo" ofType:@"txt"];
    NSString *pathToClothing = [[NSBundle mainBundle] pathForResource:@"clothingInfo" ofType:@"txt"];
    NSString *pathToCooking = [[NSBundle mainBundle] pathForResource:@"cookingInfo" ofType:@"txt"];
    NSString *pathToCurrency = [[NSBundle mainBundle] pathForResource:@"currencyInfo" ofType:@"txt"];
    NSString *pathToDensity = [[NSBundle mainBundle] pathForResource:@"densityInfo" ofType:@"txt"];
    NSString *pathToEnergy = [[NSBundle mainBundle] pathForResource:@"energyInfo" ofType:@"txt"];
    NSString *pathToForce = [[NSBundle mainBundle] pathForResource:@"forceInfo" ofType:@"txt"];
    NSString *pathToLength = [[NSBundle mainBundle] pathForResource:@"lengthInfo" ofType:@"txt"];
    NSString *pathToMass = [[NSBundle mainBundle] pathForResource:@"massInfo" ofType:@"txt"];
    NSString *pathToNumber = [[NSBundle mainBundle] pathForResource:@"numberInfo" ofType:@"txt"];
    NSString *pathToPower = [[NSBundle mainBundle] pathForResource:@"powerInfo" ofType:@"txt"];
    NSString *pathToPressure = [[NSBundle mainBundle] pathForResource:@"pressureInfo" ofType:@"txt"];
    NSString *pathToSpeed = [[NSBundle mainBundle] pathForResource:@"speedInfo" ofType:@"txt"];
    NSString *pathToTemperature = [[NSBundle mainBundle] pathForResource:@"temperatureInfo" ofType:@"txt"];
    NSString *pathToTotal = [[NSBundle mainBundle] pathForResource:@"totalInfo" ofType:@"txt"];
    
    
    //Create strings with converter information
    areaInfo = [NSString stringWithContentsOfFile:pathToArea
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
    angleInfo  = [NSString stringWithContentsOfFile:pathToAngle
                                           encoding:NSUTF8StringEncoding
                                              error:NULL];
    bytesInfo  = [NSString stringWithContentsOfFile:pathToBytes
                                           encoding:NSUTF8StringEncoding
                                              error:NULL];
    clothingInfo = [NSString stringWithContentsOfFile:pathToClothing
                                             encoding:NSUTF8StringEncoding
                                                error:NULL];
    cookingInfo = [NSString stringWithContentsOfFile:pathToCooking
                                            encoding:NSUTF8StringEncoding
                                               error:NULL];
    currencyInfo = [NSString stringWithContentsOfFile:pathToCurrency
                                             encoding:NSUTF8StringEncoding
                                                error:NULL];
    densityInfo = [NSString stringWithContentsOfFile:pathToDensity
                                            encoding:NSUTF8StringEncoding
                                               error:NULL];
    energyInfo = [NSString stringWithContentsOfFile:pathToEnergy
                                           encoding:NSUTF8StringEncoding
                                              error:NULL];
    forceInfo = [NSString stringWithContentsOfFile:pathToForce
                                          encoding:NSUTF8StringEncoding
                                             error:NULL];
    lengthInfo = [NSString stringWithContentsOfFile:pathToLength
                                           encoding:NSUTF8StringEncoding
                                              error:NULL];
    massInfo = [NSString stringWithContentsOfFile:pathToMass
                                         encoding:NSUTF8StringEncoding
                                            error:NULL];
    numberInfo = [NSString stringWithContentsOfFile:pathToNumber
                                           encoding:NSUTF8StringEncoding
                                              error:NULL];
    powerInfo = [NSString stringWithContentsOfFile:pathToPower
                                          encoding:NSUTF8StringEncoding
                                             error:NULL];
    pressureInfo = [NSString stringWithContentsOfFile:pathToPressure
                                             encoding:NSUTF8StringEncoding
                                                error:NULL];
    speedInfo = [NSString stringWithContentsOfFile:pathToSpeed
                                          encoding:NSUTF8StringEncoding
                                             error:NULL];
    temperatureInfo = [NSString stringWithContentsOfFile:pathToTemperature
                                                encoding:NSUTF8StringEncoding
                                                   error:NULL];
    totalInfo = [NSString stringWithContentsOfFile:pathToTotal
                                                encoding:NSUTF8StringEncoding
                                                   error:NULL];
    
    //Set the title of the view
    if(![converterName isEqualToString:@"Total"])
    {
        self.title = [converterName stringByAppendingString:@" Conversion Info"];
    }else
    {
        self.title = @"Ultimate Converter Info";
        returnText = totalInfo;
    }
    
    
    //receive the correct paragraph information
    switch(converterNumber)
    {
        case 0:
            returnText = angleInfo;
            break;
        case 1:
            returnText = areaInfo;
            break;
        case 2:
            returnText = bytesInfo;
            break;
        case 3:
            returnText = clothingInfo;
            break;
        case 4:
            returnText = cookingInfo;
            break;
        case 5:
            returnText = currencyInfo;
            break;
        case 6:
            returnText = densityInfo;
            break;
        case 7:
            returnText = energyInfo;
            break;
        case 8:
            returnText = forceInfo;
            break;
        case 9:
            returnText = lengthInfo;
            break;
        case 10:
            returnText = massInfo;
            break;
        case 11:
            returnText = numberInfo;
            break;
        case 12:
            returnText = powerInfo;
            break;
        case 13:
            returnText = pressureInfo;
            break;
        case 14:
            returnText = speedInfo;
            break;
        case 15:
            returnText = temperatureInfo;
            break;
        default:
            break;
    }
    
    if([converterName isEqualToString:@"Total"])
    {
        self.title = @"Ultimate Converter Info";
        returnText = totalInfo;
    }
    
    
    informationText.text = returnText;
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
