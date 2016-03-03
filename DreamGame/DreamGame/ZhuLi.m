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
    
    if ([thing.entity.name isEqualToString:@"Choice"]) {
        NSLog(@"IT IS A CHOICE!");
    }
    
    NSString *actionObject = thing.actionObject;
    
    if ([actionObject isEqualToString:@"story"])
    {
        [self managePlaythrough:thing];
    }
    else if ([actionObject isEqualToString:@"character"])
    {
        [self manageCharacter:thing];
    }
    else
    {
        NSLog(@"***Action %@ does not have object attributed to it.", thing.storyID);
    }
}

#pragma Playthrough Handling Effects

- (void)managePlaythrough:(Effect *)effect
{
    if ([effect.operator isEqualToString:@"BOOL"])
    {
        [self boolEffectPlaythroughHandler:effect];
    }
    else if ([effect.operator isEqualToString:@"string"])
    {
        [self stringEffectPlaythroughHandler:effect];
    }
    else
    {
        [self integerEffectPlaythroughHandler:effect];
    }
}

- (void)boolEffectPlaythroughHandler:(Effect *)effect
{
    //If .operator == "BOOL" then the method goes to a boolEffectHandler, turns the .stringValue into either BOOL yes or no, and then set the property as equal to that
    
    NSString *actionProperty = effect.actionProperty;
    BOOL boolValue = effect.stringValue.boolValue;
        
    if ([actionProperty isEqualToString:@"fontChange"])
    {
        self.dataStore.playthrough.fontChange = boolValue;
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

- (void)stringEffectPlaythroughHandler:(Effect *)effect
{
    NSString *actionProperty = effect.actionProperty;
    NSString *stringValue = effect.stringValue;
}

- (void)integerEffectPlaythroughHandler:(Effect *)effect
{    
    NSString *actionProperty = effect.actionProperty;
    NSInteger integerValue = effect.stringValue.integerValue;
}

#pragma Character Handling Manager

- (void)manageCharacter:(Effect *)effect
{
    if ([effect.operator isEqualToString:@"BOOL"])
    {
        [self boolEffectCharacterHandler:effect];
    }
    else if ([effect.operator isEqualToString:@"string"])
    {
        [self stringEffectCharacterHandler:effect];
    }
    else if ([effect.operator isEqualToString:@"integer"])
    {
        [self integerEffectCharacterHandler:effect];
    }
    else
    {
        NSLog(@"***ERROR: THERE IS NO OPERATOR TO CHANGE EFFECT %@ WITH.", effect.storyID);
    }
}

- (void)boolEffectCharacterHandler:(Effect *)effect
{
    NSString *actionProperty = effect.actionProperty;
    BOOL boolValue = effect.stringValue.boolValue;
}

- (void)stringEffectCharacterHandler:(Effect *)effect
{
    NSString *actionProperty = effect.actionProperty;
    NSString *stringValue = effect.stringValue;
}

- (void)integerEffectCharacterHandler:(Effect *)effect
{
    NSString *actionProperty = effect.actionProperty;
    NSInteger integerValue = effect.stringValue.integerValue;
    
    if ([actionProperty isEqualToString:@"charm"])
    {
        self.dataStore.playerCharacter.charm += integerValue;
    }
    else if ([actionProperty isEqualToString:@"practical"])
    {
        self.dataStore.playerCharacter.practical += integerValue;
    }
    else if ([actionProperty isEqualToString:@"history"])
    {
        self.dataStore.playerCharacter.history += integerValue;
    }
    else if ([actionProperty isEqualToString:@"potions"])
    {
        self.dataStore.playerCharacter.potions += integerValue;
    }
    else if ([actionProperty isEqualToString:@"healing"])
    {
        self.dataStore.playerCharacter.healing += integerValue;
    }
    else if ([actionProperty isEqualToString:@"divining"])
    {
        self.dataStore.playerCharacter.divining += integerValue;
    }
    else if ([actionProperty isEqualToString:@"animalia"])
    {
        self.dataStore.playerCharacter.animalia += integerValue;
    }
    else
    {
        NSLog(@"***ERROR: ACTION PROPERTY %@ DOES NOT MATCH ATTRIBUTE", actionProperty);
    }
}

#pragma Checking Prerequisites

- (BOOL)checkPrerequisite:(Prerequisite *)prerequisite
{
    NSString *checkObject = prerequisite.checkObject;
    BOOL passesCheck;
    
//    NSLog(@"checkObject = %@", checkObject);
    
    if ([checkObject isEqualToString:@"story"])
    {
        passesCheck = [self checkPlaythroughPrerequisite:prerequisite];
    }
    
    return passesCheck;
}

- (BOOL)checkPlaythroughPrerequisite:(Prerequisite *)prerequisite
{
    NSString *comparator = prerequisite.comparator;
//    NSLog(@"CHECKING PREREQUISITE: %@ - %@", checkProperty, stringValue);
    
    BOOL passesCheck;
    
    if ([comparator isEqualToString:@"BOOL"])
    {
        [self checkPlaythroughBOOLPrerequisite:prerequisite];
    }
    else if ([comparator isEqualToString:@"string"])
    {
        [self checkPlaythroughStringPrerequisite:prerequisite];
    }
    else if ([comparator isEqualToString:@"integer"])
    {
        [self checkPlaythroughIntegerPrerequisite:prerequisite];
    }
    else
    {
        NSLog(@"***ERROR: THERE IS NO COMPARATOR TO CHECK PREREQUISITE %@ WITH.", prerequisite.storyID);
    }
    
    
    return passesCheck;
}

- (BOOL)checkPlaythroughBOOLPrerequisite:(Prerequisite *)prerequisite
{
    NSString *checkProperty = prerequisite.checkProperty;
    BOOL boolValue = prerequisite.stringValue.boolValue;
    
    return NO;
}

- (BOOL)checkPlaythroughStringPrerequisite:(Prerequisite *)prerequisite
{
    NSString *checkProperty = prerequisite.checkProperty;
    NSString *stringValue = prerequisite.stringValue;
    
    return NO;
}

- (BOOL)checkPlaythroughIntegerPrerequisite:(Prerequisite *)prerequisite
{
    NSString *checkProperty = prerequisite.checkProperty;
    NSInteger integerValue = prerequisite.stringValue.integerValue;
    
    return NO;
}

@end
