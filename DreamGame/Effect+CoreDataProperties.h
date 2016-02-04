//
//  Effect+CoreDataProperties.h
//  
//
//  Created by Amy Joscelyn on 2/4/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Effect.h"

NS_ASSUME_NONNULL_BEGIN

@interface Effect (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *actionObject;
@property (nullable, nonatomic, retain) NSString *actionProperty;
@property (nonatomic) BOOL boolValue;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *content;
@property (nonatomic) float floatValue;
@property (nonatomic) int64_t integerValue;
@property (nullable, nonatomic, retain) NSString *operator;
@property (nullable, nonatomic, retain) NSString *storyID;
@property (nullable, nonatomic, retain) NSSet<Choice *> *choices;
@property (nullable, nonatomic, retain) NSSet<Prerequisite *> *prerequisites;

@end

@interface Effect (CoreDataGeneratedAccessors)

- (void)addChoicesObject:(Choice *)value;
- (void)removeChoicesObject:(Choice *)value;
- (void)addChoices:(NSSet<Choice *> *)values;
- (void)removeChoices:(NSSet<Choice *> *)values;

- (void)addPrerequisitesObject:(Prerequisite *)value;
- (void)removePrerequisitesObject:(Prerequisite *)value;
- (void)addPrerequisites:(NSSet<Prerequisite *> *)values;
- (void)removePrerequisites:(NSSet<Prerequisite *> *)values;

@end

NS_ASSUME_NONNULL_END
