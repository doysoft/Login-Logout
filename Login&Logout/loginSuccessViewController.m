//
//  loginSuccessViewController.m
//  Login&Logout
//
//  Created by Luck Lui on 11/9/14.
//  Copyright (c) 2014 Rabeanco. All rights reserved.
//

#import "loginSuccessViewController.h"

@interface loginSuccessViewController ()

@end

@implementation loginSuccessViewController

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
    //self.txtUsername.text=
   
    NSLog(@"Here is login !!!");
    
    
   // NSLog(@"%@",self.PassingData);
    
    NSDictionary *revData = self.PassingData;
    
    self.txtUsername.text = revData[@"username"];
    self.txtPassword.text = revData[@"password"];
    self.txtEmail.text = revData[@"email"];
    
    
   // [myObject isKindOfClass:[NSString class]];
    
    
    //self.txtPassword.text = [self.PassingData:@"password"];
    
    
    
    
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


- (IBAction)updateInfo:(id)sender {
    
   // NSDictionary *revData = self.PassingData;
    
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
    
    
    if ([response statusCode] >= 200 && [response statusCode] < 300)
    {
        
        NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"Response ==> %@", responseData);
        
        NSError *error = nil;
        NSDictionary *jsonData = [NSJSONSerialization
                                  JSONObjectWithData:urlData
                                  options:NSJSONReadingMutableContainers
                                  error:&error];
        
        
        
        
        success = [jsonData[@"success"] integerValue];
        
        NSLog(@"%@",jsonData);
        
        
        NSLog(@"Success: %ld",(long)success);
        
        if(success > 0 )
        {
            NSLog(@"Login SUCCESS");
           [self alertStatus:@"" :@"Update Success!" :0];
            
        } else {
            
            // NSString *error_msg = (NSString *) jsonData[@"error_message"];
            [self alertStatus:@"Update Failed." :@" Failed!" :0];
        }
    }
    
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
