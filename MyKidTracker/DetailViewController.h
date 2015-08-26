//
//  DetailViewController.h
//  KidTracker
//
//  Created by James Carlson on 8/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
