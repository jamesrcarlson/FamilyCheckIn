//
//  LogOnTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/4/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LogInTableViewController.h"
#import "LogInController.h"

@interface LogInTableViewController ()

@property (strong, nonatomic) LogInController *logInController;

@end

@implementation LogInTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logInController = [LogInController new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        [self.logInController userLogon];
    }
    
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
