//
//  AMYInteractiveItems.m
//  DreamGame
//
//  Created by Amy Joscelyn on 10/7/15.
//  Copyright (c) 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYInteractiveItems.h"

@implementation AMYInteractiveItems

- (instancetype)init
{
    self = [self initWithName:@""
                       edible:NO
                     wearable:NO
                inherentValue:0];
    return self;
}

- (instancetype)initWithName:(NSString *)name
                      edible:(BOOL)edible
                    wearable:(BOOL)wearable
               inherentValue:(NSUInteger)inherentValue
{
    self = [super init];
    if (self)
    {
        _name = name;
        _edible = edible;
        _wearable = wearable;
        _inherentValue = inherentValue;
    }
    return self;
}

- (NSString *)description
{
    return self.name;
}

@end
