//
//  ViewController.m
//  Calc
//
//  Created by Paul Wilson on 12/14/13.
//  Copyright (c) 2013 PW Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSUInteger operationLocation;
}

@end

@implementation ViewController
@synthesize value, textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    value = [[NSMutableString alloc] initWithString:@"0"];
    operationLocation = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methodology

-(void)addNumber:(int)number {
    if([value length] == 1 && [value isEqualToString:@"0"] )
        //Replace the value
        [value replaceCharactersInRange:NSMakeRange(0,1)
                withString:[[NSNumber numberWithInt:number]stringValue]];
    else
        [value appendString:[[NSNumber numberWithInt:number]stringValue]];
    textField.text = value;
}

-(void)addPoint {
    if([value rangeOfString:@"."].location == NSNotFound)
        [value appendString:@"."];

    textField.text = value;
}

-(void)addOperation:(NSString*)operation {
    operationLocation = value.length;
    [value appendString:operation];
    textField.text = value;

}

#pragma mark - Operations

- (IBAction)equals:(id)sender {
}
- (IBAction)plusOp:(id)sender {
    [self addOperation:@"+"];
}
- (IBAction)minusOp:(id)sender {
     [self addOperation:@"-"];
}
- (IBAction)multiplyOp:(id)sender {
     [self addOperation:@"*"];
}
- (IBAction)divideOp:(id)sender {
     [self addOperation:@"/"];
}
- (IBAction)modulusOp:(id)sender {
     [self addOperation:@"%"];
}
- (IBAction)negateOp:(id)sender {
    if ([value length] == 1 && [value isEqualToString:@"0"] ) {
        [value replaceCharactersInRange:NSMakeRange(0,1) withString:@"-"];
    }
    else if(operationLocation+2 > [value length])
    {
        [value appendString:@"-"];
    
    }
    else
    {
        if (operationLocation == 0){
            NSString *op = [value substringWithRange:NSMakeRange(operationLocation, 1)];
            if([op isEqualToString:@"-"])
                [value deleteCharactersInRange:NSMakeRange(operationLocation, 1)];
            else
                [value insertString:@"-" atIndex:operationLocation];
        
        }
        else
        {
            NSString *op = [value substringWithRange:NSMakeRange(operationLocation+1, 1)];
    
            if([op isEqualToString:@"-"])
                [value deleteCharactersInRange:NSMakeRange(operationLocation+1, 1)];
            else
                [value insertString:@"-" atIndex:operationLocation+1];
        
        }
    }
    textField.text = value;
}

- (IBAction)clearOp:(id)sender {
    [value deleteCharactersInRange:NSMakeRange(0, [value length])];
    [value appendString:@"0"];
    operationLocation = 0; //Reset Operation Location
    textField.text = value;
}

- (IBAction)backOp:(id)sender {
    NSLog(@"Operation is located at %lu", (unsigned long)operationLocation);
    if([value length] == 1)
        [value replaceCharactersInRange:NSMakeRange(0,1) withString:@"0"];
    else
    {
        [value deleteCharactersInRange:NSMakeRange([value length]-1, 1)];
        
        //Replace the location of the operation location
        if(operationLocation > [value length]){
            NSLog(@"OperationLocation > length");
            int conversion, loc = 0;
            char temp;
            
            for (NSUInteger i = 0; i < [value length]; i++){
                temp = [value characterAtIndex:i];
                conversion = (int)temp;
                if(conversion == 0 && strcmp(&temp, "0"))
                {
                    //NSLog(@"%lu",(unsigned long)i);
                    loc = (int)i;
                }
            }
            NSLog(@"Operation Location: %lu", (unsigned long)loc);
            operationLocation = (NSUInteger)loc;
        }
    }

    textField.text = value;
}

#pragma mark - Numbers
- (IBAction)zero:(id)sender {
    [self addNumber:0];
}
- (IBAction)one:(id)sender {
    [self addNumber:1];
}
- (IBAction)two:(id)sender {
    [self addNumber:2];
}
- (IBAction)three:(id)sender {
    [self addNumber:3];
}
- (IBAction)four:(id)sender {
    [self addNumber:4];
}
- (IBAction)five:(id)sender {
    [self addNumber:5];
}
- (IBAction)six:(id)sender {
    [self addNumber:6];
}
- (IBAction)seven:(id)sender {
    [self addNumber:7];
}
- (IBAction)eight:(id)sender {
    [self addNumber:8];
}
- (IBAction)nine:(id)sender {
    [self addNumber:9];
}
- (IBAction)point:(id)sender {
    [self addPoint];
}

@end
