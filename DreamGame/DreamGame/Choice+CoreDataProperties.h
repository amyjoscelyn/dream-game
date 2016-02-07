//
//  Choice+CoreDataProperties.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/7/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Choice.h"

NS_ASSUME_NONNULL_BEGIN

@interface Choice (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSString *storyID;
@property (nullable, nonatomic, retain) NSSet<Effect *> *effects;
@property (nullable, nonatomic, retain) NSSet<Prerequisite *> *prerequisites;
@property (nullable, nonatomic, retain) NSSet<Question *> *questionIns;
@property (nullable, nonatomic, retain) Question *questionOut;

@end

@interface Choice (CoreDataGeneratedAccessors)

- (void)addEffectsObject:(Effect *)value;
- (void)removeEffectsObject:(Effect *)value;
- (void)addEffects:(NSSet<Effect *> *)values;
- (void)removeEffects:(NSSet<Effect *> *)values;

- (void)addPrerequisitesObject:(Prerequisite *)value;
- (void)removePrerequisitesObject:(Prerequisite *)value;
- (void)addPrerequisites:(NSSet<Prerequisite *> *)values;
- (void)removePrerequisites:(NSSet<Prerequisite *> *)values;

- (void)addQuestionInsObject:(Question *)value;
- (void)removeQuestionInsObject:(Question *)value;
- (void)addQuestionIns:(NSSet<Question *> *)values;
- (void)removeQuestionIns:(NSSet<Question *> *)values;

@end

NS_ASSUME_NONNULL_END
