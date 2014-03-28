//
//  ConversionViewController.h
//  Tesseract
//
//  Created by Paul Wilson on 3/17/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "ViewController.h"
#import <TesseractOCR/TesseractOCR.h>



@interface ConversionViewController : ViewController  <TesseractDelegate>

@property (strong, nonatomic) UIImage *inputImage;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *outputText;


@end
