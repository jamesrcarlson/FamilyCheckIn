//
//  LogInController.h
//  MyKidTracker
//
//  Created by James Carlson on 9/3/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Token.h"

static NSString * const loginFailureKey = @"loginFailed";
static NSString * const loginSuccessKey = @"loginSuccessful";

@interface LogInController : NSObject

@property (strong, nonatomic) NSString *userN;
@property (strong, nonatomic) NSString *passW;
@property (assign, nonatomic) BOOL loggedIn;

-(void)userLogon;
//-(void)getSomeInfo;
//-(void)aFOAuthAttemptRegister;

-(void)customUserName:(NSString *)username password:(NSString *)password;
-(void)getUserInfo;
-(void)registerUserWithName:(NSString *)firstName lastName:(NSString *)lastName familyName:(NSString *)family userRole:(BOOL)userRole;
-(void)registerFacebookUserFamily:(NSString *)familyName userRole:(BOOL)userRole;
-(void)registerGoogleUserFamily:(NSString *)familyName userRole:(BOOL)userRole;

@end
