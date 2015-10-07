//
//  AMYCharacter.m
//  DreamGame
//
//  Created by Amy Joscelyn on 10/7/15.
//  Copyright (c) 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYCharacter.h"

@implementation AMYCharacter

- (instancetype)init
{
    self = [self initWithName:@""];
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        _name = name;
        
        _moods = [[NSMutableArray alloc] init];
        _skills = [[NSMutableArray alloc] init];
        _traits = [[NSMutableArray alloc] init];
        _inventory = [[NSMutableArray alloc] init];
        _knowledge = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)eatFood:(AMYInteractiveItems *)food
{//hungry being a mood you can put into and out of the moods array
//    if (self.moods containsObject:hungry) {
//        hungry = NO;
//    }
    [self.inventory removeObject:food];
    NSLog(@"Mmm, that %@ was delicious!", food.name);
}

- (void)takeItem:(AMYInteractiveItems *)item
{
    [self.inventory addObject:item];
}

- (void)learnSkill
{
    
}

- (void)feel
{
    
}

- (void)sleep
{
    
}

@end
