//
//  FirstViewController.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "ScheduleViewController.h"

@implementation ScheduleViewController

@synthesize tableView;
@synthesize scheduleArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.scheduleArray = [[NSArray alloc] initWithObjects:
                        @"Always put your fears behind you ...",
                        @"A relationship with no trust is like ...",
                        @"People should stop talking about their problem ...",
                        @"Dear Chuck Norris, Screw you ...",
                        @"My arms will always be open for you ...",
                        nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.scheduleArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSString *panel = [self.scheduleArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:panel];
    [cell.detailTextLabel setText:@"wakati fulani"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PanelViewController *panelView = [self.storyboard instantiateViewControllerWithIdentifier:@"PanelViewController"];
    panelView.blurb = [self.scheduleArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:panelView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
