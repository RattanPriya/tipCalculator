//
//  SettingsViewController.h
//  tipcal1
//
//  Created by Rattan Priya on 9/7/14.
//  Copyright (c) 2014 Priya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
{
    IBOutlet UILabel *label;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
}

@property (weak, nonatomic) IBOutlet UILabel *tipDefault;
@property (weak, nonatomic) IBOutlet UILabel *tipDefault2;
@property (weak, nonatomic) IBOutlet UILabel *tipDefault3;

@property (weak, nonatomic) IBOutlet UIStepper *stepperDefaultTip;
@property (weak, nonatomic) IBOutlet UIStepper *stepperDefaultTip2;
@property (weak, nonatomic) IBOutlet UIStepper *stepperDefaultTip3;
- (IBAction)stepperAction2:(id)sender;
- (IBAction)stepperAction3:(id)sender;

- (IBAction)stepperAction:(id)sender;

@end
