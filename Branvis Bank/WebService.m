//
//  WebService.m
//  Branvis Bank
//
//  Created by Travis Wade on 10/18/16.
//  Copyright © 2016 Branvis Software. All rights reserved.
//

#import "WebService.h"

@implementation WebService

static NSString *baseAddress = @"http://www.branvis.com/bank/services/";

- (void) get:(NSString *) url andCompletion:(void (^)(NSURLResponse *response, NSData *data)) completion {
    NSURL *serviceURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", baseAddress, url]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:serviceURL];
    request.HTTPMethod = @"GET";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      completion(response, data);
                                  }];
    
    [task resume];
}

@end
