//
//  AMYMainTableViewController.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <CHCSVParser/CHCSVParser.h>
#import "AMYMainTableViewController.h"
#import "AMYStorySnippets.h"
#import "AMYChoice.h"

@interface AMYMainTableViewController ()

@property (nonatomic, strong) NSMutableArray *questions;
@property (nonatomic, strong) NSMutableArray *choices;
@property (nonatomic, strong) NSMutableArray *effects;
@property (nonatomic, strong) NSMutableArray *convergentStory;
@property (nonatomic, strong) NSMutableArray *branchingOptions;
@property (nonatomic) BOOL endingTriggered;

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //this parses through the given csv
    NSString *csvPath = [[NSBundle mainBundle] pathForResource:@"qceModel" ofType:@"csv"];
    NSURL *csvURL = [NSURL fileURLWithPath:csvPath];
    NSMutableArray *csvRows = [[NSArray arrayWithContentsOfCSVURL:csvURL options:CHCSVParserOptionsSanitizesFields] mutableCopy];
    
    self.questions = [[NSMutableArray alloc] init];
    self.choices = [[NSMutableArray alloc] init];
    self.effects = [[NSMutableArray alloc] init];
    self.convergentStory = [[NSMutableArray alloc] init];
    self.branchingOptions = [[NSMutableArray alloc] init];
    
    /*
     okay.  So we've got a huge list of these rows, all with different types.  What I want to do is separate them by type.
     For that, I can take a look at their ID, and if it begins with a q, it should go into a questions array; c for choice; and e into effect.
     I have properties for each of those already, but those are to contain snippets, I guess... well, actually, I only need snippets to go into the questions/branching options arrays, because they're the only ones that deal firsthand with those arrays.  The choices and effects property arrays are unused so far, and in fact, every time we handle choices and effects, it's within context of those other two property arrays, so they are fair game!
     This being the case, I can iterate through the parsed csv info right here, right now, and move the choices into the choices array, and effects into effects.  This way, later on, when I am iterating through all of the choices/effects to find a single ID, I don't have to go through every single line of the raw csv to do it.
     */
    
    [csvRows removeObjectAtIndex:0];
    
    for (NSArray *csvRow in csvRows)
    {
        NSString *identification = csvRow[0];
        
        if ([identification containsString:@"q"])
        {
            [self.questions addObject:csvRow];
        }
        else if ([identification containsString:@"c"])
        {
            [self.choices addObject:csvRow];
//            [csvRows removeObject:csvRow];
        }
        else if ([identification containsString:@"e"])
        {
            [self.effects addObject:csvRow];
        }
    }
    
    for (NSUInteger i = 0; i < self.questions.count; i++)
    {
        NSArray *row = self.questions[i];
        
        NSString *identification = row[0];
        NSString *comment = row[1];
        //        NSString *requirement = row[2];
        //        NSString *requirementValue = row[3];
        NSMutableArray *effectIDsAsStrings = [[row[4] componentsSeparatedByString:@","] mutableCopy];
        NSMutableArray *choiceIDsAsStrings = [[row[5] componentsSeparatedByString:@","] mutableCopy];
        NSString *destinationID = row[6];
        NSString *content = row[7];
        
        NSMutableArray *choices = [[NSMutableArray alloc] init];
        
        if (choiceIDsAsStrings.count)
        {
            for (NSString *choiceID in choiceIDsAsStrings)
            {
                for (NSArray *choice in self.choices)
                {
                    NSString *identification = choice[0];
                    if ([choiceID isEqualToString:identification])
                    {
                        [choices addObject:choice];
                    }
                }
            } //and then do this exact same thing for effects.
        }
        
        AMYStorySnippets *snippet = [[AMYStorySnippets alloc] initWithQuestionID:identification comment:comment effects:effectIDsAsStrings choices:choices destination:destinationID content:content];
        
        if ([comment containsString:@" - "])
        {
            [self.branchingOptions addObject:snippet];
        }
        else
        {
            [self.convergentStory addObject:snippet];
        }
    }
    NSLog(@"there are %lu converging storypoints and %lu branching options \n there are %lu questions, %lu choices, and %lu effects", self.convergentStory.count, self.branchingOptions.count, self.questions.count, self.choices.count, self.effects.count);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfSections = 1;
    if (!section == 0)
    {
        AMYStorySnippets *question = [self.questions firstObject];
        NSUInteger numberOfChoices = question.choices.count;
        
        if (!numberOfChoices)
        {
            if (![question.content isEqualToString:@"You've reached the end."])
            {
                question.choices = [[NSMutableArray alloc] init];
                
                question.choice1 = [[AMYChoice alloc] init];
                [question.choices addObject:question.choice1];
                
                numberOfChoices++;
                
            } //this could be its own method
        }
        numberOfSections = numberOfChoices;
    }
    return numberOfSections;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    //    NSUInteger lightGreen = 75;
    //    NSUInteger green = 135;
    //        NSUInteger blue = 250;
    //    NSUInteger purple = 300;
    NSUInteger red = 359;
    
    //    CGFloat textHue = lightGreen/359.0;
    //    CGFloat textHue = green/359.0;
    //        CGFloat textHue = blue/359.0;
    //    CGFloat textHue = purple/359.0;
    CGFloat textHue = red/359.0;
    
    if (section == 0)
    {
        AMYStorySnippets *snippet = self.questions[(NSUInteger)section];
        cell.textLabel.text = snippet.content;
        cell.textLabel.textColor = [UIColor colorWithHue:textHue saturation:1.0 brightness:0.25 alpha:1.0];
        cell.detailTextLabel.hidden = YES;
        cell.textLabel.numberOfLines = 0;
        cell.userInteractionEnabled = NO;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 45;
    }
    else if (section == 1)
    {
        AMYStorySnippets *snippet = [self.questions firstObject];
        AMYChoice *choice = snippet.choices[(NSUInteger)row];
        cell.textLabel.textColor = [UIColor colorWithHue:textHue saturation:1.0 brightness:0.5 alpha:1.0];
        cell.textLabel.text = choice.content;
        cell.textLabel.numberOfLines = 0;
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", choice.choiceID];
        cell.detailTextLabel.hidden = YES;
        
        //if price and tally are blank, they should not cause extra cells to appear
    }
    return cell;
}

/* //this handles section headers
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
 {
 AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
 NSString *name = snippet.flavorText;
 
 return name;
 }
 */

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
    
    AMYStorySnippets *snippet = self.questions[0];
    AMYChoice *selectedChoice = snippet.choices[row];
    
    for (AMYStorySnippets *snippet in self.branchingOptions)
    {
        if (snippet.questionID == selectedChoice.destinationID)
        {
            [self.questions insertObject:snippet atIndex:1];
        }
    }
    
    [self.questions removeObjectAtIndex:0];
    if (!self.questions.count && self.endingTriggered == NO)
    {
        AMYStorySnippets *conclusion = [[AMYStorySnippets alloc] init];
        conclusion.content = @"You've reached the end.";
        [self.questions addObject:conclusion];
        
        self.endingTriggered = YES;
    }
    
    [self.tableView reloadData];
    //    [self.tableView setContentOffset:CGPointZero animated:YES];
    //This ignores the nav bar and goes right to the very top of the screen
}


/*
 some things to do:
 figure out a way to store the story snippets somewhere other than here--set up in another class
 when choice is chosen, provide the correct next snippet
 embed in a tab bar and start the character page, where the inventory will live, basic information (name, current location, a little about the place as you've learned, a little about yourself that you've learned), relationships (potentially)
 set up story method... something to pass to the tableViewController every time, I guess.  to start i can probably just have one for like the six snippets i've got, do a generic storySetup method like i have colorSetup and gameSetup methods in colorMatch.
 make a branch of current master, called original-work or something, and then delete the AMYItems and Character and stuff for now.  I can always import them in later.
 make choices take a double tap--the selected one should be highlighted, so people know what they've chosen so it's never an accident.  this is important because there are no take backs.
 It would be nice to have a 'replay' button at the end of these little games, instead of restarting the sim each time
 
 
 some generic stories I can provide with the template:
 if I have several snippets in a row sans choice, then they should all form at the same time--but not too many that the person needs to scroll.  I'll have to think about this.  When putting it in my outside file, I might need to include a couple snippets in one line, but split them with a different symbol... i don't know.
 sometimes when you scroll down to see all of the choices and move on to the next page, the table is still scrolled down.  i'm sure there's a way to force it back to the top each time.
 each choice can be unwrapped to include a price total and item total.  this can become part of the "choice" property, and after each is chosen they can be added to a running total which can be shown at the end (or, throughout on the nav bar header).
 i should go through and rename my objects, because some are confusing.  rawSnippet should become unwrappedStoryFragment or something, or i should come up with another term than 'snippet' that makes more sense and is clearer from the get go.
 */

/*
 I can use the nav bar's title space to show the location a person is in, the name of the person they're conversing with, and other important information like that (when you're in a shop, or the Exchange, it can tell you how much money you have... or when you're excavating your salvage lot, it can show you how much time has passed or is passing or how much energy you have left, or how much stuff there's detected to be... things like that).
 */

@end
