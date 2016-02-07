//
//  AMYStoryDataStore.h
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface AMYStoryDataStore : NSObject

@property (strong, nonatomic, readonly) NSArray *questions;
@property (strong, nonatomic, readonly) NSArray *choices;
@property (strong, nonatomic, readonly) NSArray *effects;
@property (strong, nonatomic, readonly) NSArray *prerequisites;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSMutableArray *snippets;

+ (instancetype)sharedStoryDataStore;

- (void)fetchData;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
