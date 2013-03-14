//
//  BNRViewController.m
//  Quiz
//
//  Created by Bolot Kerimbaev on 3/14/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRViewController.h"

@interface BNRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *answerLabels;
@property (strong, nonatomic) NSArray *quiz;
@property (assign, nonatomic) NSUInteger currentQuestionIndex;
@end

@implementation BNRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // [self setQuiz:@[....]];
    _quiz = @[];
    self.quiz = @[
                  @{@"question": @"What is your favorite color?",
                    @"answers" : @[@"blue", @"red", @"white", @"all of the above"],
                    @"correct" : @1},
                  @{@"question": @"What is the fastest animal?",
                    @"answers" : @[@"daredevil", @"cheetah", @"narval", @"chuck norris"],
                    @"correct" : @1}
                  ];
    self.currentQuestionIndex = 0;
    [self displayQuizQuestion];
}

- (void)displayQuizQuestion
{
    // [[self quiz] objectAtIndex:[self currentQuestionIndex]]
    NSDictionary *question = self.quiz[self.currentQuestionIndex];
    NSArray *answers = question[@"answers"];
    for (UILabel *answerLabel in self.answerLabels) {
        answerLabel.text = answers[answerLabel.tag];
    }
    self.questionLabel.text = question[@"question"];
    self.resultLabel.text = @"";

}

- (IBAction)answerSelected:(id)sender {
    UIButton *button = sender;
    NSLog(@"tag is %d", button.tag);
    NSDictionary *question = self.quiz[self.currentQuestionIndex];
    if (button.tag == [question[@"correct"] intValue]) {
        self.resultLabel.text = @"Correct!";
    } else {
        self.resultLabel.text = @"Incorrect";
    }
}

- (IBAction)nextQuestion:(id)sender {
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == [self.quiz count]) {
        self.currentQuestionIndex = 0;
    }
    [self displayQuizQuestion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
