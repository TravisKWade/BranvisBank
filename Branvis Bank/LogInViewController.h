//
//  ViewController.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/14/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) IBOutlet UITextField *usernameTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;

- (IBAction) loginButtonPressed;

@end

