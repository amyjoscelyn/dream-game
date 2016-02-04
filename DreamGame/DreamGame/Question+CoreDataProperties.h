//
//  Question+CoreDataProperties.h
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
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
@property (nullable, nonatomic, retain) Choice *choiceIns;
@property (nullable, nonatomic, retain) NSSet<Choice *> *choiceOuts;
@property (nullable, nonatomic, retain) Question *questionAfter;
@property (nullable, nonatomic, retain) NSSet<Question *> *questionBefores;

@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addChoiceOutsObject:(Choice *)value;
- (void)removeChoiceOutsObject:(Choice *)value;
- (void)addChoiceOuts:(NSSet<Choice *> *)values;
- (void)removeChoiceOuts:(NSSet<Choice *> *)values;

- (void)addQuestionBeforesObject:(Question *)value;
- (void)removeQuestionBeforesObject:(Question *)value;
- (void)addQuestionBefores:(NSSet<Question *> *)values;
- (void)removeQuestionBefores:(NSSet<Question *> *)values;

@end

NS_ASSUME_NONNULL_END
