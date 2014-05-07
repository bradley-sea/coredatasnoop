//
//  CFAppDelegate.h
//  CoreDataMusic
//
//  Created by Brad on 5/5/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) NSManagedObjectContext *musicLabelContext;
@property (strong,nonatomic) UIManagedDocument *managedDocument;

@end
