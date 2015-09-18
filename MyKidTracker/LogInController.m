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


@interface LogInController ()

@property (strong, nonatomic) NetworkController *networkC;
@property (strong, nonatomic) Family *usersFamily;
@property (strong, nonatomic) Token *token;

@end

@implementation LogInController

-(void)userLogon {
    NSString *pw = @"steve";
    NSString *uN = @"steve";
//    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
    NSDictionary *userInfo = @{@"username": uN,
                               @"password": pw,
                               };
    
    [[NetworkController api]POST:@"api-token-auth/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
        self.token.token  = responseObject[@"token"];
        NSLog(@"success: %@", responseObject);
        [self getSomeInfo];
//        [self getUserInfo];
    } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
        NSLog(@"fail: %@", error);
    }];
    

    
}

-(void)getSomeInfo {
    
//    NSString *pw = @"steve";
//    NSString *uN = @"steve";
//    //    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
//    NSDictionary *userInfo = @{@"username": uN,
//                               @"password": pw,
//                               };
        [[NetworkController api]GET:@"get-user-info/" parameters:nil success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
            self.token.token  = responseObject[@"token"];
            NSLog(@"success: %@", responseObject);
//            [self getUserInfo];
        } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
            NSLog(@"fail: %@", error);
        }];
}

-(void)registerUserWithName:(NSString *)firstName lastName:(NSString *)lastName familyName:(NSString *)family userRole:(BOOL)userRole {
    AFHTTPSessionManager *api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:URLStringKey]];
    api.responseSerializer = [AFJSONResponseSerializer serializer];
    api.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *pw = @"steve";
    NSString *uN = @"steve";
    //    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
    NSDictionary *userInfo = @{@"username": uN,
                               @"password": pw,
                               };
    [api POST:@"api-token-auth/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
        self.token.token  = responseObject[@"token"];
        NSLog(@"success: %@", responseObject);
        [self getMoreUserInfo];
    } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
        NSLog(@"fail: %@", error);
    }];
}

-(void)registerFacebookUserFamily:(NSString *)familyName userRole:(BOOL)userRole{
    //    NSURL *baseURL = [NSURL URLWithString:@"http://api.jc2dev.com/"];
    //    AFOAuth2Manager *oAuth2Manager = [[AFOAuth2Manager alloc]initWithBaseURL:baseURL clientID:clientIDKey secret:clientSecretKey];
    //
    //    oAuth2Manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //    oAuth2Manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //
    ////    FBSDKAccessToken *token =[FBSDKAccessToken currentAccessToken];
    ////    [oAuth2Manager authenticateUsingOAuthWithURLString:@"api-token-auth/"
    ////                                              username:@"Steve"
    ////                                              password:@"steve"
    ////                                                 scope:@"email"
    ////                                               success:^(AFOAuthCredential *credential) {
    ////                                                   NSLog(@"Token: %@", credential.accessToken);
    ////                                               }
    ////                                               failure:^(NSError *error) {
    ////                                                   NSLog(@"Error: %@", error);
    ////                                               }];
    ////    [oAuth2Manager authenticateUsingOAuthWithURLString:@"api-token-auth/" parameters:userInfo success:^(AFOAuthCredential *credential) {
    ////         NSLog(@"Token: %@", credential.accessToken);
    ////    } failure:^(NSError *error) {
    ////        NSLog(@"Error: %@", error);
    ////    }];
    //
    ////    AFHTTPRequestOperationManager *manager =
    ////    [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    ////
    ////    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:uN password:pw];
    ////
    ////    [manager GET:@"register-user/"
    ////      parameters:nil
    ////         success:^(AFHTTPRequestOperation *operation, id responseObject) {
    ////             NSLog(@"Success: %@", responseObject);
    ////         }
    ////         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    ////             NSLog(@"Failure: %@", error);
    ////         }];
    ////
    ////    //Storing Credentials
    ////    NSString *tokenString = [[FBSDKAccessToken currentAccessToken] tokenString];
    ////    NSString *tokenType = [[FBSDKAccessToken currentAccessToken]appID];
    ////
    ////    AFOAuthCredential *credential = [AFOAuthCredential credentialWithOAuthToken:tokenString tokenType:tokenType];
    ////    
    ////    [AFOAuthCredential storeCredential:credential withIdentifier:@"FamilyCheckInID"];

}

-(void)registerGoogleUserFamily:(NSString *)familyName userRole:(BOOL)userRole {
    //already removed the OAuth2Manager
}

-(void)customUserName:(NSString *)username password:(NSString *)password {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        AFHTTPSessionManager *api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:URLStringKey]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];
        //    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
        NSDictionary *userInfo = @{@"username": username,
                                   @"password": password,
                                   };
        [api POST:@"api-token-auth/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
            self.token.token  = responseObject[@"token"];
            NSLog(@"success: %@", responseObject);
            [self getMoreUserInfo];
            self.loggedIn = YES;
            [[NSNotificationCenter defaultCenter]postNotificationName:loginSuccessKey object:nil];
        } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
            NSLog(@"fail: %@", error);
        }];
    });
}

-(void)getUserInfo {
    
    NSString *pw = @"steve";
    NSString *uN = @"steve";
    //    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
    NSDictionary *userInfo = @{@"username": uN,
                               @"password": pw,
                               };
    [[NetworkController api] POST:@"api-token-auth/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
        self.token.token  = responseObject[@"token"];
        NSLog(@"success: %@", responseObject);
        [self getMoreUserInfo];
    } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
        NSLog(@"fail: %@", error);
    }];
}

-(void)getMoreUserInfo {    
    [[NetworkController manager] GET:@"get-user-info/"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"Success: %@", responseObject);
             [self getAllUserInfo];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Failure: %@", error);
         }];
    
}

-(void)getAllUserInfo {
    
//    [[[NetworkController manager]requestSerializer] setValue:[NSString stringWithFormat:@"token %@", self.theToken] forHTTPHeaderField:@"Authorization"];
    [[NetworkController manager] GET:@"families/"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"Success: %@", responseObject);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Failure: %@", error);
         }];
}

-(void)saveTheUserData {
    //get the user info and save it as the current user
}

@end
