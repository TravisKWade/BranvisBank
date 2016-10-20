//
//  Account+CoreDataProperties.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "Account+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Account (CoreDataProperties)

+ (NSFetchRequest<Account *> *)fetchRequest;

@property (nonatomic) int64_t accountID;
@property (nullable, nonatomic, copy) NSDecimalNumber *balance;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *updated;

@end

NS_ASSUME_NONNULL_END
