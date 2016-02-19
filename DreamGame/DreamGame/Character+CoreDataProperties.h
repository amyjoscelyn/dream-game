//
//  Character+CoreDataProperties.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

@interface Character (CoreDataProperties)

@property (nonatomic) BOOL noMores;
@property (nonatomic) BOOL campedOut;
@property (nullable, nonatomic, retain) Playthrough *playthrough;

@end

NS_ASSUME_NONNULL_END
