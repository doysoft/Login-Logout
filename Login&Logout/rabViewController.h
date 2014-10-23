//
//  rabViewController.h
//  Login&Logout
//
//  Created by Luck Lui on 10/9/14.
//  Copyright (c) 2014 Rabeanco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loginSuccessViewController.h"

@interface rabViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (nonatomic, strong) NSObject *dbData;
@property BOOL isLoginSuccess;

- (IBAction)backGroundReturn:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)longSuccess:(id)sender;
- (IBAction)register:(id)sender;
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@end
