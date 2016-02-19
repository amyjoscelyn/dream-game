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

/*
- (void)generateChoices
{
    //parses through the Choices csv
    NSString *choiceCSVPath = [[NSBundle mainBundle] pathForResource:@"Mark-Choice-Table" ofType:@"csv"];
    NSURL *choiceCSVURL = [NSURL fileURLWithPath:choiceCSVPath];
    NSMutableArray *choiceCSVRows = [[NSArray arrayWithContentsOfCSVURL:choiceCSVURL options:CHCSVParserOptionsSanitizesFields] mutableCopy];

    [choiceCSVRows removeObjectAtIndex:0];
    
    for (NSUInteger i = 0; i < choiceCSVRows.count; i++)
    {
        NSArray *choice = choiceCSVRows[i];
        
        //content-6, storyID-0, effects-4, prerequisites-3, questionIns-2, questionOut-5, comment-1
        self.storyID = choice[0];
        self.comment = choice[1];
//        self.questionIns = choice[2];
//        self.prerequisites = choice[3];
//        self.effects = choice[4];
//        self.questionOut = choice[5];
        self.content = choice[6];
    }
    
} */

/*
 Okay.  So we have raw csv data of choices that needs to be parsed through to get the choices into their proper property homes within this entity.  If I were to have a generateChoices method, it could do something similar to the Question generateQuestions method.  Then, when I need a choice, they're already all here.  I can just access this font of them, go through this source, and take only the ones I need, as in the ones that match the ID of the current question.  It will be the same kind of logic used to find the destination question after a choice has been selected.
 */

@end
