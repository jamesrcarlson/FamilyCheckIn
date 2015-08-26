//
//  NewLocationTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "NewLocationTableViewController.h"
#import "SetNewLocationMapViewController.h"

@interface NewLocationTableViewController ()

@property (strong, nonatomic) SetNewLocationMapViewController *setLocation;

@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UITextField *locationTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationDescriptionTextField;
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
    return 7;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 3) {
//        SetNewLocationMapViewController *setLocation = (SetNewLocationMapViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SetNewLocationMapView"];
//        [self.navigationController pushViewController:setLocation animated:YES];
//        
//    }
    if (indexPath.row == 6) {
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

- (void) saveData {
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
