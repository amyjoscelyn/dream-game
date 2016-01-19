//
//  AMYStoryDataStore.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYStoryDataStore.h"

@implementation AMYStoryDataStore

+ (instancetype)sharedStoryDataStore
{
    static AMYStoryDataStore *_sharedStoryDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStoryDataStore = [[AMYStoryDataStore alloc] init];
    });
    return _sharedStoryDataStore;
}

@end
