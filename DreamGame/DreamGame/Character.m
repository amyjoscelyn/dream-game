//
//  Character.m
//  DreamGame
//
//  Created by Amy Joscelyn on 2/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Character.h"
#import "Playthrough.h"

@implementation Character

+ (Character *)createNewCharacterWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:managedObjectContext];
    
//    NSLog(@"we've created a new character!");
    
    return character;
}

@end
