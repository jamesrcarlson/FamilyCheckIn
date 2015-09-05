//
//  LogInController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/3/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInController.h"

@implementation LogInController


-(void)userLogon {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    
    //    NSString *stringPrep = [];
//    NSString *keyString = @"&key=AIzaSyCqdu1Nr-LcpjE3JZvm6gnGRXeirVkwuXU";
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.jc2dev.com/users/"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:50];
    [request addValue:@"application/json" forHTTPHeaderField:@"users"];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary *userInfo = @{@"username": @"admin",
                              @"password": @"JJCjon40"};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:userInfo options:0 error:nil];
    [request setHTTPBody:postData];
    
    [session uploadTaskWithRequest:request fromData:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //do something else
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dict);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //do the logon stuff
            
        });
    }];
    
    [postDataTask resume];
    
//    NSURLSessionDataTask *recieve = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//        
//        
//        
//    }];
//    
//    [recieve resume];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // this is only getting it to the main thread to process asyncronously. It should just go outside of this, and some other block of code such as to reload the tableview data - should go in there.
    });
}
@end
