//
//  Playthrough+CoreDataProperties.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Playthrough.h"

NS_ASSUME_NONNULL_BEGIN

@interface Playthrough (CoreDataProperties)

@property (nullable, nonatomic, retain) Question *currentQuestion;
@property (nullable, nonatomic, retain) NSManagedObject *playerCharacter;

@end

NS_ASSUME_NONNULL_END
