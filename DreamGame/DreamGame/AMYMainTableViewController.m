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
    
    AMYStorySnippets *prologueHeader = [[AMYStorySnippets alloc] initWithFlavorText:@"Prologue: The Dream" indexNumber:0];
    
    prologueHeader.choice1 = [[AMYChoice alloc] initWithIndexNumber:1 text:@"Begin"];
    [prologueHeader.choices addObject:prologueHeader.choice1];
    
    AMYStorySnippets *prologue00 = [[AMYStorySnippets alloc] initWithFlavorText:@"The room spins around you.  The bubbly drink in your hand feels like it’s going straight to your" indexNumber:00 choice1:@"head" choice2:@"smile" choice3:@"hips"];
    
    prologue00.choice4 = [[AMYChoice alloc] initWithIndexNumber:4 text:@"eyes"];
    prologue00.choice5 = [[AMYChoice alloc] initWithIndexNumber:5 text:@"feet"];
    prologue00.choice6 = [[AMYChoice alloc] initWithIndexNumber:6 text:@"tongue"];
    
    [prologue00.choices addObject:prologue00.choice4];
    [prologue00.choices addObject:prologue00.choice5];
    [prologue00.choices addObject:prologue00.choice6];
    
    //    AMYStorySnippets *prologue00c00 = [[AMYStorySnippets alloc] initWithFlavorText:@"You feel pleasantly dizzy, enough to lighten your thoughts and make you feel like you’re floating around the room.  In fact, you’re hardly thinking at all, instead living very much in the present.  And what a present it is!  A large hall, filled with luxuries and the finest of society; you among them, wearing your very best, feeling like a spectacle at this elegant celebration. +++indulgent" indexNumber:0000];
    //    AMYStorySnippets *prologue00c01 = [[AMYStorySnippets alloc] initWithFlavorText:@"There must be some converse relation between the two; the more of the sweet drink you consume, the wider your smile becomes.  Every direction you look, there are people, conversing in low, jewel-bright tones; they glance back at you and also smile.  You touch all the others in their tunics and gowns, their jackets and veils, with your smile, and feel like the most important person in the world right now. +++persuasive" indexNumber:0001];
    //    AMYStorySnippets *prologue00c02 = [[AMYStorySnippets alloc] initWithFlavorText:@"All you feel like right now is dancing.  A few others nearby are swaying as well, and you waltz over to join them.  Music plays smoothly from a balcony above, a counterpoint to the susurration of conversation from those around you.  Their words blend together, creating melodies and harmonies that, when you let your mind float inside it, you swear you can hear the rhythm to.  It’s a catching rhythm, and all you want to do is dance, dance… twirl and leap to the music of the room until you float into the air.  Tonight, it all seems possible. +++romantic" indexNumber:0002];
    //    AMYStorySnippets *prologue00c03 = [[AMYStorySnippets alloc] initWithFlavorText:@"The more you drink, the hazier the room becomes, the colors and faces all swirling together into one mass of glorious celebration.  How lucky you are to be here!  Sounds and smells all mesh into one, and as you sip on your sweet beverage you feel the sights mingling into the mix as well, until you swear you can smell the music of the orchestra, a lovely floral bouquet of strings and horns; the aromas coming from the banquet tables rising like colored smoke; the guests in their finery of red and gold like a waterfall in the eaves,  their dancing like the roar of a train down a crevasse, a waved golden ticket like the ringing of a bell… +++whimsical" indexNumber:0003];
    //    AMYStorySnippets *prologue00c04 = [[AMYStorySnippets alloc] initWithFlavorText:@"You feel like you’re gliding around the massive hall, floating on the plush red carpet.  You hardly make a noise, as though the air itself is cushioning your body, an invisible cape that nonetheless tells everyone around that you are someone worth power, a shaper of the world.  You make your way through groups and couples over to the hardened stone of the dance floor, polished and surprisingly forgiving in the warm, golden light.  There you take a partner and the two of you whirl around, secrets and the hum of mischief fluttering around like the wings of a bat.  The most wondrous way to spend an evening, and the best night you’ve had in awhile… +++subtle/graceful" indexNumber:0004];
    //    AMYStorySnippets *prologue00c05 = [[AMYStorySnippets alloc] initWithFlavorText:@"Words trip more and more easily off the more of the sweet drink you consume, as though the bubbles carry each idea straight from your heart to the ears of your listeners.  The revelers laugh and applaud your witticisms, and as you delight the small crowd around you your only thought is a fleeting wish that you will recall all of these words tomorrow so that others can be so taken with everything you say. +++witty" indexNumber:0005];
    
    AMYStorySnippets *fillerSnippet = [[AMYStorySnippets alloc] initWithFlavorText:@"Your choice goes here." indexNumber:9999];
    
    AMYStorySnippets *prologue01 = [[AMYStorySnippets alloc] initWithFlavorText:@"Time passes as it would in a dream, all the highlights a single moment with nothing in between." indexNumber:01];
    
    AMYStorySnippets *prologue02 = [[AMYStorySnippets alloc] initWithFlavorText:@"You remember laughter, dancing, chatter, but none of it your own.  There was the swish of satin skirts, the spread of arms between groups like morphing webs trapping individuals into conversations, where eyebrows thick and thin would showcase a range of expression unseen any day before now." indexNumber:02];
    
    AMYStorySnippets *prologue03 = [[AMYStorySnippets alloc] initWithFlavorText:@"You take it all in, breathing in the dust falling from the ceiling, coming in from the hallways, which seemed more like tunnels the longer the night went on." indexNumber:03];
    
    AMYStorySnippets *prologue04 = [[AMYStorySnippets alloc] initWithFlavorText:@"From those dark tunnels, once gold and red like everything else in this grand hall, came the smell of something like burnt tea, billowed by smoke.  Motes of dust and hair filtered through the crowds." indexNumber:04];
    
    AMYStorySnippets *prologue05 = [[AMYStorySnippets alloc] initWithFlavorText:@"Just as the first bouts of coughing began, a line started to form outside of a small room.  “Free dream!” a man shouted, his cry taken up by everyone queued.  “Free dream, free dream!”  The cries were wails and shrieks, nearly deafening despite how calm those on line looked.  They waited patiently, the room they slowly gained access to bright and beckoning.  Dream!  You love dream!" indexNumber:05 choice1:@"I do love dream. #hadDreamBefore" choice2:@"I normally don’t, but today feels like the best day to have some. #firstTimeDream" choice3:@"I don’t believe it."];
    
    AMYStorySnippets *prologue06 = [[AMYStorySnippets alloc] initWithFlavorText:@"Nearly everyone in the room is now queued up, the line snaking out of the small room and around the perimeter, those under the balconies falling into the flickering shadow of the candlelights. " indexNumber:05 choice1:@"Join the line." choice2:@"Cut the line." choice3:@"Investigate the room."];
    
    self.snippets = [@[ /*prologueHeader,*/ prologue00/*, fillerSnippet, prologue01, prologue02, prologue03, prologue04, prologue05, fillerSnippet, prologue06, fillerSnippet */] mutableCopy];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger numberOfSections = 1;
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
    //this should have an if-statment which says 'if we're in section 0, only one cell, if 1 do snippet.choices.count'
    //i can also split the text into sentences/paragraphs and have them be a new tableView cell
    return numberOfSections;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (section == 0)
    {
        AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
        cell.textLabel.text = snippet.flavorText;
        cell.detailTextLabel.hidden = YES;
        cell.textLabel.numberOfLines = 0;
        cell.userInteractionEnabled = NO;
    }
    else if (section == 1)
    {
        AMYStorySnippets *snippet = [self.snippets firstObject];
         AMYChoice *choice = snippet.choices[(NSUInteger)row];
         
         cell.textLabel.text = choice.text;
         cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", choice.indexNumber];
    }
    
    
    
    //if I have two sections instead of just one, the first can contain the snippet itself, and the second the choices/continue.  So if we're in section 0, attribute that text to the cell's text.  If we're in section 1, self.snippets[section--] to get the appropriate snippet, and then list all of the choices in the cells.
    //Hopefully that will work.
    
    return cell;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    AMYStorySnippets *snippet = self.snippets[(NSUInteger)section];
    NSString *name = snippet.flavorText;
    
    return name;
}
 */

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
    
    //the choice index number can be used to figure out which of the appropriate snippets to show next
    
    [self.tableView reloadData];
}


/*
 some things to do:
 make AMYChoice take in 6 choice options, but if you leave a few blank, they are not counted
 make custom cell above current one to hold all story text, or find a way to make the section headers larger
 figure out a way to store the story snippets somewhere other than here
 when choice is chosen, provide the correct next snippet
 embed in a tab bar and start the character page, where the inventory will live, basic information (name, current location, a little about the place as you've learned, a little about yourself that you've learned), relationships (potentially)
 set up story method... something to pass to the tableViewController every time, I guess.  to start i can probably just have one for like the six snippets i've got, do a generic storySetup method like i have colorSetup and gameSetup methods in colorMatch.
 */

@end
