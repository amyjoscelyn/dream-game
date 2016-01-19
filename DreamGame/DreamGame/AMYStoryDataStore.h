//
//  AMYStoryDataStore.h
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYStoryDataStore : NSObject

@property (nonatomic, strong) NSMutableArray *snippets;

+ (instancetype)sharedStoryDataStore;

@end
