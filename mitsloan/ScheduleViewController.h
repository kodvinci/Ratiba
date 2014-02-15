//
//  FirstViewController.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UIViewController <UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
}

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *scheduleArray;

@end
