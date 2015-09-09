//
//  NetworkController.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/8/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@interface NetworkController : NSObject

+ (AFHTTPSessionManager *)api;


@end
