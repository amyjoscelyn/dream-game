//
//  AMYInteractiveItems.h
//  DreamGame
//
//  Created by Amy Joscelyn on 10/7/15.
//  Copyright (c) 2015 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYInteractiveItems : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) BOOL edible;
@property (nonatomic) BOOL wearable;
@property (nonatomic) NSUInteger inherentValue;

- (instancetype)initWithName:(NSString *)name edible:(BOOL)edible wearable:(BOOL)wearable inherentValue:(NSUInteger)inherentValue;

@end
