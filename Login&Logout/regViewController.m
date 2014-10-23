//
//  regViewController.m
//  Login&Logout
//
//  Created by Luck Lui on 17/9/14.
//  Copyright (c) 2014 Rabeanco. All rights reserved.
//

#import "regViewController.h"

@interface regViewController ()
@property (weak, nonatomic) IBOutlet UITextField *regUsername;
@property (weak, nonatomic) IBOutlet UITextField *regPassword;
@property (weak, nonatomic) IBOutlet UITextField *regEmail;
- (IBAction)register:(id)sender;

@end

@implementation regViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)register:(id)sender {
    
    
   /*
    NSString *id = [self.PassingData objectForKey:@"id"];
    
    NSInteger success = 0;
    NSString *post =[[NSString alloc] initWithFormat:@"id=%@&username=%@&password=%@&email=%@",id,[self.txtUsername text],[self.txtPassword text],[self.txtEmail text]];
    NSLog(@"UpdatePostData: %@",post);
    
    NSURL *url=[NSURL URLWithString:@"http://192.168.12.11/updateInfo.php"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %ld", (long)[response statusCode]);
    
  
        */
    
    }
    
    
    -(BOOL)textFieldShouldReturn:(UITextField *)textField{
        
        [textField resignFirstResponder];
        return YES;
        
    }
    
    - (IBAction)backGroundReturn:(id)sender {
        [self.view endEditing:YES];
    }
   
    
    - (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:msg
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
        alertView.tag = tag;
        [alertView show];
        
        
        
        
    }

@end
