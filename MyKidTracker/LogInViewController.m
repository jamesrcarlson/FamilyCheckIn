//
//  LogInViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInViewController.h"
#import "LocationController.h"
#import "ChildController.h"
#import "CheckInController.h"
#import "ToDoItemController.h"
#import "UserController.h"

@interface LogInViewController ()

@property (strong,nonatomic) Location *location;
@property (strong, nonatomic) Child*child;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.child = [[ChildController sharedInstance]createChildWithFamilyName:@"boboram" firstname:@"Tony" lastName:@"Stevens" emailAddress:@"tony@gmail.com" phoneNumber:@8013100077];
//
//        self.location = [[LocationController sharedInstance] createLocationWithFamily:@"Boboram" title:@"Tod's House" infoSnippet:@"The house where Tod lives" lattitude:@"37.332167" longitude:@"-122.04962" radius:@20];
//    self.location = [[LocationController sharedInstance] createLocationWithFamily:@"Boboram" title:@"Joe's House" infoSnippet:@"This is where Joe lives" lattitude:@"37.322146" longitude:@"-122.03962" radius:@15];
//    self.location = [[LocationController sharedInstance] createLocationWithFamily:@"Boboram" title:@"testing" infoSnippet:@"This is one last test" lattitude:@"37.316035" longitude:@"-122.22962" radius:@25];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
