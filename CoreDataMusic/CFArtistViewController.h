//
//  CFArtistViewController.h
//  CoreDataMusic
//
//  Created by Brad on 5/6/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Label.h"
#import "Artist.h"

@interface CFArtistViewController : UIViewController
@property (weak,nonatomic) NSManagedObjectContext *objectContext;
@property (strong,nonatomic) Label *selectedLabel;

@end
