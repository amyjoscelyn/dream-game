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

@property (nonatomic, strong) NSString *questionID;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *destinationID;
@property (nonatomic, strong) NSMutableArray *effects;
@property (nonatomic, strong) NSMutableArray *choices;

@property (nonatomic, strong) AMYChoice *choice1;
@property (nonatomic, strong) AMYChoice *choice2;
@property (nonatomic, strong) AMYChoice *choice3;
@property (nonatomic, strong) AMYChoice *choice4;
@property (nonatomic, strong) AMYChoice *choice5;
@property (nonatomic, strong) AMYChoice *choice6;



//- initWithFlavorText:(NSString *)flavorText indexNumber:(NSUInteger)indexNumber; //do I still need this?  I think the answer is yes, for my programmatically inserted ones, but I can probably do without and just use the other one

- (instancetype)initWithQuestionID:(NSString *)questionID comment:(NSString *)comment effects:(NSArray *)effectIDs choices:(NSArray *)choiceIDs destination:(NSString *)destinationID content:(NSString *)content;
                                                                                               
@end
