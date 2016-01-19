//
//  AMYChoice.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYChoice.h"

@implementation AMYChoice

- (instancetype)init
{
    self = [super init];
    return self;
}

- (instancetype)initWithIndexNumber:(NSUInteger)indexNumber text:(NSString *)text
{
    self = [super init];
    
    if (self)
    {
        _indexNumber = indexNumber;
        _text = text;
    }
    return self;
}

@end
