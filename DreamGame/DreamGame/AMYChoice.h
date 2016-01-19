//
//  AMYChoice.h
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYChoice : NSObject

@property (nonatomic) NSUInteger indexNumber;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithIndexNumber:(NSUInteger)indexNumber text:(NSString *)text;

@end
