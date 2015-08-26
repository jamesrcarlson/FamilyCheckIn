//
//  NewLocationTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "NewLocationTableViewController.h"
#import "LocationController.h"

@interface NewLocationTableViewController () <newLocationViewControllerDelegate>

@property (strong, nonatomic) SetNewLocationMapViewController *setLocation;

@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UITextField *locationTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationDescriptionTextField;
@property (strong, nonatomic) IBOutlet UITextField *familyNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *radiusTextField;

@end

@implementation NewLocationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.setLocation = [SetNewLocationMapViewController new];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    if (self.locationLatitude) {
        self.latitudeLabel.text = self.setLocation.latitudeText;
        self.longitudeLabel.text = self.setLocation.longitudeText;
        [self.tableView reloadData];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 8;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 3) {
//        SetNewLocationMapViewController *setLocation = (SetNewLocationMapViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SetNewLocationMapView"];
//        [self.navigationController pushViewController:setLocation animated:YES];
//        
//    }
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
                //            self.textField.text = @"";
                //            [self needBetterInput];
            }]];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
        
    }
    
}

-(void)userDidSetNewLocation:(CLLocationCoordinate2D)location {
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",location.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",location.longitude];
//    NSLog(self.locationLongitude);
    [self.tableView reloadData];
}

- (void) saveData {
//    [[LocationController sharedInstance]createLocationWithFamily:self.familyNameTextField title:self.locationTitleTextField infoSnippet:self.locationDescriptionTextField lattitude:self.locationLatitude longitude:self.locationLongitude radius:self.radiusTextField];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SetNewLocationMapViewController *setLocation = [SetNewLocationMapViewController new];
    setLocation.delegate = self;
}


@end
