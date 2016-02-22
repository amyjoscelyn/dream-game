//
//  Question+CoreDataProperties.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/22/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface Question (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSString *storyID;
@property (nullable, nonatomic, retain) NSSet<Choice *> *choiceIns;
@property (nullable, nonatomic, retain) NSSet<Choice *> *choiceOuts;
@property (nullable, nonatomic, retain) NSSet<Effect *> *effects;
@property (nullable, nonatomic, retain) Playthrough *playthrough;
@property (nullable, nonatomic, retain) Question *questionAfter;
@property (nullable, nonatomic, retain) NSSet<Question *> *questionBefores;
@property (nullable, nonatomic, retain) NSSet<Prerequisite *> *prerequisites;

@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addChoiceInsObject:(Choice *)value;
- (void)removeChoiceInsObject:(Choice *)value;
- (void)addChoiceIns:(NSSet<Choice *> *)values;
- (void)removeChoiceIns:(NSSet<Choice *> *)values;

- (void)addChoiceOutsObject:(Choice *)value;
- (void)removeChoiceOutsObject:(Choice *)value;
- (void)addChoiceOuts:(NSSet<Choice *> *)values;
- (void)removeChoiceOuts:(NSSet<Choice *> *)values;

- (void)addEffectsObject:(Effect *)value;
- (void)removeEffectsObject:(Effect *)value;
- (void)addEffects:(NSSet<Effect *> *)values;
- (void)removeEffects:(NSSet<Effect *> *)values;

- (void)addQuestionBeforesObject:(Question *)value;
- (void)removeQuestionBeforesObject:(Question *)value;
- (void)addQuestionBefores:(NSSet<Question *> *)values;
- (void)removeQuestionBefores:(NSSet<Question *> *)values;

- (void)addPrerequisitesObject:(Prerequisite *)value;
- (void)removePrerequisitesObject:(Prerequisite *)value;
- (void)addPrerequisites:(NSSet<Prerequisite *> *)values;
- (void)removePrerequisites:(NSSet<Prerequisite *> *)values;

@end

NS_ASSUME_NONNULL_END
