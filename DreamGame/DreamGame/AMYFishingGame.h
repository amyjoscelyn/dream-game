//
//  AMYFishingGame.h
//  DreamGame
//
//  Created by Amy Joscelyn on 10/8/15.
//  Copyright (c) 2015 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMYInteractiveItems.h"

@interface AMYFishingGame : NSObject

- (NSUInteger)goFish;

- (AMYInteractiveItems *)collectFishingPrize:(NSUInteger)prizeIndex;

@end
