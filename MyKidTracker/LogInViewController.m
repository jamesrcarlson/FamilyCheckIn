//
//  LogInViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInViewController.h"
#import "LocationController.h"

@interface LogInViewController ()

@property (strong,nonatomic) Location *location;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.location = [[LocationController sharedInstance] createLocationWithFamile:@"TestFamily" title:@"testing" infoSnippet:@"This is a test" lattitude:@"37.342167" longitude:@"-122.05962" radius:@20];
//    self.location = [[LocationController sharedInstance] createLocationWithFamile:@"TestFamily" title:@"testing 2" infoSnippet:@"This is another test" lattitude:@"37.352146" longitude:@"-122.04962" radius:@15];
//    self.location = [[LocationController sharedInstance] createLocationWithFamile:@"TestFamily" title:@"testing 3" infoSnippet:@"This is one last test" lattitude:@"37.336035" longitude:@"-122.26962" radius:@25];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end