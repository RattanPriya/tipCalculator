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
}

@property (weak, nonatomic) IBOutlet UILabel *tipDefault;

@property (weak, nonatomic) IBOutlet UIStepper *stepperDefaultTip;

- (IBAction)stepperAction:(id)sender;

@end
