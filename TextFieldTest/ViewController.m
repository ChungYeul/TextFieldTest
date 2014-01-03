//
//  ViewController.m
//  TextFieldTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController
- (IBAction)dismissKeyboard:(id)sender {
    [self.textField resignFirstResponder];
}

-(void)viewDidAppear:(BOOL)animated {
    [self.textField becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
