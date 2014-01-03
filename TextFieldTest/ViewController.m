//
//  ViewController.m
//  TextFieldTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController
// 편집 상태 승인 여부
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (2 == textField.tag) {
        return NO;
    }
    return YES;
}

// 리턴키로 키보드 감추기
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"INPUT : %@", textField.text);
    [textField resignFirstResponder];
    return YES;
}

// z키 입력 불가
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 대소문자 구분없이 비교
    if (3 == textField.tag && NSOrderedSame == [string compare:@"z" options:NSCaseInsensitiveSearch]) {
        return NO;
    }
    return YES;
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.textField resignFirstResponder];
}

-(void)viewDidAppear:(BOOL)animated {
    [self.textField becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 레이블
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 0, 0)];
    label.text = @"Z 입력 금지";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [self.view addSubview:label];
    
    // 텍스트 필드 객체 생성
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(130, 276, 170, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.tag = 3;
    
    // 뷰 구조에 추가
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
