//
//  LJViewController.m
//  GuessNumber
//
//  Created by twer on 8/14/14.
//  Copyright (c) 2014 Jun Lee. All rights reserved.
//

#import "LJViewController.h"
#define MAX_NUMBER 99

@interface LJViewController ()

@end

@implementation LJViewController{
    int count;
    int randNum;
    NSString *lastNumber;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _inputNumber.delegate=self;
    
    count = 0;
    lastNumber = @"";
    randNum = arc4random() % (MAX_NUMBER + 1);
    
    
    // [self.view setBackgroundColor:[UIColor redColor]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doGuess{
    if ([_inputNumber.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"注意" message:@"请先输入一个数字" delegate:self cancelButtonTitle:@"遵命" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    else{
        if ([_inputNumber.text isEqualToString:lastNumber]){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"注意" message:@"请先输入一个不同的数字" delegate:self cancelButtonTitle:@"遵命" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
        count ++;
        _count.text = [NSString stringWithFormat:@"你猜了%d次。",count];
        lastNumber = _inputNumber.text;
        int result = [self compareNumber:_inputNumber.text];
        
        if(result > 0){
            _result.text = @"大了";
        }
        else if(result < 0){
            _result.text = @"小了";
        }
        else{
            _result.text = @"binglo";
            [self reset];
            count = 0;
            lastNumber = @"";
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    if (textField.text.length>1) {
        return NO;
    }
    return YES;
}
-(int)compareNumber :(NSString *) input{
    if([input intValue] > randNum){
        return 1;
    }
    if([input intValue] < randNum){
        return -1;
    }
    return 0;
}
-(void)reset{
    count = 0;
    randNum = arc4random() % (MAX_NUMBER + 1);
    _inputNumber.text = @"";
}

@end
