//
//  AMYMainTableViewController.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYMainTableViewController.h"
#import "AMYStoryDataStore.h"
#import "ZhuLi.h"

@interface AMYMainTableViewController ()

@property (nonatomic, strong) AMYStoryDataStore *dataStore;
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) NSArray *sortedChoices;

@property (nonatomic) CGFloat textHue;
@property (nonatomic) NSUInteger colorInteger;

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.dataStore = [AMYStoryDataStore sharedStoryDataStore];
    
    [self.dataStore fetchData];
    
    [self setCurrentQuestionOfStory:self.dataStore.playthrough.currentQuestion];
    
    NSUInteger deeperBlue = 220;
    self.colorInteger = deeperBlue;
    [self changeBackgroundColor:deeperBlue];
    
    //self.sortedChoices = [self.dataStore.currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
}

- (void)changeBackgroundColor:(NSUInteger)color
{
    if (color > 359.0)
    {
        color -= 359.0;
    }
    self.textHue = color/359.0;
    
    self.tableView.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.88 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.9 alpha:1.0];
}

- (void)setCurrentQuestionOfStory:(Question *)currentQuestion
{
    if (currentQuestion.prerequisites.count > 0)
    { //this takes care of prerequisites the currentQuestion might need before it's displayed on the table
        /*
         if there is a prerequisite for a question, the prerequisite needs to be checked
         if the check is true, the question becomes the currentQuestion
         if the check is false, the question cannot be displayed and another question becomes the currentQuestion
         */
//        NSLog(@"PREREQ: %@", currentQuestion.prerequisites);
    }
    
    _currentQuestion = currentQuestion;
    _sortedChoices = [currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
    
    _dataStore.playthrough.currentQuestion = currentQuestion;
    
    [_dataStore saveContext];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 1;
        }
        case 1:
        {
            NSInteger choiceOutsCount = self.currentQuestion.choiceOuts.count;
            if (choiceOutsCount > 0)
            {
                return choiceOutsCount;
            }
            else
            {
                return 1;
            }
        }
        default:
        {
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    cell.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.85 alpha:1.0];
    
    if (self.dataStore.playthrough.fontChange)
    {
        [cell.textLabel setFont:[UIFont fontWithName:@"Palatino" size:22.5]];
    }
    else
    {
        [cell.textLabel setFont:[UIFont systemFontOfSize:23.5]];
    }
    
    if (section == 0)
    {
        cell.textLabel.text = self.currentQuestion.content;
        cell.textLabel.textColor = [UIColor colorWithHue:self.textHue saturation:1.0 brightness:0.25 alpha:1.0];
        cell.textLabel.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.85 alpha:1.0];
        cell.textLabel.numberOfLines = 0;
        
        cell.detailTextLabel.hidden = YES;
        
        cell.userInteractionEnabled = NO;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 45;
    }
    else if (section == 1)
    {
        if (self.sortedChoices.count > 0)
        {
            /*
             If there is a prerequisite on a choice, it needs to checkPrerequisite to make sure it's good to be displayed
             if the check returns true, the choice remains.  otherwise the choice is skipped over in the loop
             */
            Choice *choice = self.sortedChoices[row];
            
            if (choice.prerequisites.count > 0)
            {
//                NSLog(@"CHOICE PREREQ: %@", choice.prerequisites);
                for (Prerequisite *prereq in choice.prerequisites)
                {
                    if ([prereq.checkObject isEqualToString:@"story"])
                    {
                        //go to a method that deals solely with "story" properties, aka Playthrough
                    }
                }
            }
            
            cell.textLabel.text = choice.content;
        }
        else if (self.currentQuestion.questionAfter)
        {//maybe this should be in section 3, and hide section 2?
            cell.textLabel.text = @"Continue";
        }
        else if ([self.currentQuestion.content isEqualToString:@"THE END."])
        {
            cell.textLabel.text = @"(tap to restart)";
        }
        else
        {
            cell.textLabel.text = @"You have reached a precarious end with no further content! (Hang here for a bit or tap to restart)";
        }
        cell.textLabel.textColor = [UIColor colorWithHue:self.textHue saturation:1.0 brightness:0.5 alpha:1.0];
        cell.textLabel.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.85 alpha:1.0];
        cell.textLabel.numberOfLines = 0;
        cell.detailTextLabel.hidden = YES;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = indexPath.section;
    NSUInteger indentation = 0;
    
    if (section)
    {
        indentation += 3;
    }
    return indentation;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) { return; }
    
    NSUInteger row = indexPath.row;
    ZhuLi *zhuLi = [ZhuLi new];
    
    if (self.currentQuestion.effects.count > 0)
    { //this takes care of effects the currentQuestion might incur
        for (Effect *effect in self.currentQuestion.effects)
        {
            [zhuLi doTheThing:effect];
        }
    }
    
    if (self.currentQuestion.questionAfter)
    {
        [self setCurrentQuestionOfStory:self.currentQuestion.questionAfter];
        //self.sortedChoices = [self.dataStore.currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
    }
    else if (self.dataStore.playthrough.currentQuestion.choiceOuts.count > 0)
    {
        Choice *selectedChoice = self.sortedChoices[row];
        
        if (selectedChoice.effects.count)
        {
            for (Effect *effect in selectedChoice.effects)
            {
                [zhuLi doTheThing:effect];
            }
        }
        [self setCurrentQuestionOfStory:selectedChoice.questionOut];
    }
    else
    {
        [self setCurrentQuestionOfStory:self.dataStore.questions[0]];
        
        // below resets the properties
        self.dataStore.playthrough.fontChange = NO;
        
        // go to next chapter or restart
    }
//    self.colorInteger += 3; //5 is a little jarring, 3 is good, but probably less will be better and more subtle without needing animation
//    [self changeBackgroundColor:self.colorInteger];
    
    [self.tableView reloadData];
}

/*
 I have the entities set up already for prerequisites and effects.
 Effects: write some into the content, attribute them to choices, then write code to read those effects--properties that will change when the effect is triggered
 Prerequisites: write some into the choices (if there are two choices that are superficially the same, but lead to different corresponding questions because of different prerequisites, the properties should filter through the prereqs and only display one of those similar choices to avoid confusion and apparent duplication), write code to have them read the properties.  Only display the ones that pass the check--the check is a BOOL, and if the BOOL is YES, display the choice.  If it is NO, ignore it.
 
 I still need to set up some entities, for the story, the world, and the character.
 Playthrough: this entity should hold the state of the entire story--the current question the app is closed on, as well as the latest saved state if the story's progress is manually saved.  It should also hold relationships with the World and the PlayerCharacter as well as Question.
 World: this should have attributes for all of the appropriate world details that are dynamic and can be changed by effects from the player's choices.
 PlayerCharacter: this should have attributes for the character that differs player to player, game to game: Name, PhysicalCharacteristics, Traits, Skills, and Inventory.  Some of those might be better suited as their own Entities than as mere attributes, but I can decide that when I get there.
 */

@end
