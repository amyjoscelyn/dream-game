//
//  Question.m
//
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import "Question.h"

@implementation Question

- (void)generateStory
{
    //this parses through the given csv--Questions
    NSString *questionCSVPath = [[NSBundle mainBundle] pathForResource:@"Mark-Question-Questions" ofType:@"csv"];
    NSURL *questionCSVURL = [NSURL fileURLWithPath:questionCSVPath];
    NSMutableArray *questionCSVRows = [[NSArray arrayWithContentsOfCSVURL:questionCSVURL options:CHCSVParserOptionsSanitizesFields] mutableCopy];
    
    [questionCSVRows removeObjectAtIndex:0];
    
    for (NSUInteger i = 0; i < questionCSVRows.count; i++)
    {
        NSArray *question = questionCSVRows[i];
        //comment-1, content-6, storyID-0, choiceIns-4, choiceOuts-5, questionAfter-3, questionBefores-2
        self.storyID = question[0];
        self.comment = question[1];
        self.questionBefores = question[2];
        self.questionAfter = question[3];
        self.choiceIns = question[4];
        self.choiceOuts = question[5];
        self.content = question[6];
        
        //Do I need this logic?  Where would I put the properties??  Would it be in my data store?  Or would this be a part of a new story entity?  I feel like this was a tool for ease for finding the destination question from choices.  Now that I should refrain from deleting the story (because what happens if the player reverts to an old save point and half the story after is gone?), I don't think I need this in my logic flow anymore.  We'll see.
//        if ([self.comment containsString:@" - "])
//        {
//            [self.branchingOptions addObject:snippet];
//        }
//        else
//        {
//            [self.mainStorypoints addObject:snippet];
//        }
        
        //generateChoices method should go here, to fill out the choices for each question?  or should all of it happen dynamically, programmatically, while the game is in progress?  It doesn't take long, and it would save a lot of memory to have it just be in raw CSV and not all stored as separate properties until needed.  A person can only play through a fraction of the game during any one sitting/playthrough, anyway.
    }
}

@end
