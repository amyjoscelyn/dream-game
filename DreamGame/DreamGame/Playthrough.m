//
//  Playthrough.m
//  DreamGame
//
//  Created by Amy Joscelyn on 2/18/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Playthrough.h"
#import "Question.h"

@implementation Playthrough

+ (Playthrough *)createNewPlaythroughWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Playthrough *playthrough = [NSEntityDescription insertNewObjectForEntityForName:@"Playthrough" inManagedObjectContext:managedObjectContext];
    
//    NSLog(@"we're creating a new playthrough!");
    
    return playthrough;
}

@end
