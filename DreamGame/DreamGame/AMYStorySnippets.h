//
//  AMYStorySnippets.h
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMYChoice.h"

@interface AMYStorySnippets : NSObject

@property (nonatomic, strong) NSString *flavorText;
@property (nonatomic) NSUInteger snippetIndexNumber;

@property (nonatomic, strong) NSMutableArray *choices;

@property (nonatomic, strong) AMYChoice *choice1;
@property (nonatomic, strong) AMYChoice *choice2;
@property (nonatomic, strong) AMYChoice *choice3;
@property (nonatomic, strong) AMYChoice *choice4;
@property (nonatomic, strong) AMYChoice *choice5;
@property (nonatomic, strong) AMYChoice *choice6;

- initWithFlavorText:(NSString *)flavorText indexNumber:(NSUInteger)indexNumber;

- (id)initWithFlavorText:(NSString *)flavorText indexNumber:(NSUInteger)indexNumber choice1:(NSString *)choice1 choice2:(NSString *)choice2 choice3:(NSString *)choice3 choice4:(NSString *)choice4 choice5:(NSString *)choice5 choice6:(NSString *)choice6;

@end
