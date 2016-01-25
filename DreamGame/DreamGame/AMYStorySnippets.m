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

- (id)initWithFlavorText:(NSString *)flavorText indexNumber:(NSUInteger)indexNumber choice1:(NSString *)choice1 choice2:(NSString *)choice2 choice3:(NSString *)choice3 choice4:(NSString *)choice4 choice5:(NSString *)choice5 choice6:(NSString *)choice6
{
    self = [super init];
    
    if (self)
    {
        _flavorText = flavorText;
        _snippetIndexNumber = indexNumber;
        _choices = [[NSMutableArray alloc] init];
        
        //maybe here i can set up an 'if choice is blank, don't set as a property/if choice is not blank, set as property'
        
        if (![choice1 isEqualToString:@""])
        {
            _choice1 = [[AMYChoice alloc] initWithIndexNumber:1 text:choice1];
            [_choices addObject:_choice1];
        }
        if (![choice2 isEqualToString:@""])
        {
            _choice2 = [[AMYChoice alloc] initWithIndexNumber:2 text:choice2];
            [_choices addObject:_choice2];
        }
        if (![choice3 isEqualToString:@""])
        {
            _choice3 = [[AMYChoice alloc] initWithIndexNumber:3 text:choice3];
            [_choices addObject:_choice3];
        }
        if (![choice4 isEqualToString:@""])
        {
            _choice4 = [[AMYChoice alloc] initWithIndexNumber:4 text:choice4];
            [_choices addObject:_choice4];
        }
        if (![choice5 isEqualToString:@""])
        {
            _choice4 = [[AMYChoice alloc] initWithIndexNumber:5 text:choice5];
            [_choices addObject:_choice5];
        }
        if (![choice6 isEqualToString:@""])
        {
            _choice4 = [[AMYChoice alloc] initWithIndexNumber:6 text:choice6];
            [_choices addObject:_choice6];
        }
    }
    return self;
}

@end
