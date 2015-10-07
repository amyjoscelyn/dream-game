//
//  AMYCharacter.h
//  DreamGame
//
//  Created by Amy Joscelyn on 10/7/15.
//  Copyright (c) 2015 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYCharacter : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *moods;
@property (nonatomic, strong) NSMutableArray *skills;
@property (nonatomic, strong) NSMutableArray *traits;
@property (nonatomic, strong) NSMutableArray *inventory;
@property (nonatomic, strong) NSMutableArray *knowledge;

- (instancetype)initWithName:(NSString *)name;

@end
