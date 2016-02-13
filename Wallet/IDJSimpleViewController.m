//
//  IDJSimpleViewController.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJSimpleViewController.h"

@interface IDJSimpleViewController ()

@end

@implementation IDJSimpleViewController

- (IBAction)displayText:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.displayLabel.text = button.titleLabel.text;
}

@end
