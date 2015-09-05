//
//  CreateToDoListTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/26/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "CreateToDoListTableViewController.h"
#import "LocationsTableViewController.h"
#import "ToDoItemController.h"
#import "FamiliesTableViewController.h"
#import "UserListTableViewController.h"


@interface CreateToDoListTableViewController () <selectLocationDelegate, selectedAFamilyDelegate, selectedUserDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSString *locationTitleHolder;
@property (strong, nonatomic) IBOutlet UITextField *itemTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *itemDescriptionTextField;
@property (strong, nonatomic) IBOutlet UILabel *familyNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *assignedUserLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) Location *location;
@property (strong, nonatomic) Family *theFamily;
@property (strong, nonatomic) User *userSelected;

@end

@implementation CreateToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.clearsSelectionOnViewWillAppear = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userDidSelectFamily:(Family *)familyName {
    self.theFamily = familyName;
    self.familyNameLabel.text = familyName.familysName;
    [self.tableView reloadData];
}

-(void)userDidSelectUser:(User *)userSelected {
    self.userSelected = userSelected;
    self.assignedUserLabel.text = [NSString stringWithFormat:@"%@ %@",userSelected.userFirstName, userSelected.userLastName];
    [self.tableView reloadData];
}

- (IBAction)pickedDate:(id)sender {
    
}

-(void)userDidSelectLocation:(Location *)location locationTitle:(NSString *)locationTitle withLocation:(NSString *)longitude latitude:(NSString *)latitude{
    self.location = location;
    self.locationTitleHolder = locationTitle;
    self.locationNameLabel.text = locationTitle;
    self.longitudeLabel.text = longitude;
    self.latitudeLabel.text = latitude;
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        LocationsTableViewController *locations = (LocationsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LocationsTableViewController"];
        locations.delegate = self;
        [self.navigationController pushViewController:locations animated:YES];
    }
    if (indexPath.row == 6) {
        FamiliesTableViewController *familyList = (FamiliesTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"FamiliesTableViewController"];
        familyList.delegate = self;
        [self.navigationController pushViewController:familyList animated:YES];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (indexPath.row == 7) {
        UserListTableViewController *userList = (UserListTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"UserListTableViewController"];
        userList.delegate = self;
        [self.navigationController pushViewController:userList animated:YES];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (indexPath.row == 10) {
        if (!self.itemTitleTextField.text) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Your to-do item does not have a title" message:@"Please enter in a title before you save the item" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Got it" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Are you sure everything is correct?" message:@"Please verify your data" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"The data is correct" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                [self saveData];
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }]];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"I want to change something" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {

            }]];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
    }
}

- (void) saveData {
    [[ToDoItemController sharedInstance]createToDoItemWithTitle:self.itemTitleTextField.text details:self.itemDescriptionTextField.text location:self.location familyName:self.theFamily assignedUser:self.userSelected dueDate:self.datePicker.date isCompleted:NO];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
