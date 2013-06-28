//
//  Detail2ViewController.m
//  Ultimate Converter
//
//  Created by Paul Wilson on 6/9/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "Detail2ViewController.h"

#import "DetailViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "InformationViewController.h"


@interface Detail2ViewController ()

@end

@implementation Detail2ViewController

//Synthesize arrays
@synthesize converterName, converterNumber, initialValue, picker, answerValue;
@synthesize areaOptions, angleOptions, bytesOptions, clothingOptions, cookingOptions, currencyOptions, densityOptions, energyOptions, forceOptions, lengthOptions, massOptions, numberOptions, powerOptions, pressureOptions, speedOptions, temperatureOptions, oneColumnList, secondColumnList;

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
    picker.showsSelectionIndicator = TRUE;
    
    //Create Arrays of options for the ui picker
    self.oneColumnList=[[NSArray alloc] initWithObjects:@"New York",@"Montreal",@"Miami",@"Boston",@"Philadelphia",@"Toronto",@"Calcary",@"Vancouver",@"Los Angeles",@"Cupertino",@"Austin",@"New Orleans", nil];
    self.secondColumnList=[[NSArray alloc] initWithObjects:@"Canada", @"United States",@"Mexico",@"England",@"France",@"Greece", @"Slovakia",@"Switzerland", nil];
    
    
	areaOptions = [[NSArray alloc]initWithObjects: @"acre", @"are", @"Bytes", nil];
    angleOptions = [[NSArray alloc]initWithObjects: @"radian", @"mil", @"grad", @"degree", @"minute", @"second", @"point", @"1/16 circle", @"1/10 circle", @"1/8 circle", @"1/6 circle", @"1/4 circle", @"1/2 circle", @"full circle", nil];
    bytesOptions = [[NSArray alloc] initWithObjects:@"", nil];
    clothingOptions = [[NSArray alloc] initWithObjects:@"", nil];
    cookingOptions = [[NSArray alloc] initWithObjects:@"", nil];
    currencyOptions = [[NSArray alloc] initWithObjects:@"", nil];
    densityOptions = [[NSArray alloc] initWithObjects:@"", nil];
    energyOptions = [[NSArray alloc] initWithObjects:@"", nil];
    forceOptions = [[NSArray alloc] initWithObjects:@"", nil];
    lengthOptions = [[NSArray alloc] initWithObjects:@"Centimeter", @"feet", @"inch", @"kilometer", @"league", @"meter", @"microinch", @"mile", @"millimeter", @"yeard", nil];
    massOptions = [[NSArray alloc] initWithObjects:@"centigram", @" decigram", @"dram", @"grain", @"gram", @"hectogram", @"kilogram", @"pound", @"megagram", @"metric ton", @"milligram", @"ounce", @"pound", nil];
    numberOptions = [[NSArray alloc] initWithObjects:@"", nil];
    powerOptions = [[NSArray alloc] initWithObjects:@"", nil];
    pressureOptions = [[NSArray alloc] initWithObjects:@"", nil];
    speedOptions = [[NSArray alloc] initWithObjects:@"", nil];
    temperatureOptions = [[NSArray alloc] initWithObjects:@"Celcius", @"Centigrade", @"Fahrenheit", @"Rankine", @"Reaumur", @"kelvin", nil],
    
    
    [super viewDidLoad];
    //Set the title of the view
    self.title = converterName;
    
}

//Close Keyboard when return button is clicked
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


//Set up the menu
- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.navigationController.parentViewController;
}

- (IBAction)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (IBAction)showRightMenuPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

- (IBAction)informationButtonPressed:(id)sender;
{
    [self performSegueWithIdentifier:@"segueToInformation" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    InformationViewController *controller = segue.destinationViewController;
    controller.converterName = converterName;
    controller.converterNumber = converterNumber;
}



//Set up UIPicker
//---------------------------------------------------------------------------------
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch(converterNumber)
    {
        case 0:
            return [angleOptions count];
            break;
        case 1:
            return [areaOptions count];
            break;
        case 2:
            return [bytesOptions count];
            break;
        case 3:
            return [clothingOptions count];
            break;
        case 4:
            return [cookingOptions count];
            break;
        case 5:
            return [currencyOptions count];
            break;
        case 6:
            return [densityOptions count];
            break;
        case 7:
            return [energyOptions count];
            break;
        case 8:
            return [forceOptions count];
            break;
        case 9:
            return [lengthOptions count];
            break;
        case 10:
            return [massOptions count];
            break;
        case 11:
            return [numberOptions count];
            break;
        case 12:
            return [powerOptions count];
            break;
        case 13:
            return [pressureOptions count];
            break;
        case 14:
            return [speedOptions count];
            break;
        case 15:
            return [temperatureOptions count];
            break;
        default:
            return 0;
            break;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2; //Number of columns
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    switch(converterNumber)
    {
        case 0:
            return [angleOptions objectAtIndex:row];
            break;
        case 1:
            return [areaOptions objectAtIndex:row];
            break;
        case 2:
            return [bytesOptions objectAtIndex:row];
            break;
        case 3:
            return [clothingOptions objectAtIndex:row];
            break;
        case 4:
            return [cookingOptions objectAtIndex:row];
            break;
        case 5:
            return [currencyOptions objectAtIndex:row];
            break;
        case 6:
            return [densityOptions objectAtIndex:row];
            break;
        case 7:
            return [energyOptions objectAtIndex:row];
            break;
        case 8:
            return [forceOptions objectAtIndex:row];
            break;
        case 9:
            return [lengthOptions objectAtIndex:row];
            break;
        case 10:
            return [massOptions objectAtIndex:row];
            break;
        case 11:
            return [numberOptions objectAtIndex:row];
            break;
        case 12:
            return [powerOptions objectAtIndex:row];
            break;
        case 13:
            return [pressureOptions objectAtIndex:row];
            break;
        case 14:
            return [speedOptions objectAtIndex:row];
            break;
        case 15:
            return [temperatureOptions objectAtIndex:row];
            break;
        default:
            return 0;
            break;
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    //Get the to and from conversion
    //Do Conversions
    double answer;
    NSString *conversionFrom = @"";
    NSString *conversionTo = @"";
    NSInteger columnOneValue;
    NSInteger columnTwoValue;
    columnOneValue = [pickerView selectedRowInComponent:0];
    columnTwoValue= [pickerView selectedRowInComponent:1];
    
    
    switch(converterNumber)
    {
        case 0: //Angle
            //Get the to and from values
            conversionFrom = [angleOptions objectAtIndex:columnOneValue];
            conversionTo = [angleOptions objectAtIndex:columnTwoValue];
            
            //Complete the conversion
            if([conversionFrom isEqualToString:conversionTo])
            {
                answer = initialValue.text.doubleValue;
                answerValue.text = [NSString stringWithFormat:@"%f", answer];
            }
            
            break;
        case 1: //Area
            conversionFrom = [areaOptions objectAtIndex:columnOneValue];
            conversionTo = [areaOptions objectAtIndex:columnTwoValue];
            
            break;
        case 2: //Bytes
            conversionFrom = [bytesOptions objectAtIndex:columnOneValue];
            conversionTo = [bytesOptions objectAtIndex:columnTwoValue];
            
            break;
        case 3: //Clothing
            conversionFrom = [clothingOptions objectAtIndex:columnOneValue];
            conversionTo = [clothingOptions objectAtIndex:columnTwoValue];
            
            break;
        case 4: //Cooking
            conversionFrom = [cookingOptions objectAtIndex:columnOneValue];
            conversionTo = [cookingOptions objectAtIndex:columnTwoValue];
            
            
            break;
        case 5: //Currency
            conversionFrom = [currencyOptions objectAtIndex:columnOneValue];
            conversionTo = [currencyOptions objectAtIndex:columnTwoValue];
            
            break;
        case 6: //Density
            conversionFrom = [densityOptions objectAtIndex:columnOneValue];
            conversionTo = [densityOptions objectAtIndex:columnTwoValue];
            
            break;
        case 7: //Energy
            conversionFrom = [energyOptions objectAtIndex:columnOneValue];
            conversionTo = [energyOptions objectAtIndex:columnTwoValue];
            
            break;
        case 8: //Force
            conversionFrom = [forceOptions objectAtIndex:columnOneValue];
            conversionTo = [forceOptions objectAtIndex:columnTwoValue];
            
            break;
        case 9: //Length
            conversionFrom = [lengthOptions objectAtIndex:columnOneValue];
            conversionTo = [lengthOptions objectAtIndex:columnTwoValue];
            
            break;
        case 10: //Mass
            conversionFrom = [massOptions objectAtIndex:columnOneValue];
            conversionTo = [massOptions objectAtIndex:columnTwoValue];
            
            break;
        case 11: //Number
            conversionFrom = [numberOptions objectAtIndex:columnOneValue];
            conversionTo = [numberOptions objectAtIndex:columnTwoValue];
            
            break;
        case 12: //Power
            conversionFrom = [powerOptions objectAtIndex:columnOneValue];
            conversionTo = [powerOptions objectAtIndex:columnTwoValue];
            
            break;
        case 13: //Pressure
            columnOneValue = [pickerView selectedRowInComponent:0];
            columnTwoValue= [pickerView selectedRowInComponent:1];
            conversionFrom = [pressureOptions objectAtIndex:columnOneValue];
            conversionTo = [pressureOptions objectAtIndex:columnTwoValue];
            
            
            break;
        case 14: //Speed
            columnOneValue = [pickerView selectedRowInComponent:0];
            columnTwoValue= [pickerView selectedRowInComponent:1];
            conversionFrom = [speedOptions objectAtIndex:columnOneValue];
            conversionTo = [speedOptions objectAtIndex:columnTwoValue];
            
            
            break;
        case 15: //Temperature
            columnOneValue = [pickerView selectedRowInComponent:0];
            columnTwoValue= [pickerView selectedRowInComponent:1];
            conversionFrom = [temperatureOptions objectAtIndex:columnOneValue];
            conversionTo = [temperatureOptions objectAtIndex:columnTwoValue];
            
            //Do conversions
            
            //If conversions are equal
            if([conversionFrom isEqualToString:conversionTo]){
                answer = initialValue.text.doubleValue;
            }
            else if([conversionFrom isEqualToString:@"Celcius"]){
                if([conversionTo isEqualToString:@"Centigrade"]){
                    //Celsius to Centigrade
                    answer = initialValue.text.doubleValue;
                    
                }
                else if([conversionTo isEqualToString:@"Fahrenheit"]){
                    //Celsius to Fahrenheit (C*1.8+32)
                    answer = (initialValue.text.doubleValue*9/5)+32;
                    
                }
                else if([conversionTo isEqualToString:@"Rankine"]){
                    //Celsius to Rankine (C*1.8+32+459.67)
                    answer = (initialValue.text.doubleValue*9/5)+32+459.67;
                    
                }
                else if([conversionTo isEqualToString:@"Reaumer"]){
                    //Celsius to Reaumer (C*.8)
                    answer = (initialValue.text.doubleValue*0.8);
                    
                }
                else {
                    //Celsius to kelvin (Celsius + 273.15)
                    answer = (initialValue.text.doubleValue+273.15);
                    
                }
            }
            else if([conversionFrom isEqualToString:@"Centigrade"]){
                if([conversionTo isEqualToString:@"Celcius"]){
                    //Centrigrade to celcius
                    answer = initialValue.text.doubleValue;
                    
                }
                else if([conversionTo isEqualToString:@"Fahrenheit"]){
                    //Centigrade to Fahrenheit
                    answer = (initialValue.text.doubleValue*9/5)+32;
                    
                }
                else if([conversionTo isEqualToString:@"Rankine"]){
                    //Centrigrade to Rankine
                    answer = (initialValue.text.doubleValue*9/5)+32+459.67;
                    
                }
                else if([conversionTo isEqualToString:@"Reaumer"]){
                    //Centigrade to reaumet
                    answer = (initialValue.text.doubleValue*0.8);
                    
                }
                else {
                    //Centrigrade to kelvin
                    answer = (initialValue.text.doubleValue+273.15);
                    
                }
            }
            else if([conversionFrom isEqualToString:@"Fahrenheit"]){
                if([conversionTo isEqualToString:@"Centigrade"]){
                    answer = (initialValue.text.doubleValue-32)/(9/5);
                    
                }
                else if([conversionTo isEqualToString:@"Celcius"]){
                    answer = (initialValue.text.doubleValue-32)/(9/5);
                    
                }
                else if([conversionTo isEqualToString:@"Rankine"]){
                    answer = (initialValue.text.doubleValue+459.67);
                    
                }
                else if([conversionTo isEqualToString:@"Reaumer"]){
                    answer = (initialValue.text.doubleValue-32)/(9/4);
                    
                }
                else {
                    answer = (initialValue.text.doubleValue+459.67)/(9/5);
                    
                }
            }
            else if([conversionFrom isEqualToString:@"Rankine"]){
                if([conversionTo isEqualToString:@"Centigrade"]){
                    answer = (initialValue.text.doubleValue-32-459.67)/(9/5);
                    
                }
                else if([conversionTo isEqualToString:@"Fahrenheit"]){
                    answer = (initialValue.text.doubleValue-459.67);
                    
                }
                else if([conversionTo isEqualToString:@"Celcius"]){
                    answer = (initialValue.text.doubleValue-32-459.67)/(9/5);
                    
                }
                else if([conversionTo isEqualToString:@"Reaumer"]){
                    answer = (initialValue.text.doubleValue-32-459.67)/(9/4);
                    
                }
                else {
                    answer = (initialValue.text.doubleValue/(9/5));
                    
                }
            }
            else if([conversionFrom isEqualToString:@"Reaumer"]){
                if([conversionTo isEqualToString:@"Centigrade"]){
                    answer = (initialValue.text.doubleValue *(10/8));
                    
                }
                else if([conversionTo isEqualToString:@"Fahrenheit"]){
                    answer = (initialValue.text.doubleValue*(9/4)+32);
                    
                }
                else if([conversionTo isEqualToString:@"Rankine"]){
                    answer = (initialValue.text.doubleValue *(9/4)+32+459.67);
                    
                }
                else if([conversionTo isEqualToString:@"Celcius"]){
                    answer = (initialValue.text.doubleValue *(10/8));
                }
                else {
                    answer = (initialValue.text.doubleValue *(10/8)+273.15);
                }
            }
            else {
                if([conversionTo isEqualToString:@"Centigrade"]){
                    answer = (initialValue.text.doubleValue-273.15);
                    
                }
                else if([conversionTo isEqualToString:@"Fahrenheit"]){
                    answer = (initialValue.text.doubleValue*(9/5))-459.67;
                    
                }
                else if([conversionTo isEqualToString:@"Rankine"]){
                    answer = (initialValue.text.doubleValue*(9/5));
                    
                }
                else if([conversionTo isEqualToString:@"Reaumer"]){
                    answer = (initialValue.text.doubleValue-273.15)*0.8;
                }
                else {
                    answer = (initialValue.text.doubleValue-273.15);
                }
            }
            answer = round(100*answer)/100;
            answerValue.text = [NSString stringWithFormat:@"%.02f°", answer];
            break;
    }
    return;
}
//---------------------------------------------------------------------------------

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
