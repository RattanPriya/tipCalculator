//
//  TipViewController.m
//  tipcal1
//
//  Created by Rattan Priya on 9/7/14.
//  Copyright (c) 2014 Priya. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@end

@implementation TipViewController
@synthesize billAmountTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Tip Calculator";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void)updateValues {
    float bill = [ self.billAmountTextField.text floatValue];
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.20)];
    float tipAmount = bill * [tipValues[self.tipController.selectedSegmentIndex]floatValue];
    float total = tipAmount + bill ;
    self.tipAmountLabelField.text = [NSString stringWithFormat:@"%0.2f",tipAmount];
    
    self.totalAmountLabelField.text = [NSString stringWithFormat:@"$ %0.2f",total];
    
}
-(void) onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultTip = [defaults objectForKey:@"saveTipPercent"];
    int tipInteger = [defaults integerForKey:@"saveTipPercent"];
    NSLog(@"tip>>>%d",tipInteger);
    
    ///When app is launched, set focus on textField
    //and show keyboard by default.
    [billAmountTextField becomeFirstResponder];
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}
@end
