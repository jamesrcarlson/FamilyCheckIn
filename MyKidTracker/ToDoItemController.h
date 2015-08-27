//
//  ToDoItemController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"

@interface ToDoItemController : NSObject

@property (strong, nonatomic) NSArray *user;

+ (ToDoItemController *)sharedInstance;

- (ToDoItem *)createToDoItemWithTitle:(NSString *)title details:(NSString *)description locationName:(NSString *)location familyName:(NSString *)familyName dueDate:(NSDate *)date isComplete:(Boolean *)completed;


@end
