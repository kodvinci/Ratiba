//
//  FirstViewController.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PanelViewController.h"
#import "Panel.h"
#import "PanelsManager.h"

@interface ScheduleViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *scheduleView;
}

@property (strong, nonatomic) UITableView *scheduleView;
@property (strong, nonatomic) NSArray *scheduleArray;

@end
