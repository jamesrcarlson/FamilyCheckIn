//
//  ToDoItem+ToDoItem_Additions.m
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ToDoItem+Additions.h"

@implementation ToDoItem (Additions)


- (BOOL)isCompleted {
    return self.completed.boolValue;
}

-(void)setIsCompleted:(BOOL)isCompleted {
    self.completed = @(isCompleted);
}
@end
