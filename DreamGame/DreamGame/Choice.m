//
//  Choice.m
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import "Choice.h"
#import "Question.h"
#import "Prerequisite.h"
#import "Effect.h"

@implementation Choice

+ (Choice *)createChoiceFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Choice *choice = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:managedObjectContext];
    choice.storyID = csvRow[0];
    choice.comment = csvRow[1];
    // 2 is questionIns
    // 3 is prerequisites
    // 4 is effects
    // 5 is destinationID/questionOut
    choice.content = csvRow[6];
    
//    NSLog(@"Choice: %@", choice);
    return choice;
}

- (NSString *)description
{
    NSMutableString *description = [[NSMutableString alloc] initWithString:@"Choice - "];
    [description appendFormat:@"%@ - %@", self.storyID, self.comment];
//    [description appendFormat:@"\n %@", self.effects];
    [description appendFormat:@"\n %@", self.content];
    
    return description;
}

@end
