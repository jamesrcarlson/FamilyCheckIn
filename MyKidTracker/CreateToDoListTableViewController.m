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

@interface CreateToDoListTableViewController () <selectLocationDelegate>

@property (strong, nonatomic) NSString *locationTitleHolder;
@property (strong, nonatomic) IBOutlet UITextField *itemTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *itemDescriptionTextField;
@property (strong, nonatomic) IBOutlet UITextField *familyNameTextField;
@property (strong, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation CreateToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pickedDate:(id)sender {
    
}

-(void)userDidSelectLocation:(NSString *)locationTitle withLocation:(NSString *)longitude latitude:(NSString *)latitude{
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
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        LocationsTableViewController *locations = (LocationsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LocationsTableViewController"];
        locations.delegate = self;
        [self.navigationController pushViewController:locations animated:YES];
    }
    if (indexPath.row == 9) {
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
    [[ToDoItemController sharedInstance]createToDoItemWithTitle:self.itemTitleTextField.text details:self.itemDescriptionTextField.text locationName:self.locationTitleHolder familyName:self.familyNameTextField.text dueDate:self.datePicker.date isComplete:@"no"];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    LocationsTableViewController *getLocation = [LocationsTableViewController new];
//    getLocation.delegate = self;
//    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
//                                                                      style:UIBarButtonItemStyleDone
//                                                                     target:nil
//                                                                     action:nil];
//    [[self navigationItem] setBackBarButtonItem:newBackButton];
//}

@end
