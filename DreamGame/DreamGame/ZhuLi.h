//
//  ZhuLi.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/23/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMYStoryDataStore.h"

@interface ZhuLi : NSObject

- (void)doThe:(Effect *)thing;

- (BOOL)checkPrerequisite:(Prerequisite *)prerequisite;

@end
