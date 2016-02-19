//
//  AMYStoryDataStore.h
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Question+CoreDataProperties.h"
#import "Choice+CoreDataProperties.h"
#import "Effect+CoreDataProperties.h"
#import "Prerequisite+CoreDataProperties.h"
#import "Playthrough+CoreDataProperties.h"

@interface AMYStoryDataStore : NSObject

@property (strong, nonatomic, readonly) NSArray *questions;
@property (strong, nonatomic, readonly) NSArray *choices;
@property (strong, nonatomic, readonly) NSArray *effects;
@property (strong, nonatomic, readonly) NSArray *prerequisites;

@property (strong, nonatomic, readonly) Playthrough *playthrough;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic, readonly) NSSortDescriptor *sortByStoryIDAsc;

+ (instancetype)sharedStoryDataStore;

- (void)fetchData;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
