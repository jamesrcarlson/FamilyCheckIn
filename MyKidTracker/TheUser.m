//
//  TheUser.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/5/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "TheUser.h"

static NSString * const TheUserFamilyNameKey = @"familyName";
static NSString * const TheUserEmailKey = @"theUserEmail";
static NSString * const TheUserFirstNameKey = @"theUserFirstName";
static NSString * const TheUserLastNameKey = @"theUserLastName";
static NSString * const TheUserPhoneNumber = @"theUserPhoneNumber";
static NSString * const TheUserPhotoKey = @"theUserPhoto";
static NSString * const TheUserRoleKey = @"theUserRole";
static NSString * const TheUserIsCheckedInKey = @"theUserIsCheckedIn";
static NSString * const TheUserFamilyKey = @"theUserFamily";
static NSString * const TokenKey = @"token";

@implementation TheUser

-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.theUserFamilyName = dictionary[TheUserFamilyNameKey];
        self.theUserEmail = dictionary[TheUserEmailKey];
        self.theUserFirstName = dictionary[TheUserFirstNameKey];
        self.theUserLastName = dictionary[TheUserLastNameKey];
        self.theUserPhoneNumber = dictionary[TheUserPhoneNumber];
        self.theUserPhoto = dictionary[TheUserPhotoKey];
        self.theUserRole = dictionary[TheUserRoleKey];
        self.theUserIsCheckedIn = dictionary[TheUserIsCheckedInKey];
        self.theUserFamily = dictionary[TheUserFamilyKey];
        self.token = dictionary[TokenKey];

    };
    
    return self;
}

-(NSDictionary *)userDictionary {
    NSDictionary *dictionary = @{ TheUserFamilyNameKey : self.theUserFamilyName,
                                  TheUserEmailKey : self.theUserEmail,
                                  TheUserFirstNameKey : self.theUserFirstName,
                                  TheUserLastNameKey : self.theUserLastName,
                                  TheUserPhoneNumber : self.theUserPhoneNumber,
                                  TheUserPhotoKey : self.theUserPhoto,
                                  TheUserRoleKey : self.theUserRole,
                                  TheUserIsCheckedInKey : self.theUserIsCheckedIn,
                                  TheUserFamilyKey : self.theUserFamily,
                                  TokenKey : self.token};
    
    return dictionary;
}

@end
