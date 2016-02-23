//
//  ZhuLi.m
//  DreamGame
//
//  Created by Amy Joscelyn on 2/23/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "ZhuLi.h"

@interface ZhuLi ()

@property (nonatomic, strong) AMYStoryDataStore *dataStore;

@end

@implementation ZhuLi

+ (void)doTheThing:(Effect *)effect
{
    //maybe someday this can become a general flow manager: if (id *)thing isType/Class Effect, go to an Effects manager.  If it's Prerequisite, go to a Prereqs manager.
    //Once I know whether it's Effect or Prerequisite, I need to determine whether it's on Playthrough or Character.  Each of those go to their own method managers.
    //It gets tricky at this point, because there are a lot more actionProperties than actionObjects to keep track of.  But it goes similarly--find the match, and do the thing to it.  (Or check against it).
    //Maybe I'll be able to parse down better with the comparator/operator--make that a sort of Group name, with the properties Grouped together based on type.  So it'll be a Type.  If it's a boolType (making/checking YES or NO), or a stringType (saving or checking to a string), or an integerType (adding or subtracting numbers, or checking equality), then that would narrow the properties down a lot, making the subsequent method called a lot more refined.
    
    
    //this handles all effects from selected choice or currentQuestion
    
    NSString *actionObject = effect.actionObject;
    
    if ([actionObject isEqualToString:@"story"])
    {
        [ZhuLi managePlaythrough:effect];
    }
}

+ (BOOL)checkPrerequisite:(Prerequisite *)prerequisite
{
    
    return YES;
}

+ (void)managePlaythrough:(Effect *)effect
{
    NSString *actionProperty = effect.actionProperty;
    NSString *stringValue = effect.stringValue;
    
    if ([actionProperty isEqualToString:@"fontChange"])
    {
        //I know the property now, so I can set the property to the stringValue.  The only problem is I'm in a class method, meaning I can't access my dataStore, and since I can't instantiate a new dataStore, and I can't call an instance method which CAN access the dataStore, I have to find some other workaround.
    }
}

+ (void)changeProperty:(NSString *)property

@end
