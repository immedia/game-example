//
//  ViewController.h
//  CodeJamGame1
//
//  Created by Jitesh Nunnan on 2013/08/16.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;

- (IBAction)goButtonPressed:(id)sender;

@end
