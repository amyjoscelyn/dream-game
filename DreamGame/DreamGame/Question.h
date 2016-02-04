//
//  Question.h
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CHCSVParser/CHCSVParser.h>
#import "Choice.h"

@class Choice;

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSManagedObject

- (void)generateStory;

@end

NS_ASSUME_NONNULL_END

#import "Question+CoreDataProperties.h"
