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
    
    self.laContext = [[LAContext alloc] init];
    
    int userID = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"userID"];
 
    if (userID) {
        NSError *error = nil;
        // check to see if the device has touch ID
        if ([self.laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            [self.laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Log into the App with TouchID" reply:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                        [self performSegueWithIdentifier:@"homeSegue" sender:nil];
                    });
                }
                
                if (error) {
                    self.messageLabel.text = @"There was a problem verifying your identity";
                }
            }];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button handler

- (IBAction) loginButtonPressed {
    if (self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0) {
        [APIManager.sharedManager loginWithUsername:self.usernameTextField.text andPassword:self.passwordTextField.text withCompletion:^(BOOL success) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    [self performSegueWithIdentifier:@"homeSegue" sender:nil];
                });
            } else {
                self.messageLabel.text = @"The username or the password is incorrect";
            }
        }];
    } else {
        self.messageLabel.text = @"Make sure to fill in both the username and the password";
    }
}

@end
