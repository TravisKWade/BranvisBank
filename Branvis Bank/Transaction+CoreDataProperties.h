//
//  Transaction+CoreDataProperties.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "Transaction+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Transaction (CoreDataProperties)

+ (NSFetchRequest<Transaction *> *)fetchRequest;

@property (nonatomic) BOOL active;
@property (nullable, nonatomic, copy) NSDecimalNumber *amount;
@property (nonatomic) int64_t categoryID;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *debitor;
@property (nonatomic) int64_t debitorID;
@property (nonatomic) BOOL reconciled;
@property (nonatomic) int64_t transactionID;
@property (nonatomic) int64_t transactionTypeID;

@end

NS_ASSUME_NONNULL_END
