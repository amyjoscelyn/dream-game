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

- (id)initWithFlavorText:(NSString *)flavorText indexNumber:(NSUInteger)indexNumber
{
    self = [super init];
    
    if (self)
    {
        _flavorText = flavorText;
        _snippetIndexNumber = indexNumber;
        _choices = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithFlavorText:(NSString *)flavorText indexNumber:(NSUInteger)indexNumber choices:(NSArray *)choices
{
    self = [super init];
    
    if (self)
    {
        _flavorText = flavorText;
        _snippetIndexNumber = indexNumber;
        _choices = [[NSMutableArray alloc] init];
        
        /*      I can't do this more graceful approach yet, until I figure out how to make _choice# not nil when I insert it into this first array (because I don't initialize it until after it's in the array--and too late), or I can find a way to iterate through all of the choices without having to resort to putting the properties in an array in the first place.
        NSArray *choiceProperties = @[ _choice1, _choice2, _choice3, _choice4, _choice5, _choice6 ];
        
        for (NSUInteger i = 0; i < choices.count; i++)
        {
            NSString *choiceText = choices[i];
            AMYChoice *choiceProperty = choiceProperties[i];
            
            if (![choiceText isEqualToString:@""])
            {
                choiceProperty = [[AMYChoice alloc] initWithIndexNumber:(i + 1) text:choiceText];
                [_choices addObject:choiceProperty];
            }
        }
         */
        
                if (![choices[0] isEqualToString:@""])
                {
                    _choice1 = [[AMYChoice alloc] initWithIndexNumber:1 text:choices[0]];
                    [_choices addObject:_choice1];
                }
                if (![choices[1] isEqualToString:@""])
                {
                    _choice2 = [[AMYChoice alloc] initWithIndexNumber:2 text:choices[1]];
                    [_choices addObject:_choice2];
                }
                if (![choices[2] isEqualToString:@""])
                {
                    _choice3 = [[AMYChoice alloc] initWithIndexNumber:3 text:choices[2]];
                    [_choices addObject:_choice3];
                }
                if (![choices[3] isEqualToString:@""])
                {
                    _choice4 = [[AMYChoice alloc] initWithIndexNumber:4 text:choices[3]];
                    [_choices addObject:_choice4];
                }
                if (![choices[4] isEqualToString:@""])
                {
                    _choice5 = [[AMYChoice alloc] initWithIndexNumber:5 text:choices[4]];
                    [_choices addObject:_choice5];
                }
                if (![choices[5] isEqualToString:@""])
                {
                    _choice6 = [[AMYChoice alloc] initWithIndexNumber:6 text:choices[5]];
                    [_choices addObject:_choice6];
                }
    }
    return self;
}

@end
