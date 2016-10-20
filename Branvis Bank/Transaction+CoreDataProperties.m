//
//  Transaction+CoreDataProperties.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "Transaction+CoreDataProperties.h"

@implementation Transaction (CoreDataProperties)

+ (NSFetchRequest<Transaction *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Transaction"];
}

@dynamic active;
@dynamic amount;
@dynamic categoryID;
@dynamic date;
@dynamic debitor;
@dynamic debitorID;
@dynamic reconciled;
@dynamic transactionID;
@dynamic transactionTypeID;

@end
