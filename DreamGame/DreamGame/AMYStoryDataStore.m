//
//  AMYStoryDataStore.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYStoryDataStore.h"
#import <CHCSVParser/CHCSVParser.h>
#import "Prerequisite+CoreDataProperties.h"
#import "Effect+CoreDataProperties.h"
#import "Choice+CoreDataProperties.h"

@interface AMYStoryDataStore()

@property (strong, nonatomic, readwrite) NSArray *questions;
@property (strong, nonatomic, readwrite) NSArray *choices;
@property (strong, nonatomic, readwrite) NSArray *effects;
@property (strong, nonatomic, readwrite) NSArray *prerequisites;

@property (strong, nonatomic) NSSortDescriptor *sortByStoryIDAsc;

@end

@implementation AMYStoryDataStore

+ (instancetype)sharedStoryDataStore
{
    static AMYStoryDataStore *_sharedStoryDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStoryDataStore = [[AMYStoryDataStore alloc] init];
    });
    return _sharedStoryDataStore;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _sortByStoryIDAsc = [NSSortDescriptor sortDescriptorWithKey:@"storyID" ascending:YES];
    }
    return self;
}

#pragma mark - Fetch Requests

- (void)fetchData
{
    NSFetchRequest *effectRequest = [NSFetchRequest fetchRequestWithEntityName:@"Effect"];
    effectRequest.sortDescriptors = @[self.sortByStoryIDAsc];
    
    self.effects = [self.managedObjectContext executeFetchRequest:effectRequest error:nil];
    
    if (self.effects.count == 0)
    {
        [self generateEffects];
    }
    
    NSFetchRequest *prerequisiteRequest = [NSFetchRequest fetchRequestWithEntityName:@"Prerequisite"];
    prerequisiteRequest.sortDescriptors = @[self.sortByStoryIDAsc];
    
    self.prerequisites = [self.managedObjectContext executeFetchRequest:prerequisiteRequest error:nil];
    
    if (self.prerequisites.count == 0)
    {
        [self generatePrerequisites];
    }

    NSFetchRequest *choiceRequest = [NSFetchRequest fetchRequestWithEntityName:@"Choice"];
    choiceRequest.sortDescriptors = @[self.sortByStoryIDAsc];
    
    self.choices = [self.managedObjectContext executeFetchRequest:choiceRequest error:nil];
    
    if (self.choices.count == 0)
    {
        [self generateChoices];
    }
}

# pragma Generator Methods

- (void)generateEffects
{
    // read from the CSV to get an array
    //this parses through the given csv--Effects
    
    NSArray *effectRows = [self parsedCSVContentsWithFileName:@"Effects-Table 1"];
    
    for (NSArray *csvRow in effectRows)
    {
        [Effect createEffectFromCSVRow:csvRow managedObjectContext:self.managedObjectContext];
    }
    [self saveContext];
    [self fetchData];
}

- (void)generatePrerequisites
{
    // read from the CSV to get an array
    //this parses through the given csv--Prerequisite
    
    NSArray *prerequisiteRows = [self parsedCSVContentsWithFileName:@"Prerequisite-Table 1"];
    
    for (NSArray *csvRow in prerequisiteRows)
    {
        [Prerequisite createPrerequisiteFromCSVRow:csvRow managedObjectContext:self.managedObjectContext];
    }
    [self saveContext];
    [self fetchData];
}

- (void)generateChoices
{
    // read from the CSV to get an array
    //this parses through the given csv--Choice
    
    NSArray *choiceRows = [self parsedCSVContentsWithFileName:@"Choice-Table 1"];
    
    for (NSArray *csvRow in choiceRows)
    {
        [Choice createChoiceFromCSVRow:csvRow managedObjectContext:self.managedObjectContext];
    }
    [self saveContext];
    [self fetchData];
}

# pragma CSV Parser method

- (NSArray *)parsedCSVContentsWithFileName:(NSString *)fileName {
    NSString *csvPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"csv"];
    NSURL *csvURL = [NSURL fileURLWithPath:csvPath];
    NSMutableArray *csvRows = [[NSArray arrayWithContentsOfCSVURL:csvURL options:CHCSVParserOptionsSanitizesFields] mutableCopy];
    
    // removes header from the contents
    [csvRows removeObjectAtIndex:0];

    return csvRows;
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory
{
    // The directory the application uses to store the Core Data store file. This code uses a directory named "AMY.Dream" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel
{
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DreamGame" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DreamGame.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext
{
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator)
    {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
