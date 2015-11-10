//
//  AMYStoryTableViewController.m
//  DreamGame
//
//  Created by Amy Joscelyn on 11/10/15.
//  Copyright © 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYStoryTableViewController.h"
#import "AMYStoryTableViewCell.h"

@interface AMYStoryTableViewController ()

@property (nonatomic, strong) NSMutableArray *arrayOfStorySnippets;

@end

@implementation AMYStoryTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.arrayOfStorySnippets = [[NSMutableArray alloc] init];
    
    NSString *prologueSnippet = @"The room spins around you.  The bubbly drink in your hand feels like it’s going straight to your";
    NSString *choice0001 = @"head";
    NSString *choice0002 = @"smile";
    NSString *choice0003 = @"hips";
    NSString *choice0004 = @"eyes";
    NSString *choice0005 = @"feet";
    NSString *choice0006 = @"tongue";
    
    [self.arrayOfStorySnippets addObject:prologueSnippet];
    [self.arrayOfStorySnippets addObject:choice0001];
    [self.arrayOfStorySnippets addObject:choice0002];
    [self.arrayOfStorySnippets addObject:choice0003];
    [self.arrayOfStorySnippets addObject:choice0004];
    [self.arrayOfStorySnippets addObject:choice0005];
    [self.arrayOfStorySnippets addObject:choice0006];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfStorySnippets.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AMYstoryCell" forIndexPath:indexPath];
//    
//    NSUInteger row = indexPath.row;
//    NSString *storySnippet = self.arrayOfStorySnippets[row];
//    
//    cell.textLabel.text = storySnippet;
//    
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self basicCellAtIndexPath:indexPath];
}

- (AMYStoryTableViewCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath
{
    AMYStoryTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"AMYstoryCell" forIndexPath:indexPath];
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureBasicCell:(AMYStoryTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSString *storySnippet = self.arrayOfStorySnippets[indexPath.row];
    cell.storyCellLabel.text = storySnippet;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForBasicCellAtIndexPath:indexPath];
}

- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath
{
    static AMYStoryTableViewCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:@"AMYstoryCell"];
    });
    
    [self configureBasicCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //hmm...
}

/*
 If I were to make the unselectable chunks of text textViews instead of Labels, I can turn their interactiveness off.
 Then I should be able to make the clickable ones...
 No.
 They're all cells.  Cells are clickable.  Ugh.  This is much harder than I anticipated, and I anticipated this to be pretty difficult to pull off.
 */

@end
