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


static NSString * const URLStringKey = @"http://api.jc2dev.com/";
static NSString * const clientIDKey = @"qET1UVJIgRs43N1zW61dByL5kCOYOJ4rwPQC44zk";
static NSString * const clientSecretKey = @"sOMAOCsvSYS5OjxWWUOb6ujGHh3YgZEZTouPJrvF9RRYQeplf8YGQkwc99EaF3JCsKoQD4mmA7mk0fhJsDzaEbEv0eoLh53J1ZwYLip32XwISgLlyOA4VH0UGoXwzi9x";

static NSString * const AllUsersKey = @"allUsers";

@interface LogInController ()

@property (strong, nonatomic) NetworkController *networkC;
@property (strong, nonatomic) Family *usersFamily;



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
       self.networkC.token  = responseObject[@"token"];
        self.theToken  = responseObject[@"token"];
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
            self.networkC.token  = responseObject[@"token"];
            self.theToken  = responseObject[@"token"];
            NSLog(@"success: %@", responseObject);
//            [self getUserInfo];
        } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
            NSLog(@"fail: %@", error);
        }];
}

-(void)registerUserWithName:(NSString *)firstName lastName:(NSString *)lastName familyName:(NSString *)family userRole:(BOOL)userRole {
    
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
            self.networkC.token  = responseObject[@"token"];
            self.theToken  = responseObject[@"token"];
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
    
    dispatch_async(dispatch_get_main_queue(), ^{
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
            self.networkC.token  = responseObject[@"token"];
            self.theToken  = responseObject[@"token"];
            NSLog(@"success: %@", responseObject);
            [self getMoreUserInfo];
        } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
            NSLog(@"fail: %@", error);
        }];
    });
}

-(void)getMoreUserInfo {
    NSURL *baseURL = [NSURL URLWithString:URLStringKey];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"token %@", self.theToken] forHTTPHeaderField:@"Authorization"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:@"get-user-info/"
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
    
    NSURL *baseURL = [NSURL URLWithString:URLStringKey];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"token %@", self.theToken] forHTTPHeaderField:@"Authorization"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:@"families/"
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
