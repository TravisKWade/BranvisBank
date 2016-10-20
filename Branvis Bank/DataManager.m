//
//  DataManager.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "DataManager.h"
#import "AppDelegate.h"


@implementation DataManager

static DataManager *dataManager;

+ (DataManager *) sharedManager {
    if (!dataManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dataManager = [[DataManager alloc] init];
        });
    }
    
    return dataManager;
}

- (id)init {
    if (self = [super init]) {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        self.context = delegate.managedObjectContext;
    }
    return self;
}

#pragma mark - Accounts

- (void) updateAccount:(Account *) account {
    if (dataManager.context) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Account" inManagedObjectContext:self.context];
        [fetchRequest setEntity:entity];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"accountID = %@", account.accountID]];
        
        NSError *error;
        NSArray *fetchedAccount = [self.context executeFetchRequest:fetchRequest error:&error];
        
        if (fetchedAccount.count > 0) {
            Account *savedAccount = [fetchedAccount objectAtIndex:0];
            
            savedAccount.name = account.name;
            savedAccount.balance = account.balance;
            
            [self.context save:&error];
            
        } else {
            // save the account
            Account *newAccount = [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:self.context];
            
            newAccount.name = account.name;
            newAccount.accountID = account.accountID;
            newAccount.balance = account.balance;
            
            [self.context save:&error];
        }
    }

}

@end
