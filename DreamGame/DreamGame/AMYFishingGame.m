//
//  AMYFishingGame.m
//  DreamGame
//
//  Created by Amy Joscelyn on 10/8/15.
//  Copyright (c) 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYFishingGame.h"
#import "AMYCharacter.h"

@implementation AMYFishingGame

- (NSUInteger)goFish
{
    NSUInteger fishingScore = arc4random_uniform(112);
    return fishingScore;
}

- (AMYInteractiveItems *)collectFishingPrize:(NSUInteger)prizeIndex
{
    if (prizeIndex % 2 == 1)
    {
        NSLog(@"You pull up your line. The hook is empty.");
        return nil;
    }
    if (prizeIndex <= 30) {
        NSLog(@"You caught a Tier 1 fish.");
        return nil;
    }
    if (prizeIndex <= 56) {
        NSLog(@"You caught a Tier 2 fish.");
        return nil;
    }
    if (prizeIndex <= 80) {
        NSLog(@"You caught a Tier 3 fish.");
        return nil;
    }
    if (prizeIndex <= 102) {
        NSLog(@"You caught a Tier 4 fish.");
        return nil;
    }
    
    /*
     tier 1: 0-30
     tier 2: 0-56
     tier 3: 20-80
     tier 4: 44-102
     tier 5: 50-112
     */
    NSLog(@"You've caught a Tier 5 fish!");
    return nil;
}

@end
