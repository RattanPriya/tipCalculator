//
//  SettingsViewController.m
//  tipcal1
//
//  Created by Rattan Priya on 9/7/14.
//  Copyright (c) 2014 Priya. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize tipDefault, stepperDefaultTip;
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
    [super viewDidLoad];

    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)updateDefaultValues:(UIStepper *)sender {
    double value = [sender value];
    
    [label setText:[NSString stringWithFormat:@"%d", (int)value]];
}


- (IBAction)onTapSettings:(id)sender {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)Save {
    NSLog(@"Entering save method");
    NSString *saveTipPercent = self.tipDefault.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveTipPercent forKey:@"saveTipPercent"];
    [defaults synchronize];
}
-(IBAction)Load{
        NSLog(@"Entering load method");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadStrings = [defaults objectForKey:@"saveTipPercent"];
    NSLog(@"loadStrings>>%@",loadStrings);
    [label setText:loadStrings];
}
-(IBAction)Change{
        NSLog(@"Entering Change method");
    label.text = @"2";
}


- (IBAction)stepperAction:(id)sender {
        tipDefault.text = [NSString stringWithFormat:@"%f %", stepperDefaultTip.value];
}
@end
