//
//  Choice.m
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import "Choice.h"

@implementation Choice

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
        
        //content-6, storyID-0, effects-4, prerequisites-3, questionIns-2, questionOut-5, COMMENT-1
        self.storyID = choice[0];
        //comment = choice[1];  THIS IS MISSING FROM ATTRIBUTES
        self.questionIns = choice[2];
        self.prerequisites = choice[3];
        self.effects = choice[4];
        self.questionOut = choice[5];
        self.content = choice[6];
    }

    
    
}

/*
 Okay.  So we have raw csv data of choices that needs to be parsed through to get the choices into their proper property homes within this entity.  If I were to have a generateChoices method, it could do something similar to the Question generateQuestions method.  Then, when I need a choice, they're already all here.  I can just access this font of them, go through this source, and take only the ones I need, as in the ones that match the ID of the current question.  It will be the same kind of logic used to find the destination question after a choice has been selected.
 */

@end
