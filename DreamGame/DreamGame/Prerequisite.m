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

+ (Prerequisite *)createPrerequisiteFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Prerequisite *prerequsite = [NSEntityDescription insertNewObjectForEntityForName:@"Prerequisite" inManagedObjectContext:managedObjectContext];
    prerequsite.storyID = csvRow[0];
    prerequsite.comment = csvRow[1];
    // 2 is choices
    // 3 is questions  //are there 8 csvRows?
    // 4 is effects
    prerequsite.checkObject = csvRow[5];
    prerequsite.checkProperty = csvRow[6];
    prerequsite.comparator = csvRow[7];
    prerequsite.stringValue = csvRow[8];

//    NSLog(@"Prerequisite: %@", prerequsite);
    return prerequsite;
}

- (NSString *)description
{
    NSMutableString *description = [[NSMutableString alloc] initWithString:@"Prerequisite - "];
    [description appendFormat:@"%@ - %@", self.storyID, self.comment];
    [description appendFormat:@"\n  %@.%@", self.checkObject, self.checkProperty];
    [description appendFormat:@" %@ %@", self.comparator, self.stringValue];

    return description;
}

@end
