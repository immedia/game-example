//
//  ViewController.m
//  CodeJamGame1
//
//  Created by Jitesh Nunnan on 2013/08/16.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSString *answer;
@property NSInteger score, timeRemaining;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.score = 0;
  self.timeRemaining = 20;
  self.scoreLabel.text = [NSString stringWithFormat:@"%i", self.score];
  self.timeLabel.text = [NSString stringWithFormat:@"%i", self.timeRemaining];
  
  [self performSelector:@selector(changeTime) withObject:self afterDelay:1.0];  
  [self changeQuestionLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButtonPressed:(id)sender {
  if ([self.answerTextField.text isEqualToString:self.answer]) {
    self.view.backgroundColor = [UIColor greenColor];
    self.score = self.score + 10;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", self.score];
  } else {
    self.view.backgroundColor = [UIColor redColor];
  }
  self.answerTextField.text = @"";
  [self changeQuestionLabel];  
}

- (void)changeQuestionLabel {
  int firstNumber = arc4random() % 100;
  int secondNumber = arc4random() % 100;
  self.answer = [NSString stringWithFormat:@"%i", firstNumber + secondNumber];
  NSLog(@"answer %@", self.answer);
  self.questionLabel.text = [NSString stringWithFormat:@"%i + %i", firstNumber, secondNumber];
}

- (void)changeTime {
  self.timeRemaining = self.timeRemaining - 1;
  self.timeLabel.text = [NSString stringWithFormat:@"%i", self.timeRemaining];
  if (self.timeRemaining > 0) {
    [self performSelector:@selector(changeTime) withObject:self afterDelay:1.0];
  } else {
    [self.goButton setEnabled:NO];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CodeJam" message:[NSString stringWithFormat:@"Your score is %i", self.score] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,  nil];
    [alert show];
  }
}

@end
