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

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.dataStore = [AMYStoryDataStore sharedStoryDataStore];
    
    [self.dataStore fetchData];
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
            NSInteger choiceOutsCount = self.dataStore.currentQuestion.choiceOuts.count;
            if (choiceOutsCount > 0)
            {
                return choiceOutsCount;
            } else
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
    
    NSUInteger purple = 300;
    CGFloat textHue = purple/359.0;
    
    Question *question = self.dataStore.currentQuestion;
    
    if (section == 0)
    {
        cell.textLabel.text = question.content;
        cell.textLabel.textColor = [UIColor colorWithHue:textHue saturation:1.0 brightness:0.25 alpha:1.0];
        cell.detailTextLabel.hidden = YES;
        cell.textLabel.numberOfLines = 0;
        cell.userInteractionEnabled = NO;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 45;
    }
    else if (section == 1)
    {
        NSLog(@"there are %lu choices for this question", question.choiceOuts.count);
        NSArray *sortedChoices = [NSArray new];
        
        if (question.choiceOuts.count > 0)
        {
            sortedChoices = [question.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
            NSLog(@"~~~~~~~~~sorted choices: %@", sortedChoices);
            Choice *choice = sortedChoices[row];
            NSLog(@"choice: %@", choice);
            cell.textLabel.text = choice.content;
        }
        else
        {//maybe this should be in section 3, and hide section 2?
            cell.textLabel.text = @"Continue";
        }
        cell.textLabel.textColor = [UIColor colorWithHue:textHue saturation:1.0 brightness:0.5 alpha:1.0];
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
    NSUInteger row = indexPath.row;
    
    
    
    [self.tableView reloadData];
    
}

@end
