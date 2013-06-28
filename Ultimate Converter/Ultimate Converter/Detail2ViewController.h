//
//  Detail2ViewController.h
//  Ultimate Converter
//
//  Created by Paul Wilson on 6/9/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detail2ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate>

@property int converterNumber;
@property (strong, nonatomic) NSString * converterName;

- (IBAction)showLeftMenuPressed:(id)sender;
- (IBAction)showRightMenuPressed:(id)sender;

- (IBAction)informationButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *initialValue;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UITextField *answerValue;


//property array listings ui picker
@property (strong, nonatomic) NSArray *oneColumnList;
@property (strong, nonatomic) NSArray *secondColumnList;

@property(strong, nonatomic) NSArray * angleOptions;
@property(strong, nonatomic) NSArray * areaOptions;
@property(strong, nonatomic) NSArray * bytesOptions;
@property(strong, nonatomic) NSArray * clothingOptions;
@property(strong, nonatomic) NSArray * cookingOptions;
@property(strong, nonatomic) NSArray * currencyOptions;
@property(strong, nonatomic) NSArray * densityOptions;
@property(strong, nonatomic) NSArray * energyOptions;
@property(strong, nonatomic) NSArray * forceOptions;
@property(strong, nonatomic) NSArray * lengthOptions;
@property(strong, nonatomic) NSArray * massOptions;
@property(strong, nonatomic) NSArray * numberOptions;
@property(strong, nonatomic) NSArray * powerOptions;
@property(strong, nonatomic) NSArray * pressureOptions;
@property(strong, nonatomic) NSArray * speedOptions;
@property(strong, nonatomic) NSArray * temperatureOptions;


@end
