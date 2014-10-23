//
//  loginSuccessViewController.h
//  Login&Logout
//
//  Created by Luck Lui on 11/9/14.
//  Copyright (c) 2014 Rabeanco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rabViewController.h"

@interface loginSuccessViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) NSDictionary *PassingData;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
- (IBAction)updateInfo:(id)sender;
- (IBAction)backGroundReturn:(id)sender;


@end
