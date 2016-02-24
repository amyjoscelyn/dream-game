//
//  Playthrough+CoreDataProperties.h
//  DreamGame
//
//  Created by Amy Joscelyn on 2/24/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Playthrough.h"

NS_ASSUME_NONNULL_BEGIN

@interface Playthrough (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *answerQ1;
@property (nullable, nonatomic, retain) NSString *answerQ2;
@property (nullable, nonatomic, retain) NSString *answerQ3;
@property (nullable, nonatomic, retain) NSString *answerQ3A;
@property (nullable, nonatomic, retain) NSString *answerQ3B;
@property (nullable, nonatomic, retain) NSString *answerQ7;
@property (nullable, nonatomic, retain) NSString *answerQ7A;
@property (nonatomic) BOOL caringChosen;
@property (nonatomic) BOOL creativityChosen;
@property (nonatomic) BOOL curiosityChosen;
@property (nonatomic) BOOL empathyChosen;
@property (nonatomic) BOOL fontChange;
@property (nonatomic) BOOL graceChosen;
@property (nonatomic) BOOL imaginationChosen;
@property (nonatomic) BOOL instinctChosen;
@property (nonatomic) BOOL intellectChosen;
@property (nonatomic) BOOL intelligenceChosen;
@property (nonatomic) BOOL kindnessChosen;
@property (nonatomic) BOOL obedienceChosen;
@property (nonatomic) BOOL perseveranceChosen;
@property (nonatomic) BOOL strengthChosen;
@property (nonatomic) BOOL wondermentChosen;
@property (nullable, nonatomic, retain) NSString *answerQ4;
@property (nullable, nonatomic, retain) NSString *answerQ5;
@property (nullable, nonatomic, retain) NSString *answerQ6;
@property (nullable, nonatomic, retain) NSString *answerQ8;
@property (nullable, nonatomic, retain) NSString *answerQ9;
@property (nullable, nonatomic, retain) NSString *answerQ10;
@property (nullable, nonatomic, retain) NSString *answerQ11;
@property (nullable, nonatomic, retain) Question *currentQuestion;
@property (nullable, nonatomic, retain) Character *playerCharacter;

@end

NS_ASSUME_NONNULL_END
