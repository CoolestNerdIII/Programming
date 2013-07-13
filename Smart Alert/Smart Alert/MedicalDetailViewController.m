//
//  MedicalDetailViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/8/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MedicalDetailViewController.h"

@interface MedicalDetailViewController ()

@end

@implementation MedicalDetailViewController

@synthesize medicalOption, isPicker, isTextBox, isTextView;
@synthesize label, textbox;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.title = medicalOption;
    
    self.label.text = medicalOption;
    self.textbox.placeholder = medicalOption;
    
    
    if (isPicker) {
        
        UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 139, 320, 216)];
        
        [self.view addSubview:picker];
        
    }
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc]
                             initWithTitle:@"Save"
                             style:UIBarButtonItemStyleBordered
                             target:self
                             action:@selector(saveInformation:)];
    self.navigationItem.rightBarButtonItem = save;

}

-(void)saveInformation:(id)sender{
    
    NSString *info = [textbox text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:info forKey:medicalOption];
    
    [defaults synchronize];

    
}

@end
