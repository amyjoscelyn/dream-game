//
//  AMYMainTableViewController.m
//  DreamGame
//
//  Created by Amy Joscelyn on 1/19/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

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
    
    //    AMYStorySnippets *introduction = [[AMYStorySnippets alloc] init];
    //    AMYStorySnippets *middle = [[AMYStorySnippets alloc] init];
    //    AMYStorySnippets *end = [[AMYStorySnippets alloc] init];
    //
    //    introduction.flavorText = @"This is the introduction to the story.";
    //    middle.flavorText = @"This is the middle of the story!";
    //    end.flavorText = @"And this is the end.";
    //
    //    introduction.choice1 = @"Choice 1";
    //    introduction.choice2 = @"Choice 2";
    //    introduction.choice3 = @"Choice 3";
    //    introduction.choice4 = @"Choice 4";
    //    introduction.choice5 = @"Choice 5";
    //    introduction.choices = @[ introduction.choice1, introduction.choice2, introduction.choice3, introduction.choice4, introduction.choice5 ];
    //
    //    middle.choice1 = @"One";
    //    middle.choice2 = @"Two";
    //    middle.choice3 = @"Three";
    //    middle.choices = @[ middle.choice1, middle.choice2, middle.choice3 ];
    //
    //    end.choice1 = @"A";
    //    end.choice2 = @"B";
    //    end.choice3 = @"C";
    //    end.choice4 = @"D";
    //    end.choice5 = @"E";
    //    end.choice6 = @"F";
    //    end.choices = @[ end.choice1, end.choice2, end.choice3, end.choice4, end.choice5, end.choice6 ];
    
    //    self.snippets = [@[ introduction, middle, end ] mutableCopy];
    
    AMYStorySnippets *prologueHeader = [[AMYStorySnippets alloc] initWithFlavorText:@"Prologue: The Dream" indexNumber:0];
    AMYStorySnippets *prologue00 = [[AMYStorySnippets alloc] initWithFlavorText:@"The room spins around you.  The bubbly drink in your hand feels like it’s going straight to your" indexNumber:00 choice1:@"head" choice2:@"smile" choice3:@"hips"];
    
    prologue00.choice4 = [[AMYChoice alloc] initWithIndexNumber:4 text:@"eyes"];
    prologue00.choice5 = [[AMYChoice alloc] initWithIndexNumber:5 text:@"feet"];
    prologue00.choice6 = [[AMYChoice alloc] initWithIndexNumber:6 text:@"tongue"];
    
    prologue00.choice4IndexNumber = 4;
    prologue00.choice4IndexNumber = 5;
    prologue00.choice4IndexNumber = 6;
    
    [prologue00.choices addObject:prologue00.choice4];
    [prologue00.choices addObject:prologue00.choice5];
    [prologue00.choices addObject:prologue00.choice6];
    
    AMYStorySnippets *prologue00c00 = [[AMYStorySnippets alloc] initWithFlavorText:@"You feel pleasantly dizzy, enough to lighten your thoughts and make you feel like you’re floating around the room.  In fact, you’re hardly thinking at all, instead living very much in the present.  And what a present it is!  A large hall, filled with luxuries and the finest of society; you among them, wearing your very best, feeling like a spectacle at this elegant celebration. +++indulgent" indexNumber:0000];
    AMYStorySnippets *prologue00c01 = [[AMYStorySnippets alloc] initWithFlavorText:@"There must be some converse relation between the two; the more of the sweet drink you consume, the wider your smile becomes.  Every direction you look, there are people, conversing in low, jewel-bright tones; they glance back at you and also smile.  You touch all the others in their tunics and gowns, their jackets and veils, with your smile, and feel like the most important person in the world right now. +++persuasive" indexNumber:0001];
    AMYStorySnippets *prologue00c02 = [[AMYStorySnippets alloc] initWithFlavorText:@"All you feel like right now is dancing.  A few others nearby are swaying as well, and you waltz over to join them.  Music plays smoothly from a balcony above, a counterpoint to the susurration of conversation from those around you.  Their words blend together, creating melodies and harmonies that, when you let your mind float inside it, you swear you can hear the rhythm to.  It’s a catching rhythm, and all you want to do is dance, dance… twirl and leap to the music of the room until you float into the air.  Tonight, it all seems possible. +++romantic" indexNumber:0002];
    AMYStorySnippets *prologue00c03 = [[AMYStorySnippets alloc] initWithFlavorText:@"The more you drink, the hazier the room becomes, the colors and faces all swirling together into one mass of glorious celebration.  How lucky you are to be here!  Sounds and smells all mesh into one, and as you sip on your sweet beverage you feel the sights mingling into the mix as well, until you swear you can smell the music of the orchestra, a lovely floral bouquet of strings and horns; the aromas coming from the banquet tables rising like colored smoke; the guests in their finery of red and gold like a waterfall in the eaves,  their dancing like the roar of a train down a crevasse, a waved golden ticket like the ringing of a bell… +++whimsical" indexNumber:0003];
    AMYStorySnippets *prologue00c04 = [[AMYStorySnippets alloc] initWithFlavorText:@"You feel like you’re gliding around the massive hall, floating on the plush red carpet.  You hardly make a noise, as though the air itself is cushioning your body, an invisible cape that nonetheless tells everyone around that you are someone worth power, a shaper of the world.  You make your way through groups and couples over to the hardened stone of the dance floor, polished and surprisingly forgiving in the warm, golden light.  There you take a partner and the two of you whirl around, secrets and the hum of mischief fluttering around like the wings of a bat.  The most wondrous way to spend an evening, and the best night you’ve had in awhile… +++subtle/graceful" indexNumber:0004];
    AMYStorySnippets *prologue00c05 = [[AMYStorySnippets alloc] initWithFlavorText:@"Words trip more and more easily off the more of the sweet drink you consume, as though the bubbles carry each idea straight from your heart to the ears of your listeners.  The revelers laugh and applaud your witticisms, and as you delight the small crowd around you your only thought is a fleeting wish that you will recall all of these words tomorrow so that others can be so taken with everything you say. +++witty" indexNumber:0005];
    
    self.snippets = [@[ prologueHeader, prologue00 ] mutableCopy];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
    NSUInteger numberOfChoices = snippet.choices.count;
    
    if (!numberOfChoices)
    {
        if (![snippet.flavorText isEqualToString:@"You've reached the end."])
        {
            snippet.choices = [[NSMutableArray alloc] init];
            snippet.choice1 = [[AMYChoice alloc] initWithIndexNumber:0 text:@"Continue"];
            [snippet.choices addObject:snippet.choice1];
            
            numberOfChoices++;
        }
    }
    
    return (NSInteger)numberOfChoices;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
    AMYChoice *choice = snippet.choices[(NSUInteger)row];
    
    cell.textLabel.text = choice.text;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", choice.indexNumber];
    
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
    
    //the detail
    
    [self.tableView reloadData];
}

@end
