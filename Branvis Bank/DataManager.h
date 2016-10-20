//
//  DataManager.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Account+CoreDataClass.h"

@interface DataManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;

+ (DataManager *) sharedManager;

- (void) updateAccount:(Account *) account;

@end
