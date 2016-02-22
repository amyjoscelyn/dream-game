//
//  Effect.h
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Choice, Prerequisite, Question;

NS_ASSUME_NONNULL_BEGIN

@interface Effect : NSManagedObject

+ (Effect *)createEffectFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Effect+CoreDataProperties.h"
