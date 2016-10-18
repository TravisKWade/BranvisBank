//
//  ViewController.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/14/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface LogInViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) IBOutlet UITextField *usernameTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) IBOutlet UILabel *messageLabel;

@property (strong, nonatomic) LAContext *laContext;

- (IBAction) loginButtonPressed;

@end

