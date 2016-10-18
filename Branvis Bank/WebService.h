//
//  WebService.h
//  Branvis Bank
//
//  Created by Travis Wade on 10/18/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

- (void) get:(NSString *) url andCompletion:(void (^)(NSURLResponse *response, NSData *data)) completion;

@end
