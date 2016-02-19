//
//  AMYMainTableViewController.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYMainTableViewController.h"
#import "AMYStoryDataStore.h"

@interface AMYMainTableViewController ()

//do I need the first two?  Do i need any of these in this first section?
@property (nonatomic, strong) NSMutableArray *mainStorypoints;
@property (nonatomic, strong) NSMutableArray *branchingOptions;
@property (nonatomic, strong) NSMutableArray *choices;
@property (nonatomic, strong) NSMutableArray *effects;
@property (nonatomic) BOOL endingTriggered; //do I need this?

@property (nonatomic, strong) AMYStoryDataStore *dataStore;
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) NSArray *sortedChoices;

@property (strong, nonatomic) NSMutableArray *questionHistory;

@property (nonatomic) CGFloat textHue;

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 45;
    
    self.dataStore = [AMYStoryDataStore sharedStoryDataStore];
    
    [self.dataStore fetchData];
    
    [self setCurrentQuestionOfStory:self.dataStore.playthrough.currentQuestion];
    NSLog(@"First question we see: %@", self.currentQuestion.storyID);
    
    NSUInteger forestSeaGreen = 130;
    self.textHue = forestSeaGreen/359.0;
    
    self.tableView.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.88 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.9 alpha:1.0];
    
    self.questionHistory = [[NSMutableArray alloc] init];
    
    //self.sortedChoices = [self.dataStore.currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
}

- (void)setCurrentQuestionOfStory:(Question *)currentQuestion
{
    _currentQuestion = currentQuestion;
    _sortedChoices = [currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
    
    _dataStore.playthrough.currentQuestion = currentQuestion;
    NSLog(@"current question: %@", self.currentQuestion.storyID);
    
    [_dataStore saveContext];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //section 1: past choices
    //section 2: current question
    //section 3: choices
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
//    CGRect screenBounds = [[UIScreen mainScreen] bounds];
//    CGSize screenSize = screenBounds.size;
//    UILabel *calcLabel = [[UILabel alloc] init];
//    calcLabel.numberOfLines = 0;
//    NSInteger section = indexPath.section;
//
//    if (section == 0) {
//        Question *question = self.questionHistory[indexPath.row];
//        calcLabel.text = question.content;
//    } else if (section == 1) {
//        calcLabel.text = self.currentQuestion.content;
//    } else if (section == 2) {
//        if (self.sortedChoices.count)
//        {
//            Choice *choice = self.sortedChoices[indexPath.row];
//            calcLabel.text = choice.content;
//        }
//        else{
//            return 45;
//        }
//    }
//    
//    CGSize size = [calcLabel sizeThatFits:CGSizeMake(screenSize.width, FLT_MAX)];
//    
//    return UITableViewAutomaticDimension;
//    return size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            //if there's no story history for this playthrough, this section should be hidden//return 0
            return self.questionHistory.count;
        }
        case 1:
        {
            return 1;
        }
        case 2:
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
    
    if (section == 0)
    {
        NSString *pastQuestion = self.questionHistory[row];
        cell.textLabel.text = pastQuestion;
    }
    else if (section == 1)
    {
        cell.textLabel.text = self.currentQuestion.content;
        cell.textLabel.textColor = [UIColor colorWithHue:self.textHue saturation:1.0 brightness:0.25 alpha:1.0];
        cell.textLabel.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.85 alpha:1.0];
        cell.textLabel.numberOfLines = 0;
        
        cell.detailTextLabel.hidden = YES;
        
        cell.userInteractionEnabled = NO;
    }
    else if (section == 2)
    {
//        NSLog(@"there are %lu choices for this question", self.currentQuestion.choiceOuts.count);
//        NSLog(@"~~~~~~~~~sorted choices: %@", self.sortedChoices);
        
        if (self.sortedChoices.count > 0)
        {
            Choice *choice = self.sortedChoices[row];
//            NSLog(@"choice: %@", choice);
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
    
    if (self.currentQuestion.questionAfter)
    {
        [self.questionHistory addObject:self.currentQuestion.content];
        
        [self setCurrentQuestionOfStory:self.currentQuestion.questionAfter];
        //self.sortedChoices = [self.dataStore.currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
    }
    else if (self.dataStore.playthrough.currentQuestion.choiceOuts.count > 0)
    {
        [self.questionHistory addObject:self.currentQuestion.content];
        
        Choice *selectedChoice = self.sortedChoices[row];
        [self setCurrentQuestionOfStory:selectedChoice.questionOut];
    }
    else
    {
        [self.questionHistory addObject:self.currentQuestion.content];
        
        [self setCurrentQuestionOfStory:self.dataStore.questions[0]];
        // go to next chapter or restart
    }
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
