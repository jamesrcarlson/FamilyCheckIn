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
#import "TheToken.h"
#import "UserController.h"
#import "LocationController.h"
#import "ToDoItemController.h"


@interface LogInController ()

@property (strong, nonatomic) TheToken *theToken;
@property (strong, nonatomic) NetworkController *networkC;
@property (strong, nonatomic) Family *usersFamily;

@end

@implementation LogInController

-(void)userLogon:(NSString *)username password:(NSString *)pw {
    NSDictionary *userInfo = @{@"username": username,
                               @"password": pw,
                               };
    
    [[NetworkController api]POST:@"api-token-auth/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
        [TheToken sharedInstance].token  = responseObject[@"token"];
//        NSLog(@"success: %@", responseObject);
        
        [self getMoreUserInfo];
        [[NSNotificationCenter defaultCenter]postNotificationName:loginSuccessKey object:nil];
    } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
        NSLog(@"fail: %@", error);
    }];
}

-(void)registerUser:(NSString *)userName password:(NSString *)pw WithName:(NSString *)firstName lastName:(NSString *)lastName familyName:(NSString *)family userRole:(BOOL)userRole {
    
    //    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
    NSDictionary *userInfo = @{@"username": userName,
                               @"password": pw,
                               };
    [[NetworkController api] POST:@"api-token-auth/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
        self.theToken.token  = responseObject[@"token"];
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

-(void)getMoreUserInfo {
    [[NetworkController manager]GET:@"get-user-info/"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"Success: Get-user-Info: %@", responseObject);
             
             NSLog([NSString stringWithFormat:@"%@",[responseObject objectForKey:@"email"]]);
             NSLog([NSString stringWithFormat:@"%@",[responseObject objectForKey:@"first_name"]]);

             [self getAllUserInfo];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Failure: %@", error);
         }];
}

-(void)getAllUserInfo {
    [[NetworkController manager]GET:@"families/"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             for (NSDictionary *dict in responseObject) {
                 Family *family;
                 User *user;
                 
                 //sync families
                 BOOL familyExists = NO;
                 for (Family *newFamily in [FamilyController sharedInstance].families) {
                     if ([newFamily.familysName isEqualToString:dict[@"name"]]) {
                         familyExists = YES;
                     }
                 }
                 if (familyExists == NO) {
                     [[FamilyController sharedInstance]createFamilyWithName:dict[@"name"] familyNumber:dict[@"id"] synced:YES];
                     NSInteger fam = [FamilyController sharedInstance].families.count - 1;
                     family = [FamilyController sharedInstance].families[fam];
                 }
                 
                 //sync users
//                 for (NSDictionary *locdict in dict[@"users"]) {
//                     BOOL exists = NO;
//                     for (User *theUser in [UserController sharedInstance].users) {
//                         if (theUser.userFirstName) {
//                             <#statements#>
//                         }
//                     }
//                 }
                 
                 //sync locations
                 for (NSDictionary *locdict in dict[@"locations"]) {
                     BOOL exists = NO;
                     for (Location *location in [LocationController sharedInstance].locations) {
                         if ([location.locationTitle isEqualToString:locdict[@"title"]]) {
                             exists = YES;
                         }
                     }
                     if (exists == NO) {
                         [[LocationController sharedInstance]createLocationWithFamily:family title:locdict[@"title"] infoSnippet:locdict[@"description"] lattitude:locdict[@"lat"] longitude:locdict[@"lng"] radius:locdict[@"radius"] synced:YES];
                         NSLog(@"location created");
                     }
                     for (NSDictionary *todo in locdict[@"todos"]) {
                         Location *theLocation;
                         for (Location *location in [LocationController sharedInstance].locations) {
                             if ([location.locationTitle isEqualToString:locdict[@"title"]]) {
                                 theLocation = location;
                             }
                         }
                         BOOL completed;
                         if (todo[@"completed"] == 0) {
                             completed = NO;
                         }
                         [[ToDoItemController sharedInstance]createToDoItemWithTitle:todo[@"title"] details:todo[@"description"] location:theLocation familyName:family assignedUser:user dueDate:[self.networkC convertStringToDate:todo[@"due_date"]] isCompleted:completed synced:YES];
                     }
                 }
             }
             NSLog(@"Success: Families: %@", responseObject);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Failure: %@", error);
         }];
}

-(void)fbUserLogon {
    [[NetworkController fbManager]GET:@"get-user-info/"
                         parameters:nil
                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                NSLog(@"Success: Get-user-Info: %@", responseObject);
                                [self getAllUserInfo];
                            }
                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                NSLog(@"Failure: %@", error);
                            }];
}
@end
