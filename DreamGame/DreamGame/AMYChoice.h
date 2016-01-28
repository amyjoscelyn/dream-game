//
//  AMYChoice.h
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYChoice : NSObject

@property (nonatomic, strong) NSString *choiceID;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSMutableDictionary *requirements;
@property (nonatomic, strong) NSMutableArray *effectIDs;
@property (nonatomic, strong) NSString *destinationID;
@property (nonatomic, strong) NSString *content;

- (instancetype)init;

- (instancetype)initWithChoiceID:(NSString *)choiceID comment:(NSString *)comment requirements:(NSString *)requirements requirementValues:(NSString *)requirementValues effectIDs:(NSString *)effectIDs destinationID:(NSString *)destinationID content:(NSString *)content;

@end
