//
//  Character.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Playthrough;

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSManagedObject

+ (Character *)createNewCharacterWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Character+CoreDataProperties.h"
