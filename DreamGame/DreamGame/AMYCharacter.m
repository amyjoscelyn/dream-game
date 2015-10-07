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
    self = [self initWithName:@"Amy"];
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

@end
