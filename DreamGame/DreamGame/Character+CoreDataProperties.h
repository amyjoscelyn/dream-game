//
//  Character+CoreDataProperties.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

@interface Character (CoreDataProperties)

@property (nonatomic) int64_t charm;
@property (nonatomic) int64_t history;
@property (nonatomic) int64_t potions;
@property (nonatomic) int64_t practical;
@property (nonatomic) int64_t divining;
@property (nonatomic) int64_t healing;
@property (nonatomic) int64_t animalia;
@property (nullable, nonatomic, retain) Playthrough *playthrough;

@end

NS_ASSUME_NONNULL_END
