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

- (void)doThe:(Effect *)thing
{
    if (!self.dataStore)
    {
        self.dataStore = [AMYStoryDataStore sharedStoryDataStore];
        
        [self.dataStore fetchData];
    }
    //maybe someday this can become a general flow manager: if (id *)thing isType/Class Effect, go to an Effects manager.  If it's Prerequisite, go to a Prereqs manager.
    //Once I know whether it's Effect or Prerequisite, I need to determine whether it's on Playthrough or Character.  Each of those go to their own method managers.
    //It gets tricky at this point, because there are a lot more actionProperties than actionObjects to keep track of.  But it goes similarly--find the match, and do the thing to it.  (Or check against it).
    //Maybe I'll be able to parse down better with the comparator/operator--make that a sort of Group name, with the properties Grouped together based on type.  So it'll be a Type.  If it's a boolType (making/checking YES or NO), or a stringType (saving or checking to a string), or an integerType (adding or subtracting numbers, or checking equality), then that would narrow the properties down a lot, making the subsequent method called a lot more refined.
    
    
    //this handles all effects from selected choice or currentQuestion
    
    NSString *actionObject = thing.actionObject;
    
    if ([actionObject isEqualToString:@"story"])
    {
        [self managePlaythrough:thing];
    }
}

#pragma Handling Effects

- (void)managePlaythrough:(Effect *)effect
{
    if ([effect.operator isEqualToString:@"BOOL"])
    {
        [self boolEffectHandler:effect];
    }
    else if ([effect.operator isEqualToString:@"string"])
    {
        [self stringEffectHandler:effect];
    }
    else
    {
        [self integerEffectHandler:effect];
    }
}

- (void)boolEffectHandler:(Effect *)effect
{
    //If .operator == "BOOL" then the method goes to a boolEffectHandler, turns the .stringValue into either BOOL yes or no, and then set the property as equal to that
    
    NSString *actionProperty = effect.actionProperty;
    NSString *stringValue = effect.stringValue;
    BOOL boolValue;
    
    if ([stringValue isEqualToString:@"YES"])
    {
        boolValue = YES;
    }
    else
    {
        boolValue = NO;
    }
    
    NSLog(@"stringValue of effect: %@ - %d", actionProperty, boolValue);
    
    if ([actionProperty isEqualToString:@"fontChange"])
    {
        NSLog(@"bool value: %d", boolValue);
        self.dataStore.playthrough.fontChange = boolValue;
        NSLog(@"playthrough: fontChange = %d", self.dataStore.playthrough.fontChange);
    }
    else if ([actionProperty isEqualToString:@"creativityChosen"])
    {
        self.dataStore.playthrough.creativityChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"intelligenceChosen"])
    {
        self.dataStore.playthrough.intelligenceChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"obedienceChosen"])
    {
        self.dataStore.playthrough.obedienceChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"empathyChosen"])
    {
        self.dataStore.playthrough.empathyChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"instinctChosen"])
    {
        self.dataStore.playthrough.instinctChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"perseveranceChosen"])
    {
        self.dataStore.playthrough.perseveranceChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"kindnessChosen"])
    {
        self.dataStore.playthrough.kindnessChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"strengthChosen"])
    {
        self.dataStore.playthrough.strengthChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"graceChosen"])
    {
        self.dataStore.playthrough.graceChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"intellectChosen"])
    {
        self.dataStore.playthrough.intellectChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"imaginationChosen"])
    {
        self.dataStore.playthrough.imaginationChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"caringChosen"])
    {
        self.dataStore.playthrough.caringChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"wondermentChosen"])
    {
        self.dataStore.playthrough.wondermentChosen = boolValue;
    }
    else if ([actionProperty isEqualToString:@"curiosityChosen"])
    {
        self.dataStore.playthrough.curiosityChosen = boolValue;
    }
}

- (void)stringEffectHandler:(Effect *)effect
{
    //If .operator == "string" then the method goes to the above, where it sets the plain stringValue as the property
    NSString *actionProperty = effect.actionProperty;
    NSString *stringValue = effect.stringValue;
    NSLog(@"stringValue of effect: %@ - %@", actionProperty, stringValue);
    
//    if ([actionProperty isEqualToString:@"fontChange"])
//    {
//        self.dataStore.playthrough.fontChange = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"creativityChosen"])
//    {
//        self.dataStore.playthrough.creativityChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"intelligenceChosen"])
//    {
//        self.dataStore.playthrough.intelligenceChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"obedienceChosen"])
//    {
//        self.dataStore.playthrough.obedienceChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"empathyChosen"])
//    {
//        self.dataStore.playthrough.empathyChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"instinctChosen"])
//    {
//        self.dataStore.playthrough.instinctChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"perseveranceChosen"])
//    {
//        self.dataStore.playthrough.perseveranceChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"kindnessChosen"])
//    {
//        self.dataStore.playthrough.kindnessChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"strengthChosen"])
//    {
//        self.dataStore.playthrough.strengthChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"graceChosen"])
//    {
//        self.dataStore.playthrough.graceChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"intellectChosen"])
//    {
//        self.dataStore.playthrough.intellectChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"imaginationChosen"])
//    {
//        self.dataStore.playthrough.imaginationChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"caringChosen"])
//    {
//        self.dataStore.playthrough.caringChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"wondermentChosen"])
//    {
//        self.dataStore.playthrough.wondermentChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"curiosityChosen"])
//    {
//        self.dataStore.playthrough.curiosityChosen = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"answerQ3"])
//    {
//        self.dataStore.playthrough.answerQ3 = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"answerQ3A"])
//    {
//        self.dataStore.playthrough.answerQ3A = stringValue;
//    }
//    else if ([actionProperty isEqualToString:@"answerQ7"])
//    {
//        self.dataStore.playthrough.answerQ7 = stringValue;
//    }
    //    else if ([actionProperty isEqualToString:@""])
    //    {
    //
    //    }

}

- (void)integerEffectHandler:(Effect *)effect
{
    //If .operator == "integer" or "math" or something, then the method it gets sent to should be able to handle doing math on the integers, and resetting that property as the result
}

#pragma Checking Prerequisites

- (BOOL)checkPrerequisite:(Prerequisite *)prerequisite
{
    NSString *checkObject = prerequisite.checkObject;
    BOOL passesCheck;
    
    NSLog(@"checkObject = %@", checkObject);
    
    if ([checkObject isEqualToString:@"story"])
    {
        passesCheck = [self checkPlaythroughPrerequisite:prerequisite];
    }
    
    return passesCheck;
}

- (BOOL)checkPlaythroughPrerequisite:(Prerequisite *)prerequisite
{
    NSString *checkProperty = prerequisite.checkProperty;
    NSString *stringValue = prerequisite.stringValue;
    NSLog(@"CHECKING PREREQUISITE: %@ - %@", checkProperty, stringValue);
    
    BOOL passesCheck;
    
//    if ([stringValue isEqualToString:@"anything"])
//    {
//        //this means as long as it's not equal to @"" it'll be okay
//    }
    
    if ([checkProperty isEqualToString:@"answerQ3"])
    {
        if (self.dataStore.playthrough.answerQ3.length)
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"answerQ3A"])
    {
        if (self.dataStore.playthrough.answerQ3A.length)
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"answerQ7"])
    {
        if (self.dataStore.playthrough.answerQ7.length)
        {
            passesCheck = YES;
        }
    }
    return passesCheck;
}

@end
