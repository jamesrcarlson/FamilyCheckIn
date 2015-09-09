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

@interface LogInTableViewController () <FBSDKLoginButtonDelegate>

@property (strong, nonatomic) LogInController *logInController;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *userNameField;

@end

@implementation LogInTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logInController = [LogInController new];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.delegate = self;
    loginButton.center = self.view.center;
    loginButton.readPermissions = @[@"public_profile", @"email"];
    [self.view addSubview:loginButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        self.logInController.userN = self.userNameField.text;
        self.logInController.passW = self.passwordField.text;
        [self.logInController userLogon];
    }
    
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    NSLog(@"%@",[FBSDKAccessToken currentAccessToken].tokenString);
    NSLog(@"%@",result);
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
