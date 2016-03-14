//
//  Effect.m
//  
//
//  Created by Amy Joscelyn on 2/1/16.
//
//

#import "Effect.h"
#import "Choice.h"
#import "Prerequisite.h"

@implementation Effect

+ (Effect *)createEffectFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Effect *effect = [NSEntityDescription insertNewObjectForEntityForName:@"Effect" inManagedObjectContext:managedObjectContext];
    effect.storyID = csvRow[0];
    effect.comment = csvRow[1];
    // 2 is choices
    // 3 is questions       //is this a row in the csv?
    // 4 is prerequisites
    effect.actionObject = csvRow[5];
    effect.actionProperty = csvRow[6];
    effect.operator = csvRow[7];
    effect.stringValue = csvRow[8];
    
//    NSLog(@"Effect: %@", effect);
    return effect;
}

- (NSString *)description
{
    NSMutableString *description = [[NSMutableString alloc] initWithString:@"Effect - "];
    [description appendFormat:@"%@ - %@", self.storyID, self.comment];
    [description appendFormat:@"\n  %@.%@", self.actionObject, self.actionProperty];
    [description appendFormat:@" %@ %@", self.operator, self.stringValue];
    
    return description;
}

@end
