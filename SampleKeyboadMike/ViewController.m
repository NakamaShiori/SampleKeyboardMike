//
//  ViewController.m
//  SampleKeyboadMike
//
//  Created by N on 2015/05/08.
//  Copyright (c) 2015年 Nakama. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>{
    IBOutlet UITextField *textfield;
    IBOutlet UILabel *label_question;
    IBOutlet UILabel *label;
    IBOutlet UILabel * label_seikai;
    NSArray *questions;
    NSString *question_current;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    questions =  @[@"hello",
                 @"how are you",
                 @"i'm fine thank you"];
    int ran = arc4random()%questions.count;
    question_current = questions[ran];
    label_question.text = questions[ran];
    textfield.delegate = self;
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    label.text = string;
    [textfield resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([label.text isEqualToString:question_current]) {
        label_seikai.text = @ "Great!";
        //NextQuestion
        int ran = arc4random()%questions.count;
        question_current = questions[ran];
        label_question.text = questions[ran];
    }else{
        label_seikai.text = @ "Try again!";
    }
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textfield resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
