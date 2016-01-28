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
    if (self)
    {
        _content = @"Continue";
    }
    
    return self;
}

- (instancetype)initWithChoiceID:(NSString *)choiceID comment:(NSString *)comment requirements:(NSString *)requirements requirementValues:(NSString *)requirementValues effectIDs:(NSString *)effectIDs destinationID:(NSString *)destinationID content:(NSString *)content
{
    self = [super init];
    if (self)
    {
        _choiceID = choiceID;
        _comment = comment;
        _destinationID = destinationID;
        _content = content;
        
        //for requirements, since it's becoming a dictionary, there must be an equal amount of requirements to requirementValues
        _requirements = [[NSMutableDictionary alloc] init];
        
        NSMutableArray *arrayOfReqs = [[requirements componentsSeparatedByString:@","] mutableCopy];
        NSMutableArray *arrayOfReqValues = [[requirementValues componentsSeparatedByString:@","] mutableCopy];
        
        if (arrayOfReqs.count == arrayOfReqValues.count && arrayOfReqs.count)
        {
            for (NSUInteger i = 0; i < arrayOfReqs.count; i++)
            {
                [_requirements setObject:arrayOfReqs[i] forKey:arrayOfReqValues[i]];
            }
        }
        
        //_effectIDs = effectIDs;
    }
    return self;
}

@end
