//
//  FacebookController.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/8/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "FacebookController.h"

@interface FacebookController ()

@property (strong, nonatomic) NSString *profileUserID;
@property (strong, nonatomic) NSString *profileUserFirstN;
@property (strong, nonatomic) NSString *profileUserLastN;

@end
@implementation FacebookController

-(void)getProfileInformation {
    
    FBSDKProfile *profile = [FBSDKProfile new];
    
    self.profileUserID = profile.userID;
    self.profileUserFirstN = profile.firstName;
    self.profileUserLastN = profile.lastName;
    
    UIImageView *imageView = [UIImageView new];

    if ([FBSDKAccessToken currentAccessToken]) {

        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                           parameters:@{@"fields": @"picture, email"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 
                 NSString *pictureURL = [NSString stringWithFormat:@"%@",[result objectForKey:@"picture"]];
                 
                 NSLog(@"email is %@", [result objectForKey:@"email"]);
                 NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
                 
                 NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureURL]];
                 imageView.image = [UIImage imageWithData:data];
                 
             }
             else{
                 NSLog(@"%@", [error localizedDescription]);
             }
         }];
    }
}

@end
