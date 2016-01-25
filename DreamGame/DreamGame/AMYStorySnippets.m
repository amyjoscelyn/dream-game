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

- (id)initWithFlavorText:(NSString *)flavorText indexNumber:(NSUInteger)indexNumber choice1:(NSString *)choice1 choice2:(NSString *)choice2 choice3:(NSString *)choice3 choice4:(NSString *)choice4
{
    self = [super init];
    
    if (self)
    {
        _flavorText = flavorText;
        _snippetIndexNumber = indexNumber;
        
        _choice1 = [[AMYChoice alloc] initWithIndexNumber:1 text:choice1];
        _choice2 = [[AMYChoice alloc] initWithIndexNumber:2 text:choice2];
        _choice3 = [[AMYChoice alloc] initWithIndexNumber:3 text:choice3];
        _choice4 = [[AMYChoice alloc] initWithIndexNumber:4 text:choice4];
        
        _choices = [[NSMutableArray alloc] init];
        _choices = [ @[ _choice1, _choice2, _choice3, _choice4 ] mutableCopy];
    }
    return self;
}

@end
