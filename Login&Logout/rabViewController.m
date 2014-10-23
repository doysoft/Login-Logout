//
//  rabViewController.m
//  Login&Logout
//
//  Created by Luck Lui on 10/9/14.
//  Copyright (c) 2014 Rabeanco. All rights reserved.
//

#import "rabViewController.h"

@interface rabViewController ()

@end

@implementation rabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;

}

- (IBAction)backGroundReturn:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)login:(id)sender {
    
    
    NSInteger success = 0;
    @try {
        
        if([[self.userName text] isEqualToString:@""] || [[self.passWord text] isEqualToString:@""] ) {
            
            [self alertStatus:@"Please enter Username and Password" :@"Sign in Failed!" :0];
            
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",[self.userName text],[self.passWord text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://192.168.12.11/simplelogin.php"];
            
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
            
         //   NSLog(@"Response code: %ld", (long)[response statusCode]);
            
            if ([response statusCode] >= 200 && [response statusCode] < 300)
            {
                
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                //NSLog(@"Response ==> %@", responseData);
                
                NSError *error = nil;
                NSDictionary *jsonData = [NSJSONSerialization
                                          JSONObjectWithData:urlData
                                          options:NSJSONReadingMutableContainers
                                          error:&error];
                
                
                
                
                success = [jsonData[@"id"] integerValue];
                
              //  NSLog(@"%@",jsonData);
                
               
              //  NSLog(@"Success: %ld",(long)success);
                
                if(success > 0 )
                {
                    NSLog(@"Login SUCCESS");
                    self.isLoginSuccess = YES;
                    self.dbData = jsonData;
                
                } else {
                    
                   // NSString *error_msg = (NSString *) jsonData[@"error_message"];
                    [self alertStatus:@"Login Failed." :@"Sign in Failed!" :0];
                }
                
            } else {
                //if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Connection Failed" :@"Sign in Failed!" :0];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
    if (success) {
        
        
       // [self performSegueWithIdentifier:@"login_success" sender:self];
        //[self alertStatus:@"" :@"Login Success!" :0];
        
        
      //  [self longSuccess:NULL];
        //[self prepareForSegue:<#(UIStoryboardSegue *)#> sender:<#(id)#>];
    }
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

-(void)longSuccess:(id)sender{

[self alertStatus:@"" :@"Login Success!" :0];
}

- (IBAction)register:(id)sender {
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{

    if ([identifier isEqualToString:@"sc" ]) {
    
        return self.isLoginSuccess;
      
    }

    //self prepareForSegue:<#(UIStoryboardSegue *)#> sender:<#(id)#>
    
    return YES;



}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"sc"]){
        loginSuccessViewController *controller = (loginSuccessViewController *)segue.destinationViewController;
        //controller.txtUsername.text = self.userName.text;
        //controller.txtPassword.text = self.passWord.text;
        //[controller set]
        
        //[controller setValuesForKeysWithDictionary:];
        //controller.Passingdata;
        
        //[controller setPassingData:(NSString *)];
        
       // [controller setPassingData:self.dbData];
        
     //   NSLog(@"%@===>",self.dbData);
        
        controller.PassingData = self.dbData;
        
        
        NSLog(@"prepareForSegue has been called.");
    }
    
     
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"lgSc"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        loginSuccessViewController *controller = (loginSuccessViewController *)navController.topViewController;
        controller.txtUsername.text = self.userName.text;
    }
}*/
@end
