//
//  ToDoItem+ToDoItem_Additions.m
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ToDoItem+Additions.h"

@implementation ToDoItem (Additions)

- (BOOL)isComplete {
    return self.completed.boolValue;
}
-(void)setIsComplete:(BOOL)isComplete {
    self.completed = @(isComplete);
}
@end
