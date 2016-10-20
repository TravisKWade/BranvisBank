//
//  Debitor+CoreDataProperties.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "Debitor+CoreDataProperties.h"

@implementation Debitor (CoreDataProperties)

+ (NSFetchRequest<Debitor *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Debitor"];
}

@dynamic debitorID;
@dynamic name;

@end
