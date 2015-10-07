//
//  AppDelegate.m
//  DreamGame
//
//  Created by Amy Joscelyn on 10/7/15.
//  Copyright (c) 2015 Amy Joscelyn. All rights reserved.
//

#import "AppDelegate.h"
#import "AMYCharacter.h"
#import "AMYInteractiveItems.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    AMYCharacter *amy = [[AMYCharacter alloc] initWithName:@"Amy"];
    NSLog(@"Hey. My name is %@.", amy.name);
    
    AMYInteractiveItems *food = [[AMYInteractiveItems alloc] initWithName:@"yummy food" edible:YES wearable:NO inherentValue:1];
    [amy takeItem:food];
    [amy eatFood:food];
    
    
    return YES;
}

@end
