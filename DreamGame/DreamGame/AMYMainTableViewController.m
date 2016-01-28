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

@property (nonatomic, strong) NSMutableArray *snippets;
@property (nonatomic, strong) NSMutableArray *branchingOptions;
//@property (nonatomic) NSUInteger totalCost;
//@property (nonatomic) NSUInteger itemTally;
@property (nonatomic) BOOL endingTriggered;

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //this parses through the given csv
    NSString *csvPath = [[NSBundle mainBundle] pathForResource:@"question-Questions" ofType:@"csv"];
    NSURL *csvURL = [NSURL fileURLWithPath:csvPath];
    NSMutableArray *csvRows = [[NSArray arrayWithContentsOfCSVURL:csvURL options:CHCSVParserOptionsSanitizesFields] mutableCopy];
    
    //    self.totalCost = 0;
    //    self.itemTally = 0;
    self.snippets = [[NSMutableArray alloc] init];
    self.branchingOptions = [[NSMutableArray alloc] init];
    
    [csvRows removeObjectAtIndex:0];
    
    for (NSUInteger i = 0; i < csvRows.count; i++)
    {
        NSArray *rawSnippet = csvRows[i];
        NSInteger indexNumber = [rawSnippet[0] integerValue];
        NSMutableArray *choices = [[NSMutableArray alloc] init];
        
        for (NSUInteger i = 2; i < 8; i++)
        {
            NSArray *snippetByComponents = [rawSnippet[i] componentsSeparatedByString:@" | "];
            
            [choices addObject:snippetByComponents];
        }
        AMYStorySnippets *snippet = [[AMYStorySnippets alloc] initWithFlavorText:rawSnippet[8] indexNumber:indexNumber choices:choices];
        
        NSString *comment = rawSnippet[1];
        
        if ([comment containsString:@" - "])
        {
            [self.branchingOptions addObject:snippet];
        }
        else
        {
            [self.snippets addObject:snippet];
        }
    }
        NSLog(@"there are %lu snippets \n there are %lu branching options", self.snippets.count, self.branchingOptions.count);
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
        AMYStorySnippets *snippet = [self.snippets firstObject];
        NSUInteger numberOfChoices = snippet.choices.count;
        
        if (!numberOfChoices)
        {
            if (![snippet.flavorText isEqualToString:@"You've reached the end."])
            {
                snippet.choices = [[NSMutableArray alloc] init];
                //                snippet.choice1 = [[AMYChoice alloc] initWithIndexNumber:0 text:@"Continue" price:@"" numberOfItem:@""];
                snippet.choice1 = [[AMYChoice alloc] initWithIndexNumber:0 text:@"Continue" followingSnippet:@""];
                [snippet.choices addObject:snippet.choice1];
                
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
        NSUInteger blue = 250;
    //    NSUInteger purple = 300;
    //    NSUInteger red = 359;
    
    //    CGFloat textHue = lightGreen/359.0;
//    CGFloat textHue = green/359.0;
        CGFloat textHue = blue/359.0;
    //    CGFloat textHue = purple/359.0;
    //    CGFloat textHue = red/359.0;
    
    if (section == 0)
    {
        AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
        cell.textLabel.text = snippet.flavorText;
        cell.textLabel.textColor = [UIColor colorWithHue:textHue saturation:1.0 brightness:0.25 alpha:1.0];
        cell.detailTextLabel.hidden = YES;
        cell.textLabel.numberOfLines = 0;
        cell.userInteractionEnabled = NO;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 45;
    }
    else if (section == 1)
    {
        AMYStorySnippets *snippet = [self.snippets firstObject];
        AMYChoice *choice = snippet.choices[(NSUInteger)row];
        cell.textLabel.textColor = [UIColor colorWithHue:textHue saturation:1.0 brightness:0.5 alpha:1.0];
        cell.textLabel.text = choice.text;
        cell.textLabel.numberOfLines = 0;
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", choice.indexNumber];
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
    
    AMYStorySnippets *snippet = self.snippets[0];
    AMYChoice *selectedChoice = snippet.choices[row];
    
    for (AMYStorySnippets *snippet in self.branchingOptions)
    {
        if (snippet.snippetIndexNumber == selectedChoice.followingSnippet)
        {
            [self.snippets insertObject:snippet atIndex:1];
        }
    }
    //    self.totalCost += selectedChoice.price;
    //    self.itemTally += selectedChoice.numberOfItem;
    
    [self.snippets removeObjectAtIndex:0];
    if (!self.snippets.count && self.endingTriggered == NO)
    {
        //        CGFloat priceInDollars = self.totalCost / 100.0;
        //        AMYStorySnippets *statPage = [[AMYStorySnippets alloc] init];
        //        statPage.flavorText = [NSString stringWithFormat:@"Today at the grocery store, you bought %lu items, and spent a total of $%.2f.", self.itemTally, priceInDollars];
        //        [self.snippets addObject:statPage];
        
        AMYStorySnippets *conclusion = [[AMYStorySnippets alloc] init];
        conclusion.flavorText = @"You've reached the end.";
        [self.snippets addObject:conclusion];
        
        self.endingTriggered = YES;
    }
    
    //if we're at the register, take the total price and have the cashier ask for that much.  add this scene into the story.
    //for now, just add a page at the end that says how much you spent and how many items you bought
    
    //the choice index number can be used to figure out which of the appropriate snippets to show next
    
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
