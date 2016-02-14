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

@property (nonatomic, strong) NSMutableArray *mainStorypoints;
@property (nonatomic, strong) NSMutableArray *branchingOptions;
@property (nonatomic, strong) NSMutableArray *choices;
@property (nonatomic, strong) NSMutableArray *effects;
@property (nonatomic) BOOL endingTriggered;

@property (nonatomic, strong) AMYStoryDataStore *dataStore;
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) NSArray *sortedChoices;

@property (nonatomic) CGFloat textHue;

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.dataStore = [AMYStoryDataStore sharedStoryDataStore];
    
    [self.dataStore fetchData];
    
    self.currentQuestion = self.dataStore.currentQuestion;
    
    NSUInteger forestSeaGreen = 130;
    self.textHue = forestSeaGreen/359.0;
    
    self.tableView.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.88 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithHue:self.textHue saturation:0.1 brightness:0.9 alpha:1.0];
    
    //self.sortedChoices = [self.dataStore.currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
}

- (void)setCurrentQuestion:(Question *)currentQuestion
{
    _currentQuestion = currentQuestion;
    _sortedChoices = [currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
    
    _dataStore.currentQuestion = currentQuestion;
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
        self.currentQuestion = self.currentQuestion.questionAfter;
        //self.sortedChoices = [self.dataStore.currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
    }
    else if (self.dataStore.currentQuestion.choiceOuts.count > 0)
    {
        Choice *selectedChoice = self.sortedChoices[row];
        self.currentQuestion = selectedChoice.questionOut;
    } else {
        self.currentQuestion = self.dataStore.questions[0];
        // go to next chapter or restart
    }
    
    [self.tableView reloadData];
}

@end
