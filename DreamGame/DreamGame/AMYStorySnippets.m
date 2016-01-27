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
        NSMutableArray *choice1 = [choices[0] mutableCopy];
        NSMutableArray *choice2 = [choices[1] mutableCopy];
        NSMutableArray *choice3 = [choices[2] mutableCopy];
        NSMutableArray *choice4 = [choices[3] mutableCopy];
        NSMutableArray *choice5 = [choices[4] mutableCopy];
        NSMutableArray *choice6 = [choices[5] mutableCopy];
        
        if (![choice1[0] isEqualToString:@""])
        {
            if (choice1.count == 1)
            {
                [choice1 addObject:@""];
                [choice1 addObject:@""];
            }
            //                    NSLog(@"%@ | %@ | %@", choice1[0], choice1[1], choice1[2]);
            
            //I need to make this method not incude three things within the array parsed out of choices, but just two--the text, and where it's going next (as in, which snippet to add to the snippets array to be read in the story)
            
            _choice1 = [[AMYChoice alloc] initWithIndexNumber:1 text:choice1[0] price:choice1[1] numberOfItem:choice1[2]];
            [_choices addObject:_choice1];
        }
        if (![choice2[0] isEqualToString:@""])
        {
            if (choice2.count == 1)
            {
                [choice2 addObject:@""];
                [choice2 addObject:@""];
            }
            _choice2 = [[AMYChoice alloc] initWithIndexNumber:2 text:choice2[0] price:choice2[1] numberOfItem:choice2[2]];
            [_choices addObject:_choice2];
        }
        if (![choice3[0] isEqualToString:@""])
        {
            if (choice3.count == 1)
            {
                [choice3 addObject:@""];
                [choice3 addObject:@""];
            }
            _choice3 = [[AMYChoice alloc] initWithIndexNumber:3 text:choice3[0] price:choice3[1] numberOfItem:choice3[2]];
            [_choices addObject:_choice3];
        }
        if (![choice4[0] isEqualToString:@""])
        {
            if (choice4.count == 1)
            {
                [choice4 addObject:@""];
                [choice4 addObject:@""];
            }
            _choice4 = [[AMYChoice alloc] initWithIndexNumber:4 text:choice4[0] price:choice4[1] numberOfItem:choice4[2]];
            [_choices addObject:_choice4];
        }
        if (![choice5[0] isEqualToString:@""])
        {
            if (choice5.count == 1)
            {
                [choice5 addObject:@""];
                [choice5 addObject:@""];
            }
            _choice5 = [[AMYChoice alloc] initWithIndexNumber:5 text:choice5[0] price:choice5[1] numberOfItem:choice5[2]];
            [_choices addObject:_choice5];
        }
        if (![choice6[0] isEqualToString:@""])
        {
            if (choice6.count == 1)
            {
                [choice6 addObject:@""];
                [choice6 addObject:@""];
            }
            _choice6 = [[AMYChoice alloc] initWithIndexNumber:6 text:choice6[0] price:choice6[1] numberOfItem:choice6[2]];
            [_choices addObject:_choice6];
        }
    }
    return self;
}

@end
