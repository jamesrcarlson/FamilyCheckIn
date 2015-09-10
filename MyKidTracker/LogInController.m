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
#import "NetworkController.h"
#import <AFOAuth2Manager.h>

static NSString * const AllUsersKey = @"allUsers";

@interface LogInController ()

@property (strong, nonatomic) Family *usersFamily;

@end

@implementation LogInController

-(void)userLogon {
//    NSString *pw = @"steve";
//    NSString *uN = @"Steve";
//    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
    
//    NSDictionary *userInfo = @{@"username": @[uN],
//                               @"password": @[pw],
//                               @"info":@{
//                                       @"user":@"",
//                                       @"phone_number": @[@810310],
//                                       @"profile_pic": @[@"" ]}};
    
//    [[NetworkController api]POST:@"user/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
//        NSLog(@"success");
//    } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
//        NSLog(@"fail");
//    }];
    
//    NSURL *baseURL = [NSURL URLWithString:@"http://api.jc2dev.com/"];
//    AFOAuth2Manager *oAuth2Manager = [[AFOAuth2Manager alloc]initWithBaseURL:baseURL clientID:<#(NSString *)#> secret:<#(NSString *)#>]
//    
//    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/oauth/token"
//                                              username:@"username"
//                                              password:@"password"
//                                                 scope:@"email"
//                                               success:^(AFOAuthCredential *credential) {
//                                                   NSLog(@"Token: %@", credential.accessToken);
//                                               }
//                                               failure:^(NSError *error) {
//                                                   NSLog(@"Error: %@", error);
//                                               }];
}

/*
 
 Authorizing Requests
 AFHTTPRequestOperationManager *manager =
 [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
 
 [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];
 
 [manager GET:@"/path/to/protected/resource"
 parameters:nil
 success:^(AFHTTPRequestOperation *operation, id responseObject) {
 NSLog(@"Success: %@", responseObject);
 }
 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 NSLog(@"Failure: %@", error);
 }];
 
 
 Storing Credentials
 
 [AFOAuthCredential storeCredential:credential
 withIdentifier:serviceProviderIdentifier];
 
 
 If you happen to be having this issue with Django rest framework and the routers the problem might be related to the trailing slash being clipped by the NSUrlRequest. if the trailing slash is clipped then django will have to redirect your request, to avoid this you can use Trailing_slash = True like this
 
 router = routers.DefaultRouter(trailing_slash=False)
 
 Wow. We have been using Django rest and freaking out trying to figure why IOS was not sending the Authorization token header, and this was it, NSURLRequest was removing the trailing slash
 */

-(void)saveTheUserData {
    //get the user info and save it as the current user
}

@end
