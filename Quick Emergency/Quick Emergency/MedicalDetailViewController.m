//
//  MedicalDetailViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/8/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MedicalDetailViewController.h"
#import "YRDropdownView.h"


@interface MedicalDetailViewController ()

@end

@implementation MedicalDetailViewController
{
    UITextField * textbox;
    UITextView * textView;
}

@synthesize medicalOption, isPicker, isTextBox, isTextView;
//@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //self.title = medicalOption;
    self.title = @"Settings";
    self.view.backgroundColor = [UIColor clearColor];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 280, 21)];
    [label adjustsFontSizeToFitWidth];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    label.text = medicalOption;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    //Determine if the value for the object is empty or not and handle that situation
    //If not empty
   
    
    if (isTextBox)
    {
        textbox = [[UITextField alloc]initWithFrame:CGRectMake(20, 54, 280, 30)];
        textbox.clearsOnBeginEditing = TRUE;
        textbox.borderStyle = UITextBorderStyleBezel;
        if (![[defaults stringForKey:medicalOption] isEqualToString:@""]) {
            textbox.text = [defaults stringForKey:medicalOption];
        }
        else
        {
            textbox.placeholder = medicalOption;
            
        }
        
        [self.view addSubview:textbox];

    }
    else if (isPicker)
    {
        textbox = [[UITextField alloc]initWithFrame:CGRectMake(20, 54, 280, 30)];

        UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 139, 320, 216)];
        [self.view addSubview:picker];
        if (![[defaults stringForKey:medicalOption] isEqualToString:@""]) {
            textbox.text = [defaults stringForKey:medicalOption];
        }
        else
        {
            textbox.placeholder = medicalOption;
            textbox.inputView = picker;
            
        }
        
        [self.view addSubview:textbox];


        
    }else if (isTextView){
        textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 49, 280, 435)];
        textView.editable = YES;
        textView.allowsEditingTextAttributes = YES;
        [textView attributedText];
        if (textView.hasText) {
            textView.text = [defaults stringForKey:medicalOption];
        }
        
        [self.view addSubview:textView];
    }
    
}
/*
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 49, 280, 435)];
    label2.text = [textbox text];
}
*/
//  Dismisses the keyboard when the return button is pressed
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
    
    [YRDropdownView showDropdownInView:self.view.window
                                 title:@"Saved"
                                detail:[NSString stringWithFormat:@"%@ is now set for %@", info, medicalOption]
                                 image:[UIImage imageNamed:@"settings.png"]
                       backgroundImage:[UIImage imageNamed:@"bg-yellow.png"]
                       titleLabelColor:[UIColor whiteColor]
                      detailLabelColor:[UIColor whiteColor]
                              animated:YES
                             hideAfter:2.0 ];
    
    
    [self.navigationController popViewControllerAnimated:YES];
    /*
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Item Saved" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
     */

    
}



#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    
    //Only do the following actions if the user hit the OK button
    if (buttonIndex == 1)
    {
        NSString * info;
        if (isTextBox || isPicker) {
            info = [textbox text];

            
        }
        else{
            info = [textView text];
        }
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:info forKey:medicalOption];
        
        [defaults synchronize];
        
    }
}

@end
