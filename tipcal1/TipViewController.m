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
    NSMutableArray *tipValues = [[NSMutableArray alloc] init];
    NSNumber *tip1 = [NSNumber numberWithFloat:0.10];
    NSNumber *tip2 = [NSNumber numberWithFloat:0.15];
    NSNumber *tip3 = [NSNumber numberWithFloat:0.20];
    [tipValues addObject:tip1];
    [tipValues addObject:tip2];
    [tipValues addObject:tip3];
    

    [self updateValues:tipValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:  (id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultTip = [defaults objectForKey:@"saveTipPercent"];
    NSString *defaultTip2 = [defaults objectForKey:@"saveTipPercent2"];
    NSString *defaultTip3 = [defaults objectForKey:@"saveTipPercent3"];
    float tipInteger =  [defaultTip floatValue]/100;
    float tipInteger2 = [defaultTip2 floatValue]/100;
    float tipInteger3 = [defaultTip3 floatValue]/100;
    [self.view endEditing:YES];
     NSMutableArray *tipValues = [[NSMutableArray alloc]init];
  
    [tipValues addObject: [NSNumber numberWithFloat: tipInteger]];
    [tipValues addObject: [NSNumber numberWithFloat: tipInteger2]];
    [tipValues addObject: [NSNumber numberWithFloat: tipInteger3]];
    [self updateValues: tipValues];
}

-(void)updateValues:(NSMutableArray *)tipValues {
    float bill = [ self.billAmountTextField.text floatValue];
    [self.tipController titleForSegmentAtIndex:self.tipController.selectedSegmentIndex];
    float tipAmount = bill * [tipValues[self.tipController.selectedSegmentIndex]floatValue];
    float total = tipAmount + bill ;
    self.tipAmountLabelField.text = [NSString stringWithFormat:@"%0.2f",tipAmount];
    self.totalAmountLabelField.text = [NSString stringWithFormat:@"$ %0.2f",total];
    
}
-(void) onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultTip = [defaults objectForKey:@"saveTipPercent"];
    NSString *defaultTip2 = [defaults objectForKey:@"saveTipPercent2"];
    NSString *defaultTip3 = [defaults objectForKey:@"saveTipPercent3"];
    [self.tipController setTitle:defaultTip forSegmentAtIndex:0];
    [self.tipController setTitle:defaultTip2 forSegmentAtIndex:1];
    [self.tipController setTitle:defaultTip3 forSegmentAtIndex:2];
 
    
    
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
