//
//  LogInController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/3/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInController.h"
#import "TheUser+Additions.h"
#import "FamilyController.h"

static NSString * const AllUsersKey = @"allUsers";

@interface LogInController ()

@property (strong, nonatomic) Family *usersFamily;
@property (strong, nonatomic) NSArray *theUsers;

@end
@implementation LogInController

+ (LogInController *)sharedInstance {
    static LogInController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [LogInController new];
    });
    return sharedInstance;
}

-(void)userLogon {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.jc2dev.com/user/"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:50];
    [request addValue:@"application/json" forHTTPHeaderField:@"user"];
    [request setHTTPMethod:@"POST"];
//    
//    NSString *pw = @"JJCjon40";
//    NSString *uN = @"admin";
//    NSDictionary *userInfo = @{@"username": uN,
//                               @"password": pw};
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:userInfo options:0 error:nil];// can also use NSJSONWritingPrettyPrinted
//    
//    [request setHTTPBody:postData];
    
    //    NSDictionary *dict2 = [NSJSONSerialization JSONObjectWithData:postData options:NSJSONReadingAllowFragments error:nil];
    //    NSLog(@"%@",dict2);
//    [session uploadTaskWithRequest:request fromData:postData];
//    [session downloadTaskWithRequest:request];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //do something else
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dict);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //do the logon stuff
            
        });
    }];
    
    [postDataTask resume];
    
//    NSURLSessionDataTask *recieve = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//        
//        
//        
//    }];
//    
//    [recieve resume];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // this is only getting it to the main thread to process asyncronously. It should just go outside of this, and some other block of code such as to reload the tableview data - should go in there.
    });
}

-(void)saveTheUserData {
    
}

- (TheUser *)createUserWithFamily:(NSString *)family firstname:(NSString *)firstname lastName:(NSString *)lastName emailAddress:(NSString *)email phoneNumber:(NSNumber *)number userRole:(BOOL)role {
    
    self.usersFamily = [[FamilyController sharedInstance]createFamilyWithName:family];
    TheUser *user = [TheUser new];
    user.theUserFamilyName = family;
    user.theUserFirstName = firstname;
    user.theUserLastName = lastName;
    user.theUserEmail = email;
    user.theUserPhoneNumber = number;
    user.theUserIsParent = role;
    
    [self saveToPersistentStorage];
    
    return user;
}

-(void)addScoreToArray:(TheUser *)theUser {
    
    if (!theUser) {
        return;
    }
    NSMutableArray *mutableScores = self.theUsers.mutableCopy;
    [mutableScores addObject:theUser];
    
    self.theUsers = mutableScores;
    [self saveToPersistentStorage];
}

-(void)save {
    [self saveToPersistentStorage];
}

-(void)removeScore: (TheUser *)theUser {
    if (!theUser) {
        return;
    }
    NSMutableArray *mutableEntries = self.theUsers.mutableCopy;
    [mutableEntries removeObject:theUser];
    
    self.theUsers = mutableEntries;
    [self saveToPersistentStorage];
}

-(void)saveToPersistentStorage {
    NSMutableArray *usersDictionary = [NSMutableArray new];
    
    for (TheUser *theUser in self.theUsers) {
        [usersDictionary addObject:[theUser userDictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:usersDictionary forKey:AllUsersKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)loadFromStorage {
    NSArray *usersDictionaries = [[NSUserDefaults standardUserDefaults]objectForKey:AllUsersKey];
    
    NSMutableArray *users = [NSMutableArray new];
    for (NSDictionary *user in usersDictionaries) {
        [users addObject:[[TheUser alloc]initWithDictionary:user]];
    }
    self.theUsers = users;
}
@end
