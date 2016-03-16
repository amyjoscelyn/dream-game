//
//  Prerequisite.h
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Choice, Effect, Question;

NS_ASSUME_NONNULL_BEGIN

@interface Prerequisite : NSManagedObject

+ (Prerequisite *)createPrerequisiteFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Prerequisite+CoreDataProperties.h"
