//
//  RegisterViewController.m
//  FamilyCheckIn
//
//  Created by James Carlson on 8/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *familyName;
@property (strong, nonatomic) IBOutlet UISwitch *parentSwitch;
@property (assign, nonatomic) BOOL parent;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parent = NO;
}

- (IBAction)parentSelected:(id)sender {
//    if (self.parentSwitch.state = 0) {
//        <#statements#>
//    }
    NSLog(@"The switch was flipped");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 5) {
        //send the registration information
        NSLog(@"The registration was sent");
        [self.delegate userDidRegisterName:self.userNameField.text password:self.passwordField.text];
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
