//
//  Debitor+CoreDataProperties.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/19/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "Debitor+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Debitor (CoreDataProperties)

+ (NSFetchRequest<Debitor *> *)fetchRequest;

@property (nonatomic) int64_t debitorID;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
