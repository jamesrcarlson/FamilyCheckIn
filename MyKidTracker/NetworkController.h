//
//  NetworkController.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/8/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <FBSDKAccessToken.h>
#import <UIKit/UIKit.h>
#import "TheToken.h"

static NSString * const URLStringKey = @"http://api.jc2dev.com/";
static NSString * const clientIDKey = @"qET1UVJIgRs43N1zW61dByL5kCOYOJ4rwPQC44zk";
static NSString * const clientSecretKey = @"sOMAOCsvSYS5OjxWWUOb6ujGHh3YgZEZTouPJrvF9RRYQeplf8YGQkwc99EaF3JCsKoQD4mmA7mk0fhJsDzaEbEv0eoLh53J1ZwYLip32XwISgLlyOA4VH0UGoXwzi9x";

static NSString * const AllUsersKey = @"allUsers";

@interface NetworkController : NSObject

+ (AFHTTPSessionManager *)api;
+ (AFHTTPRequestOperationManager *)manager ;
+ (AFHTTPRequestOperationManager *)fbManager;

- (NSString *)encodeImageToBase64String:(UIImage *)image;

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodedData;

@end
