//
//  NetworkController.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/8/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "NetworkController.h"
#import <FBSDKAccessToken.h>


@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.jc2dev.com/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];
        
    });
    return api;
}

-(void)addFcebookToken {
    FBSDKAccessToken *token =[FBSDKAccessToken currentAccessToken];
    if ([token isEqualToAccessToken:token]) {
        
    };
}
// put this into the code to add the token to the session [self.apiSession.requestSerializer setValue:account.currentAuthToken forHTTPHeaderField:@"X-Auth-Token”];`
@end
