//
//  AMYStorySnippets.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYStorySnippets.h"

@implementation AMYStorySnippets

- (instancetype)init
{
    self = [super init];
    return self;
}

- (instancetype)initWithQuestionID:(NSString *)questionID comment:(NSString *)comment effects:(NSString *)effectIDs choices:(NSArray *)choices destination:(NSString *)destinationID content:(NSString *)content
{
    self = [super init];
    if (self)
    {
        _questionID = questionID;
        _comment = comment;
        _destinationID = destinationID;
        _content = content;
        _choices = [[NSMutableArray alloc] init];
        
        if (choices.count)
        {
            for (NSUInteger i = 0; i < choices.count; i++)
            {
                NSArray *choice = choices[i];
                
                NSString *choiceID = choice[0];
                NSString *comment = choice[1];
                NSString *requirement = choice[2];
                NSString *requirementValue = choice[3];
                NSString *effectIDs = choice[4];
                NSString *choiceDestinationID = choice[5];
                NSString *content = choice[6];
                
                if (i == 0)
                {
                    _choice1 = [[AMYChoice alloc] initWithChoiceID:choiceID comment:comment requirements:requirement requirementValues:requirementValue effectIDs:effectIDs destinationID:choiceDestinationID content:content];
//                    NSLog(@"choice1 destination: %@", _choice1.destinationID);
                    [_choices addObject:_choice1];
                }
                else if (i == 1)
                {
                    _choice2 = [[AMYChoice alloc] initWithChoiceID:choiceID comment:comment requirements:requirement requirementValues:requirementValue effectIDs:effectIDs destinationID:choiceDestinationID content:content];
//                    NSLog(@"choice2 dest: %@", _choice2.destinationID);
                    [_choices addObject:_choice2];
                }
                else if (i == 2)
                {
                    _choice3 = [[AMYChoice alloc] initWithChoiceID:choiceID comment:comment requirements:requirement requirementValues:requirementValue effectIDs:effectIDs destinationID:choiceDestinationID content:content];
//                    NSLog(@"choice3 dest: %@", _choice3.destinationID);
                    [_choices addObject:_choice3];
                }
                else if (i == 3)
                {
                    _choice4 = [[AMYChoice alloc] initWithChoiceID:choiceID comment:comment requirements:requirement requirementValues:requirementValue effectIDs:effectIDs destinationID:choiceDestinationID content:content];
                    //                    NSLog(@"choice4 dest: %@", _choice4.destinationID);
                    [_choices addObject:_choice4];
                }
                else if (i == 4)
                {
                    _choice5 = [[AMYChoice alloc] initWithChoiceID:choiceID comment:comment requirements:requirement requirementValues:requirementValue effectIDs:effectIDs destinationID:choiceDestinationID content:content];
                    //                    NSLog(@"choice5 dest: %@", _choice5.destinationID);
                    [_choices addObject:_choice5];
                }
                else
                {
                    _choice6 = [[AMYChoice alloc] initWithChoiceID:choiceID comment:comment requirements:requirement requirementValues:requirementValue effectIDs:effectIDs destinationID:choiceDestinationID content:content];
                }
            }
        }
        
        //_effects = effects;
    }
    return self;
}

@end
