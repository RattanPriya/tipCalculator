//
//  TipViewController.h
//  tipcal1
//
//  Created by Rattan Priya on 9/7/14.
//  Copyright (c) 2014 Priya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabelField;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabelField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipController;
- (IBAction)onTap:(id)sender;


@end
