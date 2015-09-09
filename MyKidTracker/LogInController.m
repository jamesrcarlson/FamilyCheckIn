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

static NSString * const AllUsersKey = @"allUsers";

@interface LogInController ()

@property (strong, nonatomic) Family *usersFamily;

@end

@implementation LogInController

-(void)userLogon {
    NSString *pw = @"steve";
    NSString *uN = @"Steve";
//    UIImage *image = [UIImage imageNamed:@"download.jpeg"];
    
    NSDictionary *userInfo = @{@"username": @[uN],
                               @"password": @[pw],
                               @"info":@{
                                       @"user":@"",
                                       @"phone_number": @[@810310],
                                       @"profile_pic": @[@"" ]}};
    
    [[NetworkController api]POST:@"user/" parameters:userInfo success:^(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
        NSLog(@"fail");
    }];
}

-(void)saveTheUserData {
    //get the user info and save it as the current user
}


@end
