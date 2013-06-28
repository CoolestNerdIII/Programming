//
//  InformationViewController.h
//  Ultimate Converter
//
//  Created by Paul Wilson on 6/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController
@property int converterNumber;
@property (strong, nonatomic) NSString * converterName;


@property (strong, nonatomic) IBOutlet UITextView *informationText;

//Information text
@property(strong, nonatomic) NSString * angleInfo;
@property(strong, nonatomic) NSString * areaInfo;
@property(strong, nonatomic) NSString * bytesInfo;
@property(strong, nonatomic) NSString * clothingInfo;
@property(strong, nonatomic) NSString * cookingInfo;
@property(strong, nonatomic) NSString * currencyInfo;
@property(strong, nonatomic) NSString * densityInfo;
@property(strong, nonatomic) NSString * energyInfo;
@property(strong, nonatomic) NSString * forceInfo;
@property(strong, nonatomic) NSString * lengthInfo;
@property(strong, nonatomic) NSString * massInfo;
@property(strong, nonatomic) NSString * numberInfo;
@property(strong, nonatomic) NSString * powerInfo;
@property(strong, nonatomic) NSString * pressureInfo;
@property(strong, nonatomic) NSString * speedInfo;
@property(strong, nonatomic) NSString * temperatureInfo;
@property(strong, nonatomic) NSString * totalInfo;


@end
