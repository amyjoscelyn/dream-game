//
//  Question.h
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CHCSVParser/CHCSVParser.h> //do I need this imported here?

@class Choice, Effect, Playthrough, Prerequisite;

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSManagedObject

//- (void)generateStory;

+ (Question *)createQuestionFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Question+CoreDataProperties.h"
