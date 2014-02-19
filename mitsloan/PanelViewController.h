//
//  PanelViewController.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/15/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedbackViewController.h"

@interface PanelViewController : UIViewController <UITableViewDataSource>
{
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *blurbLabel;
    IBOutlet UILabel *locationLabel;
    IBOutlet UILabel *speakersLabel;
    IBOutlet UITableView *panelistsView;
    IBOutlet UIButton *feedbackButton;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *blurb;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSArray *panelists;
@property (strong, retain) IBOutlet UILabel *timeLabel;
@property (strong, retain) IBOutlet UILabel *blurbLabel;
@property (strong, retain) IBOutlet UILabel *locationLabel;
@property (strong, retain) IBOutlet UILabel *speakersLabel;
@property (strong, nonatomic) IBOutlet UITableView *panelistsView;
@property (strong, nonatomic) IBOutlet UIButton *feedbackButton;

-(IBAction)sendFeedback;

@end
