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

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    NSString *csvPath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"csv"];
//    NSString *csvFile = [NSString stringWithContentsOfFile:csvPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString *csvPath = [[NSBundle mainBundle] pathForResource:@"a-grocery-trip" ofType:@"csv"];
    NSURL *csvURL = [NSURL fileURLWithPath:csvPath];
    NSMutableArray *csvRows = [[NSArray arrayWithContentsOfCSVURL:csvURL options:CHCSVParserOptionsSanitizesFields] mutableCopy];
    
    self.snippets = [[NSMutableArray alloc] init];
    
    [csvRows removeObjectAtIndex:0];
    
    for (NSUInteger i = 0; i < csvRows.count; i++)
    {
        NSArray *rawSnippet = csvRows[i];
        NSInteger indexNumber = [rawSnippet[0] integerValue];
        
        AMYStorySnippets *snippet = [[AMYStorySnippets alloc] initWithFlavorText:rawSnippet[6] indexNumber:indexNumber choice1:rawSnippet[2] choice2:rawSnippet[3] choice3:rawSnippet[4] choice4:rawSnippet[5] choice5:@"" choice6:@""];
        
        [self.snippets addObject:snippet];
    }
    NSLog(@"there are %lu snippets", self.snippets.count);
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
                snippet.choice1 = [[AMYChoice alloc] initWithIndexNumber:0 text:@"Continue"];
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
    NSUInteger green = 135;
//    NSUInteger blue = 250;
//    NSUInteger purple = 300;
//    NSUInteger red = 359;
    
//    CGFloat textHue = lightGreen/359.0;
    CGFloat textHue = green/359.0;
//    CGFloat textHue = blue/359.0;
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
    [self.snippets removeObjectAtIndex:0];
    if (!self.snippets.count)
    {
        AMYStorySnippets *conclusion = [[AMYStorySnippets alloc] init];
        conclusion.flavorText = @"You've reached the end.";
        [self.snippets addObject:conclusion];
    }
    
    //the choice index number can be used to figure out which of the appropriate snippets to show next
    
    [self.tableView reloadData];
}


/*
 some things to do:
 make AMYStorySnippets take 6 options, or the highest amount of choices I provide
 figure out a way to store the story snippets somewhere other than here--set up in another class
 when choice is chosen, provide the correct next snippet
 embed in a tab bar and start the character page, where the inventory will live, basic information (name, current location, a little about the place as you've learned, a little about yourself that you've learned), relationships (potentially)
 set up story method... something to pass to the tableViewController every time, I guess.  to start i can probably just have one for like the six snippets i've got, do a generic storySetup method like i have colorSetup and gameSetup methods in colorMatch.
 make a branch of current master, called original-work or something, and then delete the AMYItems and Character and stuff for now.  I can always import them in later.
 make choices take a double tap--the selected one should be highlighted, so people know what they've chosen so it's never an accident.  this is important because there are no take backs.
 
 some generic stories I can provide with the template:
 going through a grocery store for adding items to inventory ('which aisle would you like to go into?' 'you see some items on the shelf in front of you.  which would you like to take?')
 if I have several snippets in a row sans choice, then they should all form at the same time--but not too many that the person needs to scroll.  I'll have to think about this.  When putting it in my outside file, I might need to include a couple snippets in one line, but split them with a different symbol... i don't know.
 */

/*
 I can use the nav bar's title space to show the location a person is in, the name of the person they're conversing with, and other important information like that (when you're in a shop, or the Exchange, it can tell you how much money you have... or when you're excavating your salvage lot, it can show you how much time has passed or is passing or how much energy you have left, or how much stuff there's detected to be... things like that).
 */

@end
