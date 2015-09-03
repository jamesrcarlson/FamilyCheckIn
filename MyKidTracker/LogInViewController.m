//
//  LogInViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInViewController.h"
#import "UserController.h"
#import "FamilyController.h"
#import "CheckInController.h"
#import "LocationController.h"
#import "CheckOutController.h"



@interface LogInViewController ()

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Family *family;
@property (strong, nonatomic) CheckIn *checkin;
@property (strong, nonatomic) CheckOut *checkout;
@property (strong, nonatomic) Location *location;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.family = [[FamilyController sharedInstance]createFamilyWithName:@"Pete"];
//
//    self.user = [[UserController sharedInstance]createUserWithFamily:self.family firstname:@"Joe" lastName:@"Stevens" emailAddress:@"joe@gmail.com" phoneNumber:@8013100077 userRole:NO];
//
//    self.location = [[LocationController sharedInstance]createLocationWithFamily:self.family title:@"The shop" infoSnippet:@"This is one last test" lattitude:@"37.316035" longitude:@"-122.22962" radius:@25];
//    
//    self.checkin = [[CheckInController sharedInstance]createCheckInWithLocation:self.location user:self.user locationName:@"Joe's House" checkInDate:[NSDate date]];
//    [NSThread sleepForTimeInterval:120];
//    
//    self.checkout = [[CheckOutController sharedInstance]createCheckOutWithLocation:self.location user:self.user checkIn:self.checkin locationName:@"Joe's House" checkOutDate:[NSDate date]];
//    
//    self.user = [[UserController sharedInstance]createUserWithFamily:self.family firstname:@"Bill" lastName:@"Stevens" emailAddress:@"bill@gmail.com" phoneNumber:@8013100077 userRole:NO];
//    
//    self.location = [[LocationController sharedInstance]createLocationWithFamily:self.family title:@"The shop" infoSnippet:@"This is one last test" lattitude:@"37.322146" longitude:@"-122.03962" radius:@15];
//    
//    self.checkin = [[CheckInController sharedInstance]createCheckInWithLocation:self.location user:self.user locationName:@"Joe's House" checkInDate:[NSDate date]];

//    self.location = [[LocationController sharedInstance] createLocationWithFamily:self.family title:@"Tod's House" infoSnippet:@"The house where Tod lives" lattitude:@"37.332167" longitude:@"-122.04962" radius:@20];
    
//    self.location = [[LocationController sharedInstance] createLocationWithFamily:@"Boboram" title:@"Joe's House" infoSnippet:@"This is where Joe lives" lattitude:@"37.322146" longitude:@"-122.03962" radius:@15];
//    self.location = [[LocationController sharedInstance] createLocationWithFamily:@"Boboram" title:@"The shop" infoSnippet:@"This is one last test" lattitude:@"37.316035" longitude:@"-122.22962" radius:@25];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
