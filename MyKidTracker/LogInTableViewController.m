//
//  LogOnTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/4/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInTableViewController.h"
#import "LogInController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKAccessToken.h>
#import "ParentOptionsTableViewController.h"
#import "RegisterViewController.h"

#import "FamilyController.h"
#import "CheckInController.h"
#import "LocationController.h"
#import "CheckOutController.h"
#import "UserController.h"


@interface LogInTableViewController () <FBSDKLoginButtonDelegate>

@property (strong, nonatomic) LogInController *logInController;





@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Family *family;
@property (strong, nonatomic) CheckIn *checkin;
@property (strong, nonatomic) CheckOut *checkout;
@property (strong, nonatomic) Location *location;
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;



@end

@implementation LogInTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logInController = [LogInController new];
    
    self.loginButton = [[FBSDKLoginButton alloc] init];
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
    if ([self.loginButton.titleLabel.text isEqualToString:@"Log out"]) {
        if ([FamilyController sharedInstance].families.count < 1) {
            RegisterViewController *registerView = (RegisterViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
            [self.navigationController pushViewController:registerView animated:YES];
        }
        ParentOptionsTableViewController *parentOptions = (ParentOptionsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ParentOptionsTableViewController"];
        [self.navigationController pushViewController:parentOptions animated:YES];
    }
    UIBarButtonItem *forward = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(pushTheNextView)];
    
    self.navigationItem.rightBarButtonItem = forward;
    
    if ([FamilyController sharedInstance].families.count < 1) {
        self.family = [[FamilyController sharedInstance]createFamilyWithName:@"Stewart"];
        
        self.user = [[UserController sharedInstance]createUserWithFamily:self.family firstname:@"Joe" lastName:@"Todd" emailAddress:@"joe@gmail.com" phoneNumber:@8013100077 userRole:NO isActiveUser:YES];
        
        self.location = [[LocationController sharedInstance]createLocationWithFamily:self.family title:@"The one place" infoSnippet:@"This is another place" lattitude:@"37.316935" longitude:@"-122.21962" radius:@(25)];
        self.location = [[LocationController sharedInstance]createLocationWithFamily:self.family title:@"Home" infoSnippet:@"This is one last test" lattitude:@"37.311146" longitude:@"-122.10962" radius:@(15)];
        
    }
}

-(void)viewWillAppear:(BOOL)animated {
    LogInController *login = [LogInController new];
//    [login userLogon];
//    [login aFOAuthAttemptRegister];
}

-(void)pushTheNextView {
    ParentOptionsTableViewController *parentOptions = (ParentOptionsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ParentOptionsTableViewController"];
    [self.navigationController pushViewController:parentOptions animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    NSLog(@"%@",[FBSDKAccessToken currentAccessToken].tokenString);
    NSLog(@"%@",result);
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }

}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
    NSLog(@"logged out");
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Return the number of rows in the section.
//    return 0;
//}

@end
