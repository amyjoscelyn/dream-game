//
//  Choice.h
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Question.h"
#import "Effect.h"
#import "Prerequisite.h"

NS_ASSUME_NONNULL_BEGIN

@interface Choice : NSManagedObject

//- (Choice *)getChoiceForQuestion:(Question *)

- (void)generateChoices;

@end

NS_ASSUME_NONNULL_END

#import "Choice+CoreDataProperties.h"
