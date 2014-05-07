//
//  CFAppDelegate+CreateManagedObjectContext.m
//  CoreDataMusic
//
//  Created by Brad on 5/5/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFAppDelegate+CreateManagedObjectContext.h"

@implementation CFAppDelegate (CreateManagedObjectContext)

-(void)createManagedObjectContextWithCompletion:(void (^)(NSManagedObjectContext *context,UIManagedDocument *document))completion
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:@"LabelDocument"];
    self.managedDocument = [[UIManagedDocument alloc] initWithFileURL:url];
    
    __block NSManagedObjectContext *objectContext;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]]) {
        [self.managedDocument saveToURL:url
           forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              
              
              self.musicLabelContext = self.managedDocument.managedObjectContext;
              completion(self.musicLabelContext,self.managedDocument);
          }];
    } else if (self.managedDocument.documentState == UIDocumentStateClosed) {
        
        [self.managedDocument openWithCompletionHandler:^(BOOL success) {
            self.musicLabelContext = self.managedDocument.managedObjectContext;
            completion(self.musicLabelContext,self.managedDocument);
        }];
    } else {
        self.musicLabelContext = self.managedDocument.managedObjectContext;
        completion(self.musicLabelContext,self.managedDocument);
    }

}

@end
