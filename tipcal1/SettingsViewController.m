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
- (IBAction)onTapSettings:(id)sender {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperAction:(id)sender {
    
        tipDefault.text = [NSString stringWithFormat:@"%0.0f", stepperDefaultTip.value];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear >>>SETTINGS");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadStrings = [defaults objectForKey:@"saveTipPercent"];
    NSLog(@"loadStrings>>%@",loadStrings);
    [label setText:loadStrings];
    stepperDefaultTip.value = [tipDefault.text integerValue];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear >>>SETTINGS");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear >>>SETTINGS");
    NSString *saveTipPercent = self.tipDefault.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveTipPercent forKey:@"saveTipPercent"];
    [defaults synchronize];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear >>>SETTINGS");
}
@end
