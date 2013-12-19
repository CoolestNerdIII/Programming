//
//  PickerCell.h
//  Smart Alert
//
//  Created by Paul Wilson on 9/1/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "TFCell.h"

@interface PickerCell : TFCell < UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSArray *values;


@end
