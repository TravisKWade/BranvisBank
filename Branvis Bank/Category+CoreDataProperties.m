//
//  Category+CoreDataProperties.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "Category+CoreDataProperties.h"

@implementation Category (CoreDataProperties)

+ (NSFetchRequest<Category *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Category"];
}

@dynamic categoryID;
@dynamic name;

@end
