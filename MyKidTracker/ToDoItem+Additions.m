//
//  ToDoItem+Additions.m
//  MyKidTracker
//
//  Created by James Carlson on 8/29/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ToDoItem+Additions.h"

@implementation ToDoItem (Additions)

-(BOOL)itemIsCompleted {
    
    return self.completed.boolValue;
    
}

-(void)setItemIsCompleted:(BOOL)itemIsCompleted {
    
    self.completed = @(itemIsCompleted);
    
}

-(BOOL)wasSyncedAlready {
    return self.syncedAlready.boolValue;
}
-(void)setWasSyncedAlready:(BOOL)wasSyncedAlready {
    self.syncedAlready = @(wasSyncedAlready);
}

@end
