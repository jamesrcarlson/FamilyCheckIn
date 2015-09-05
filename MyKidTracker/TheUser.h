//
//  TheUser.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/5/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Family.h"

@interface TheUser : NSObject

@property (nonatomic, strong) NSString * theUserFamilyName;
@property (nonatomic, strong) NSString * theUserEmail;
@property (nonatomic, strong) NSString * theUserFirstName;
@property (nonatomic, strong) NSString * theUserLastName;
@property (nonatomic, strong) NSNumber * theUserPhoneNumber;
@property (nonatomic, strong) NSData * theUserPhoto;
@property (nonatomic, strong) NSNumber * theUserRole;
@property (nonatomic, strong) NSNumber * theUserIsCheckedIn;
@property (nonatomic, strong) Family *theUserFamily;
@property (strong, nonatomic) NSString *token;

-(id) initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)userDictionary;

@end
