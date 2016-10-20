//
//  HoldingAccount.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/18/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "HoldingAccount.h"

@implementation HoldingAccount

- (id) initWithDictionary:(NSDictionary *) accountDictionary {
    self = [super init];
    
    self.name = [[NSString alloc] init];
    
    self.name = [accountDictionary objectForKey:@"accountName"];
    self.accountID = (int)[accountDictionary objectForKey:@"accountID"];
    
    return self;
}

@end
