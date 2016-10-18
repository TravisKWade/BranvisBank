//
//  ViewController.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/14/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "LogInViewController.h"
#import "APIManager.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button handler

- (IBAction) loginButtonPressed {
    if (self.usernameTextField.text > 0 && self.passwordTextField.text > 0) {
        [APIManager.sharedManager loginWithUsername:self.usernameTextField.text andPassword:self.passwordTextField.text withCompletion:^(BOOL success) {
            
        }];
    }
}

@end
