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


@property (assign, nonatomic) BOOL loggedIn;

-(void)userLogon:(NSString *)username password:(NSString *)pw ;

//-(void)aFOAuthAttemptRegister;

-(void)registerUser:(NSString *)userName password:(NSString *)pw WithName:(NSString *)firstName lastName:(NSString *)lastName familyName:(NSString *)family userRole:(BOOL)userRole;

-(void)registerFacebookUserFamily:(NSString *)familyName userRole:(BOOL)userRole;

-(void)registerGoogleUserFamily:(NSString *)familyName userRole:(BOOL)userRole;

@end
