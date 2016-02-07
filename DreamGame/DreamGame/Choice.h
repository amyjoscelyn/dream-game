//
//  Choice.h
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question, Effect, Prerequisite;

NS_ASSUME_NONNULL_BEGIN

@interface Choice : NSManagedObject

//- (void)generateChoices;

+ (Choice *)createChoiceFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Choice+CoreDataProperties.h"
