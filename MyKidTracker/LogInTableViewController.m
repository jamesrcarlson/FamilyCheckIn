//
//  LogOnTableViewController.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/4/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInTableViewController.h"
#import "LogInController.h"
#import "ParentOptionsTableViewController.h"
#import "RegisterViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKAccessToken.h>

#import "FamilyController.h"
#import "CheckInController.h"
#import "LocationController.h"
#import "CheckOutController.h"
#import "UserController.h"


@interface LogInTableViewController () <FBSDKLoginButtonDelegate, userDidRegisterDelegate>

@property (strong, nonatomic) LogInController *logInController;
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;


@end

@implementation LogInTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logInController = [LogInController new];
    [self registerNotifications];
    
    self.loginButton = [[FBSDKLoginButton alloc] init];
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
    UIBarButtonItem *forward = [[UIBarButtonItem alloc]initWithTitle:@"Use the App" style:UIBarButtonItemStylePlain target:self action:@selector(pushTheNextView)];
    
    
    if ([FBSDKAccessToken currentAccessToken]) {
        self.logInController.loggedIn = YES;
        self.navigationItem.rightBarButtonItem = forward;
    }
    if (self.logInController.loggedIn == YES) {
        self.navigationItem.rightBarButtonItem = forward;
        [self pushTheNextView];
    }
    if (self.logInController.loggedIn == YES) {
        [self pushTheNextView];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
    NSLog(@"loged in with FB");
    NSLog(@"%@",[FBSDKAccessToken currentAccessToken].tokenString);
    NSLog(@"%@",result);
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                           parameters:@{@"fields": @"picture, email"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSString *pictureURL = [NSString stringWithFormat:@"%@",[[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"]];
                 
                 NSLog(@"%@",result);
                 
                 NSLog(@"email is %@", [result objectForKey:@"email"]);
                 
                 NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureURL]];
                 self.imageView.image = [UIImage imageWithData:data];
                 
             }
             else{
                 NSLog(@"%@", [error localizedDescription]);
             }
         }];
    }
    
    if ([self.loginButton.titleLabel.text isEqualToString:@"Log out"]) {
        if ([FamilyController sharedInstance].families.count < 1) {
            [self pushRegisterViewController];
        }
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
    NSLog(@"logged out");
}

-(void)registerNotifications {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginSuccess) name:loginSuccessKey object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginFailure) name:loginFailureKey object:nil];
}

-(void)userDidRegisterName:(NSString *)name password:(NSString *)password {
    self.userName.text = name;
    self.password.text = password;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        [self.logInController userLogon:self.userName.text password:self.password.text];
    }
    if (indexPath.row == 5) {
        [self pushRegisterViewController];
    }
}

-(void)loginSuccess {
    [self pushTheNextView];
}

-(void)loginFailure {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Your credentials could not be verified" message:@"Please try again or register" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Re-enter user information" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Register for an account" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self pushRegisterViewController];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Use Facebook or Google" style:UIAlertActionStyleCancel handler:nil]];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Your location marker was not set" message:@"Please load the map again and drop a pin at the location you would like to store" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Got it" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

-(void)pushTheNextView {
    ParentOptionsTableViewController *parentOptions = (ParentOptionsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ParentOptionsTableViewController"];
    [self.navigationController pushViewController:parentOptions animated:YES];
}

-(void)pushRegisterViewController {
    RegisterViewController *registerView = (RegisterViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@""];
    [self.navigationController pushViewController:registerView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
