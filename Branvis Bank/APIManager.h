//
//  APIManager.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/18/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebService.h"

@interface APIManager : NSObject

@property (nonatomic, strong) WebService *service;

+ (APIManager *) sharedManager;

- (void) loginWithUsername:(NSString *) username andPassword:(NSString *) password withCompletion: (void (^)(BOOL success))completion;

@end
