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
@synthesize tipDefault, stepperDefaultTip, tipDefault2, tipDefault3, stepperDefaultTip2, stepperDefaultTip3;
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

- (IBAction)stepperAction2:(id)sender {
        tipDefault2.text = [NSString stringWithFormat:@"%0.0f", stepperDefaultTip2.value];
}

- (IBAction)stepperAction3:(id)sender {
       tipDefault3.text = [NSString stringWithFormat:@"%0.0f", stepperDefaultTip3.value];
}

- (IBAction)stepperAction:(id)sender {
    
        tipDefault.text = [NSString stringWithFormat:@"%0.0f", stepperDefaultTip.value];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *loadStrings =  [defaults objectForKey:@"saveTipPercent"];
    NSString *loadStrings2 = [defaults objectForKey:@"saveTipPercent2"];
    NSString *loadStrings3 = [defaults objectForKey:@"saveTipPercent3"];
    NSLog(@"loadStrings1>>%@",loadStrings);
    NSLog(@"loadStrings2>>%@",loadStrings2);
    NSLog(@"loadStrings3>>%@",loadStrings3);
    [label setText:loadStrings];
    [label2 setText:loadStrings2];
    [label3 setText:loadStrings3];
    stepperDefaultTip.value =  [loadStrings integerValue];
    stepperDefaultTip2.value = [loadStrings2 integerValue];
    stepperDefaultTip3.value = [loadStrings3 integerValue];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear >>>SETTINGS");
    NSString *saveTipPercent = self.tipDefault.text;
    NSString *saveTipPercent2 = self.tipDefault2.text;
    NSString *saveTipPercent3 = self.tipDefault3.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:saveTipPercent forKey:@"saveTipPercent"];
    [defaults setObject:saveTipPercent2 forKey:@"saveTipPercent2"];
    [defaults setObject:saveTipPercent3 forKey:@"saveTipPercent3"];
    NSLog(@"S1--DISAPPEAR>>%@",saveTipPercent);
    NSLog(@"s2--DISAPPEAR>>%@",saveTipPercent2);
    NSLog(@"s3--DISAPPEAR>>%@",saveTipPercent3);
    [defaults synchronize];
    
}

@end
