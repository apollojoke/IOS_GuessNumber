//
//  LJViewController.h
//  GuessNumber
//
//  Created by twer on 8/14/14.
//  Copyright (c) 2014 Jun Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJViewController : UIViewController <UITextFieldDelegate>

@property IBOutlet UITextField *inputNumber;
@property IBOutlet UILabel *result;
@property IBOutlet UILabel *count;
@property IBOutlet UIButton *guess;

@end
