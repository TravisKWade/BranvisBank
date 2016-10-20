//
//  Account.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/18/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HoldingAccount : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) int accountID;


- (id) initWithDictionary:(NSDictionary *) accountDictionary;

@end
