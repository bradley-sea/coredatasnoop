//
//  Song.h
//  CoreDataMusic
//
//  Created by Brad on 5/5/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Song : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) Album *album;

@end
