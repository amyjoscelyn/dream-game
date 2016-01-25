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

- (instancetype)initWithIndexNumber:(NSUInteger)indexNumber text:(NSString *)text price:(NSString *)price numberOfItem:(NSString *)numberOfItem
{
    self = [super init];
    
    if (self)
    {
        if (![price isEqualToString:@""])
        {
            _price = price.integerValue;
        }
        if (![numberOfItem isEqualToString:@""])
        {
            _numberOfItem = numberOfItem.integerValue;
        }
        
        _indexNumber = indexNumber;
        _text = text;
    }
    return self;
}

@end
