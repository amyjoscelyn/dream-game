//
//  AMYMainTableViewController.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYMainTableViewController.h"
#import "AMYStorySnippets.h"

@interface AMYMainTableViewController ()

@property (nonatomic, strong) NSMutableArray *snippets;

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AMYStorySnippets *introduction = [[AMYStorySnippets alloc] init];
    AMYStorySnippets *middle = [[AMYStorySnippets alloc] init];
    AMYStorySnippets *end = [[AMYStorySnippets alloc] init];
    
    introduction.flavorText = @"This is the introduction to the story.";
    middle.flavorText = @"This is the middle of the story!";
    end.flavorText = @"And this is the end.";
    
    introduction.choice1 = @"Choice 1";
    introduction.choice2 = @"Choice 2";
    introduction.choice3 = @"Choice 3";
    introduction.choice4 = @"Choice 4";
    introduction.choice5 = @"Choice 5";
    introduction.choices = @[ introduction.choice1, introduction.choice2, introduction.choice3, introduction.choice4, introduction.choice5 ];
    
    middle.choice1 = @"One";
    middle.choice2 = @"Two";
    middle.choice3 = @"Three";
    middle.choices = @[ middle.choice1, middle.choice2, middle.choice3 ];
    
    end.choice1 = @"A";
    end.choice2 = @"B";
    end.choice3 = @"C";
    end.choice4 = @"D";
    end.choice5 = @"E";
    end.choice6 = @"F";
    end.choices = @[ end.choice1, end.choice2, end.choice3, end.choice4, end.choice5, end.choice6 ];
    
    self.snippets = [@[ introduction, middle, end ] mutableCopy];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //    NSUInteger numberOfStudents = self.students.count;
    //    return (NSInteger)numberOfStudents;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
    NSUInteger numberOfChoices = snippet.choices.count;
    
    return (NSInteger)numberOfChoices;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
    NSString *choice = snippet.choices[(NSUInteger)row];
    
    cell.textLabel.text = choice;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", row]; //this part is unnecessary
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
    NSString *name = snippet.flavorText;
    
    return name;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.snippets removeObjectAtIndex:0];
    if (!self.snippets.count)
    {
        AMYStorySnippets *conclusion = [[AMYStorySnippets alloc] init];
        conclusion.flavorText = @"You've reached the end.";
        [self.snippets addObject:conclusion];
    }
    [self.tableView reloadData];
}

@end
