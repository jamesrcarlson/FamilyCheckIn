//
//  NewLocationTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "NewLocationTableViewController.h"
#import "LocationController.h"
#import "FamiliesTableViewController.h"

@interface NewLocationTableViewController () <newLocationViewControllerDelegate, selectedAFamilyDelegate, UITextFieldDelegate>

//@property (strong, nonatomic) SetNewLocationMapViewController *setLocation;

@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UITextField *locationTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationDescriptionTextField;
@property (strong, nonatomic) IBOutlet UILabel *familyNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *radiusTextField;

@property (strong, nonatomic) Family *theSelectedFamily;

@end

@implementation NewLocationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.setLocation = [SetNewLocationMapViewController new];
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userDidSelectFamily:(Family *)familyName {
    self.theSelectedFamily = familyName;
    self.familyNameLabel.text = familyName.familysName;
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 3) {
        SetNewLocationMapViewController *setNewLocation = (SetNewLocationMapViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SetNewLocationMapView"];
        
        setNewLocation.delegate = self;
        UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:nil action:nil];
        [[self navigationItem] setBackBarButtonItem:newBackButton];
        [self.navigationController pushViewController:setNewLocation animated:YES];
    }
    if (indexPath.row == 5) {
        FamiliesTableViewController *familyList = (FamiliesTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"FamiliesTableViewController"];
        familyList.delegate = self;
        [self.navigationController pushViewController:familyList animated:YES];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (indexPath.row == 7) {
        if (!self.latitudeLabel.text) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Your location marker was not set" message:@"Please load the map again and drop a pin at the location you would like to store" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Got it" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Are you sure you don't want to add anything else?" message:@"Please verify your data" preferredStyle:UIAlertControllerStyleAlert];
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

-(void)userDidSetNewLocation:(CLLocationCoordinate2D)location {
    
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",location.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",location.longitude];
    self.locationLatitude = self.latitudeLabel.text;
    self.locationLongitude = self.longitudeLabel.text;
    [self.tableView reloadData];
}

- (void) saveData {
    NSNumberFormatter *numberF = [NSNumberFormatter new];
    numberF.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [numberF numberFromString:self.radiusTextField.text];
    
    [[LocationController sharedInstance]createLocationWithFamily:self.theSelectedFamily title:self.locationTitleTextField.text infoSnippet:self.locationDescriptionTextField.text lattitude:self.locationLatitude longitude:self.locationLongitude radius:myNumber];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SetNewLocationMapViewController *setLocation = [SetNewLocationMapViewController new];
    setLocation.delegate = self;
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStyleDone
                                                                     target:nil
                                                                     action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
}


@end
