//
//  PickerCell.m
//  Smart Alert
//
//  Created by Paul Wilson on 9/1/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "PickerCell.h"

@interface PickerCell()
@property (strong, nonatomic) UIPickerView *pickerView;

@end

@implementation PickerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.textfield.clearButtonMode = UITextFieldViewModeNever;
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        self.pickerView.showsSelectionIndicator = YES;
        self.textfield.inputView = self.pickerView;
    }
    return self;
}

#pragma mark UIPickerViewDataSource Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.values count];
}

#pragma mark - UIPickerViewDelegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [self.values objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.textfield.text = [self.values objectAtIndex:row];
}


- (void)setValue:(id)value
{
    if (value != nil) {
        NSInteger index = [self.values indexOfObject:value];
        if (index != NSNotFound) {
            self.textfield.text = value;
        }
    }
    else {
        self.textfield.text = nil;
    }
}



@end
