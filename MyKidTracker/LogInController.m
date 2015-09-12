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
#import <FBSDKAccessToken.h>
#import <FBSDKProfile.h>
#import <FBSDKGraphRequest.h>
#import <FBSDKGraphRequestConnection.h>

static NSString * const clientIDKey = @"qET1UVJIgRs43N1zW61dByL5kCOYOJ4rwPQC44zk";
static NSString * const clientSecretKey = @"sOMAOCsvSYS5OjxWWUOb6ujGHh3YgZEZTouPJrvF9RRYQeplf8YGQkwc99EaF3JCsKoQD4mmA7mk0fhJsDzaEbEv0eoLh53J1ZwYLip32XwISgLlyOA4VH0UGoXwzi9x";

static NSString * const AllUsersKey = @"allUsers";

@interface LogInController ()

@property (strong, nonatomic) NetworkController *networkC;
@property (strong, nonatomic) Family *usersFamily;
@property (strong, nonatomic) NSString *profileUserID;
@property (strong, nonatomic) NSString *profileUserFirstN;
@property (strong, nonatomic) NSString *profileUserLastN;



@end

@implementation LogInController

//-(void)userLogon {
//    NSString *pw = @"steve";
//    NSString *uN = @"steve";
////    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
//    NSDictionary *userInfo = @{@"username": uN,
//                               @"password": pw,
//                               };
//    
//    [[NetworkController api]POST:@"api-token-auth/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
//       self.networkC.token  = responseObject[@"token"];
//        self.theToken  = responseObject[@"token"];
//        NSLog(@"success: %@", responseObject);
//        [self getSomeInfo];
////        [self getUserInfo];
//    } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
//        NSLog(@"fail: %@", error);
//    }];
//    
//
//    
//}

//-(void)getSomeInfo {
//    
//    NSString *pw = @"steve";
//    NSString *uN = @"steve";
//    //    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
//    NSDictionary *userInfo = @{@"username": uN,
//                               @"password": pw,
//                               };
//        [[NetworkController api]GET:@"get-user-info/" parameters:nil success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
//            self.networkC.token  = responseObject[@"token"];
//            self.theToken  = responseObject[@"token"];
//            NSLog(@"success: %@", responseObject);
////            [self getUserInfo];
//        } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
//            NSLog(@"fail: %@", error);
//        }];
//}

-(void)getUserInfo {
//    __block NSInteger successInt = 0;//need the block statement so that it can be modified in the block below
    
    dispatch_async(dispatch_get_main_queue(), ^{
        AFHTTPSessionManager *api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.jc2dev.com/"]];
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
    NSURL *baseURL = [NSURL URLWithString:@"http://api.jc2dev.com/"];
    
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
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Failure: %@", error);
         }];
    
}

//-(void)aFOAuthAttemptRegister {
//    
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
//    
//}

-(void)getProfileInformation {
    
    FBSDKProfile *profile = [FBSDKProfile new];
    
    self.profileUserID = profile.userID;
    self.profileUserFirstN = profile.firstName;
    self.profileUserLastN = profile.lastName;
    
//    NSString *pathToPicture = [profile imagePathForPictureMode:FBSDKProfilePictureModeNormal size:CGSizeMake(250, 250)];
//    FBSDKGraphRequest *request =
    
//    FBSDKGraphRequestConnection *connection = [FBSDKGraphRequestConnection new];
    
}


/*
 
 
 
 
 
 
 
 
 
 
 If you happen to be having this issue with Django rest framework and the routers the problem might be related to the trailing slash being clipped by the NSUrlRequest. if the trailing slash is clipped then django will have to redirect your request, to avoid this you can use Trailing_slash = True like this
 
 router = routers.DefaultRouter(trailing_slash=False)
 
 Wow. We have been using Django rest and freaking out trying to figure why IOS was not sending the Authorization token header, and this was it, NSURLRequest was removing the trailing slash
 */

-(void)saveTheUserData {
    //get the user info and save it as the current user
}

@end
