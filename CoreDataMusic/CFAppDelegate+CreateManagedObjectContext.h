//
//  CFAppDelegate+CreateManagedObjectContext.h
//  CoreDataMusic
//
//  Created by Brad on 5/5/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFAppDelegate.h"

@interface CFAppDelegate (CreateManagedObjectContext)

-(void)createManagedObjectContextWithCompletion:(void (^)(NSManagedObjectContext *context,UIManagedDocument *document))completion;


@end
