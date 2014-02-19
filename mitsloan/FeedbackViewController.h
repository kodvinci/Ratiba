//
//  FeedbackViewController.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackViewController : UIViewController
{
    IBOutlet UILabel *feedbackLabel;
    IBOutlet UITextView *feedbackView;
    IBOutlet UIButton *feedbackButton;
}

@property(nonatomic, retain) UILabel *feedbackLabel;
@property(nonatomic, retain) UITextView *feedbackView;
@property(nonatomic, retain) UIButton *feedbackButton;

-(IBAction)submitFeedback;

@end
