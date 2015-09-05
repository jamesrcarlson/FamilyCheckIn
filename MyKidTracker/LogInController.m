//
//  LogInController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/3/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInController.h"
#import "UserController.h"
#import "FamilyController.h"

static NSString * const AllUsersKey = @"allUsers";

@interface LogInController ()

@property (strong, nonatomic) Family *usersFamily;

@end

@implementation LogInController

-(void)userLogon {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.jc2dev.com/user/"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:50];
    [request addValue:@"application/json" forHTTPHeaderField:@"user"];
    [request setHTTPMethod:@"POST"];
//    
//    NSString *pw = @"JJCjon40";
//    NSString *uN = @"admin";
//    NSDictionary *userInfo = @{@"username": uN,
//                               @"password": pw};
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:userInfo options:0 error:nil];// can also use NSJSONWritingPrettyPrinted
//    
//    [request setHTTPBody:postData];
    
    //    NSDictionary *dict2 = [NSJSONSerialization JSONObjectWithData:postData options:NSJSONReadingAllowFragments error:nil];
    //    NSLog(@"%@",dict2);
//    [session uploadTaskWithRequest:request fromData:postData];
//    [session downloadTaskWithRequest:request];
    
    
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

-(void)saveTheUserData {
    //get the user info and save it as the current user
}


@end
