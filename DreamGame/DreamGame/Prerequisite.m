//
//  Prerequisite.m
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import "Prerequisite.h"
#import "Choice.h"
#import "Effect.h"

@implementation Prerequisite

// Insert code here to add functionality to your managed object subclass

+ (Prerequisite *)createPrerequisiteFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    
    Prerequisite *prerequsite = [NSEntityDescription insertNewObjectForEntityForName:@"Prerequisite" inManagedObjectContext:managedObjectContext];
    prerequsite.storyID = csvRow[0];
    prerequsite.comment = csvRow[1];
    // 2 is choices
    // 3 is effects
    prerequsite.checkObject = csvRow[4];
    prerequsite.checkProperty = csvRow[5];
    prerequsite.comparator = csvRow[6];
    prerequsite.stringValue = csvRow[7];

    NSLog(@"Prerequisite: %@", prerequsite);
    return prerequsite;
}

- (NSString *)description {
    NSMutableString *description = [[NSMutableString alloc] initWithString:@"Prerequisite - "];
    [description appendFormat:@"%@ - %@", self.storyID, self.comment];
    [description appendFormat:@"\n  %@.%@", self.checkObject, self.checkProperty];
    [description appendFormat:@" %@ %@", self.comparator, self.stringValue];

    return description;
}

@end
