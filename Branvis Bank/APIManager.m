//
//  APIManager.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/18/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "APIManager.h"
#import "HoldingAccount.h"

@implementation APIManager

static APIManager *manager;

+ (APIManager *) sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[APIManager alloc] init];
            [manager initService];
        });
    }
    
    return manager;
}

- (void) initService {
    self.service = [[WebService alloc] init];
}

#pragma mark - log in

- (void) loginWithUsername:(NSString *) username andPassword:(NSString *) password withCompletion: (void (^)(BOOL success)) completion {
    NSString *urlWithParams = [NSString stringWithFormat:@"login/login.php?uname=%@&pass=%@", username, password];
    
    [self.service get:urlWithParams andCompletion:^(NSURLResponse *response, NSData *data) {
        if(data) {
            NSError *error = nil;
            NSDictionary *userArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSDictionary *user = [userArray objectForKey:@"user"];
            
            [[NSUserDefaults standardUserDefaults] setObject:[user objectForKey:@"userID"] forKey:@"userID"];
            [[NSUserDefaults standardUserDefaults] setObject:[user objectForKey:@"groupID"] forKey:@"groupID"];
            
            completion(YES);
        } else {
            completion(NO);
        }
    }];
}

#pragma mark -  accounts

- (void) getAccountsForGroup:(int) groupID withCompletion: (void (^)(BOOL success, NSArray *accounts))completion {
    NSString *urlWithParams = [NSString stringWithFormat:@"account/accounts.php?gid=%d", groupID];
    
    [self.service get:urlWithParams andCompletion:^(NSURLResponse *response, NSData *data) {
        NSMutableArray *accounts = [[NSMutableArray alloc] init];
        
        if(data) {
            NSError *error = nil;
            NSDictionary *accountsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSArray *accountsArray = [accountsDictionary objectForKey:@"accounts"];
            
            for (int i = 0; i <  accountsArray.count; i++) {
                HoldingAccount *account = [[HoldingAccount alloc] initWithDictionary:[accountsArray objectAtIndex:i]];
                [accounts addObject:account];
            }
            
            completion(YES, accounts);
        } else {
            completion(NO, accounts);
        }
    }];
}

@end
